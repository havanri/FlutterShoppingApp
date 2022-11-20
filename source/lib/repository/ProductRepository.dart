
import 'package:sheinshop/entity/Product.dart';

abstract class ProductRepository{
  //get all
  Future<List<Product>> getAllProducts();
  //find by Id
  Future<Product> findProductById(int productId);
  //update
  Future<String> updateProduct(Product product);
  //delete
  Future<String> deleteProduct(int productId);

}