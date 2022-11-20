
import 'package:get/get.dart';
import 'package:sheinshop/controller/UserController.dart';
import 'package:sheinshop/repository/FavouriteRepositoryImp.dart';
import 'package:sheinshop/repository/ProductRepositoryImp.dart';

class FavouriteController extends GetxController{
  FavouriteRepositoryImp repoFavourite = new FavouriteRepositoryImp();
  var listFavourite = [].obs;
  int userId =UserController.session.value;
  var listProductFavourite = [].obs;
  var selectedIndexTabInProfile=0.obs;
  @override
  void onInit() {
    print("session:"+userId.toString());
    getAllFavourites();
    getListProductFavourite();
    super.onInit();
  }
  void getListProductFavourite() async {
      if(listProductFavourite!=null){
        listProductFavourite.clear();
      }
      var listproduct = await ProductRepositoryImp().getAllProducts();
      listFavourite.forEach((favourite) {
          listproduct.forEach((product) {
            if(userId==favourite.userId && favourite.productId==product.id){
                listProductFavourite.add(product);
            }
          });
      });
  }
  void getAllFavourites() async {
      var favourites = await repoFavourite.getAllFavourites();
      if (favourites != null) {
        listFavourite.value = favourites;
      }
  }
  bool isFavourite(int productId){
      bool isCheck = false;
      listFavourite.forEach((element) {
          if(element.userId==userId && element.productId==productId){
            isCheck=true;
          }
      });
      return isCheck;
  }
  void toggleFavorite(int productId) async {
    // check is Favourite
    // var favourites = await repoFavourite.getAllFavourites();
    // listFavourite.value =favourites;
    // listFavourite.forEach((element) {
    //
    // });
    bool isFavourite = await repoFavourite.isFavourite(userId,productId);
    print("kết quả trả về:"+isFavourite.toString());
    if(isFavourite==false){
      print("đã tymm");
      repoFavourite.addFavourite(userId, productId);
      var list = await repoFavourite.getAllFavourites();
      listFavourite.value = list;
    }
    else {
      var list = await repoFavourite.getAllFavourites();
      listFavourite.value = list;
      int elementRemove=0;
      listFavourite.forEach((element) {
          if(element.userId==userId && element.productId==productId){
            print("đã bỏ tym");
            elementRemove=element.id;
            repoFavourite.deleteFavourite(element.id);
          }
      });
      listFavourite.removeWhere((item) => item.id == elementRemove);
    }
    getListProductFavourite();
    listFavourite.refresh();
  }
  void tabProfile(int selectedIndex){
      if(selectedIndex==0){
        selectedIndexTabInProfile.value=0;
      }
      else{
        selectedIndexTabInProfile.value=1;
      }
  }
}