
import 'package:sheinshop/entity/Category.dart';
import 'package:sheinshop/repository/CategoryRepository.dart';
import 'package:http/http.dart' as http;
class CategoryRepositoryImpl implements CategoryRepository{

  static const String baseUrl="http://localhost:3000/api/categories";
  static const headers = {"Content-type":"application/json"};
  @override
  Future<String> deleteCategory(int categoryId) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<Category> findCategoryById(int categoryId) {
    // TODO: implement findCategoryById
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllCategories() async {
    var response = await http.get(Uri.parse("$baseUrl"));
    if (response.statusCode == 200) {
      var data = response.body;
      return CategoryModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> updateCategory(Category category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

}