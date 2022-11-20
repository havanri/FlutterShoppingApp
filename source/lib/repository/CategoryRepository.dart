
import 'package:sheinshop/entity/Category.dart';

abstract class CategoryRepository{
  //get all
  Future<List<Category>> getAllCategories();
  //find by Id
  Future<Category> findCategoryById(int categoryId);
  //update
  Future<String> updateCategory(Category category);
  //delete
  Future<String> deleteCategory(int categoryId);
}