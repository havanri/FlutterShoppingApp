
import 'package:get/get.dart';
import 'package:sheinshop/entity/Category.dart';
import 'package:sheinshop/repository/CategoryRepositoryImpl.dart';

class CategoryController extends GetxController{
  var isLoading = true.obs;
  CategoryRepositoryImpl repoCate = new CategoryRepositoryImpl();
  var listCategories = [].obs;
  var listCateMen=[].obs;
  var listCateWomen=[].obs;
  var listCateChildren=[].obs;
  @override
  void onInit() {
    getchildCategory();
    super.onInit();
  }
  void getAllCategories() async {
    try {
      isLoading(true);
      var categories = await repoCate.getAllCategories();
      print(categories.length.toString()+"vãi nồi");
      if (categories != null) {
        listCategories.value = categories;
        List<Category> list = listCategories.toJson();
        //List<dynamic> test = list as List<dynamic>;
      }
    } finally {
      isLoading(false);
    }
  }
  void getchildCategory() async{
    var categories = await repoCate.getAllCategories();
    listCategories.value=categories;
    listCategories.forEach((element) {
      if(element.parentId==1){
        listCateMen.add(element);
      }
      if(element.parentId==2){
        listCateWomen.add(element);
      }
      if(element.parentId==3) {
        listCateChildren.add(element);
      }
    });
    print("listcatefull: "+listCategories.length.toString());
    print("listnam: "+listCateMen.length.toString());
    print("listnu: "+listCateWomen.length.toString());
    print("listtreem: "+listCateChildren.length.toString());
  }

}