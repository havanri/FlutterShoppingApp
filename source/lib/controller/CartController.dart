import 'package:get/get.dart';
import 'package:sheinshop/controller/UserController.dart';
import 'package:sheinshop/entity/Cart.dart';
import 'package:sheinshop/repository/CartRepositoryImp.dart';
import 'package:sheinshop/repository/ProductRepositoryImp.dart';

class CartController extends GetxController{
  var isLoading = true.obs;
  var listCart = [].obs;
  var listItemInCart=[].obs;
  var products = [].obs;
  var quantityProductInCart = 0.obs;
  Rx<double> total = 0.0.obs;
  var userId = UserController.session.value;
  var cartId = 0.obs;
  CartRepositoryImp repoCart = new CartRepositoryImp();
  ProductRepositoryImp repoProduct = new ProductRepositoryImp();

  @override
  void onInit() {
    //getAllCarts();
    newCartForNewUser();
    super.onInit();
  }
  void newCartForNewUser() async {
    var carts = await repoCart.getAllCarts();
    bool checkExistCartForUser=false;
    carts.forEach((element) {
      if(element.userId==userId){
        checkExistCartForUser=true;
      }
    });
    if(checkExistCartForUser==false){
      print("user moi chua co cart-------");
      var products = [];
      repoCart.addNewCart(userId,products);
      getCart();
    }
    else {
      getCart();
    }
    print("list cart"+listCart.length.toString());
  }
  void getAllCarts() async {
    try {
      isLoading(true);
      var carts = await repoCart.getAllCarts();
      if (carts != null) {
        listCart.value = carts;
        print(listCart.length.toString()+"--------");
        List<Cart> list = listCart.toJson();
        //List<dynamic> test = list as List<dynamic>;
        print("Độ dài list Cart:"+list.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }
  void getCart() async{
    listCart.value=await repoCart.getAllCarts();
    listCart.forEach((element) {
      if(element.userId==userId){
        cartId.value=element.id;
        print("Id của cart là"+cartId.value.toString());
      }
    });
    print("Cart:---------------"+cartId.toString());
    var cart = await repoCart.findCartById(cartId.value);
    if(cart.products != null){
      listItemInCart.value=cart.products;
      listItemInCart.forEach((element) {
        quantityProductInCart+=element["quantity"];
      });
      getTotal();
    }
  }
  void increment(int productId) async {
    var cart = await repoCart.findCartById(cartId.value);
    bool checkIssetProductInCart = false;
    cart.products.forEach((element) {
      //CHECK ID PRODUCT
      if(productId==element["productId"]){
        checkIssetProductInCart=true;
        int updatequantity=element["quantity"]+1;
        element["quantity"]=updatequantity;
        repoCart.updateCart(cart);
      }
    });
    //check isset product in cart
    if(checkIssetProductInCart==false){
      cart.products.add({
        "productId":productId,
        "quantity":1
      });
     // total+=element["quantity"];
      repoCart.updateCart(cart);
    }
    //refresh
    quantityProductInCart++;
    listItemInCart.value=cart.products;
    listItemInCart.refresh();
    getTotal();
  }
  void decrement(int productId) async {
    var cart = await repoCart.findCartById(cartId.value);
    bool checkremoveProduct1=false;
    cart.products.forEach((element) {
      //CHECK ID PRODUCT
      if(productId==element["productId"]){
        //xoa san pham khi san pham con 1
        if(element["quantity"]==1){
          //cart.products.remove(element);
          checkremoveProduct1=true;
        }
        //nguoc lai thi update
        else{
          int updatequantity=element["quantity"]-1;
          element["quantity"]=updatequantity;
          repoCart.updateCart(cart);
        }
      }
    });
    if(checkremoveProduct1==true){
      print("sản phẩm còn 1 nên xóa khỏi danh sách");
      cart.products.removeWhere((item) => item["productId"] == productId);
      repoCart.updateCart(cart);
    }
    //refresh
    quantityProductInCart--;
    listItemInCart.value=cart.products;
    print("listItem sau khi xóa: "+listItemInCart.length.toString());
    listItemInCart.refresh();
    getTotal();
  }
  void getTotal() async {
    //total.value=0;
    Rx<double> totalAll=0.0.obs;
    products.value= await repoProduct.getAllProducts();
    //Cart cart = await repoCart.findCartById(1);
    print(listItemInCart.length.toString());
    print(products.length.toString());
    listItemInCart.forEach((itemcart) {
      products.forEach((product) {
        if(itemcart["productId"]==product.id){
          totalAll+=itemcart["quantity"]*product.price;
        }
      });
    });
    total.value=totalAll.value;
    print(total.toString());
  }
}