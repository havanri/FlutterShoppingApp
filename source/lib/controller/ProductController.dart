import 'package:get/get.dart';
import 'package:sheinshop/entity/Product.dart';
import 'package:sheinshop/repository/CategoryRepositoryImpl.dart';
import 'package:sheinshop/repository/ProductRepositoryImp.dart';
import 'package:sheinshop/screen/SearchScreen.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var listProduct = [].obs;
  var listCateProduct = [].obs;

  //Category
  var listProductMen=[].obs;
  var listProductWoMen=[].obs;
  var listProductChildren=[].obs;
  //List seen
  var listProductSeenHere = [].obs;
  //Search
  var listSearch = [].obs;
  ProductRepositoryImp repoProduct = new ProductRepositoryImp();
  CategoryRepositoryImpl repoCate = new CategoryRepositoryImpl();
  @override
  void onInit() {
    getAllProducts();
    getProductByCategory();
    super.onInit();
  }

  void getAllProducts() async {
    try {
      isLoading(true);
      var products = await repoProduct.getAllProducts();
      if (products != null) {
        listProduct.value = products;
        List<Product> list = listProduct.toJson();
        //List<dynamic> test = list as List<dynamic>;
        print("Độ dài list Product:"+list.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }
  int checkParentId(int categoryId) {
    //print("---------");
    for(var i = 0;i<listCateProduct.length;i++){
      //check categoryid va parentId of category
      //print(listCateProduct[i].name +" "+"parentId "+listCateProduct[i].parentId.toString());
      if(listCateProduct[i].id==categoryId){
        //print("Tìm thấy");
        //print(listCateProduct[i].parentId.toString());
        if(listCateProduct[i].parentId==1){
          return 1;
        }
        else if(listCateProduct[i].parentId==2){
          return 2;
        }
        else{
          return 3;
        }
      }
    }
    return 1;
  }
  void getProductByCategory() async{
    var list = await repoProduct.getAllProducts();
    listCateProduct.value = await  repoCate.getAllCategories();
    list.forEach((element) {
      if(checkParentId(element.category)==1){
        listProductMen.add(element);
      }
      else if(checkParentId(element.category)==2){
        listProductWoMen.add(element);
      }
      else{
        listProductChildren.add(element);
      }
    });
    print("nam"+listProductMen.length.toString());
    print("Nữ"+listProductWoMen.length.toString());
    print("Trẻ em"+listProductChildren.length.toString());
  }
  void searchProductByWord(String word){
    listSearch.clear();
    listProduct.forEach((element) {
      RegExp exp1= new RegExp("\W*("+word+")\W*",caseSensitive: false,);
      bool containe_name = exp1.hasMatch(element.title);
      bool containe_title = exp1.hasMatch(element.description);
      if(containe_name==true || containe_title==true){
        listSearch.add(element);
      }
    });
    print("List sau khi search "+listSearch.length.toString());
    listSearch.refresh();
    Get.to(SearchScreen());
  }
  void filterProductByOption(String option){
    switch(option){
      case "Giới thiệu":

        break;
      case "Mới đến":

        break;
      case "Giá thấp đến cao":
        listSearch.sort((a,b)=>a.price.compareTo(b.price));
        // listProduct.forEach((element) {
        //   print(element.price);
        //
        // });
        break;
      case "Giá cao đến thấp":
        listSearch.sort((a,b)=>b.price.compareTo(a.price));
        //productList.refresh();
        break;
    }
  }
  void addListSeenHere(Product product){
    print(product.title);
      //check isset
      int id=0;
      bool isExist=false;
      listProductSeenHere.forEach((element) {
        if(element.id==product.id){
          print(element.title + "|"+product.title);
          print(element.id.toString() + "|"+product.id.toString());
          print("tồn tại");
          isExist=true;
          id=element.id;
        }
      });
      if(isExist==true){
        print("đã xóa");
        listProductSeenHere.removeWhere((element) => element.id==id);
      }
      listProductSeenHere.add(product);
      for(int i = listProductSeenHere.length-1 ; i>0;i--) {
        listProductSeenHere[i]=listProductSeenHere[i-1];
      }
      listProductSeenHere[0]=product;
      print("phần tử đầu tiên:"+listProductSeenHere[0].title);
      listProductSeenHere.refresh();
      //print("List đã xem gần đây: "+listProductSeenHere.length.toString());
  }
}