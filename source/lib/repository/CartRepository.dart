import 'package:sheinshop/entity/Cart.dart';

abstract class CartRepository{
  Future<List<Cart>> getAllCarts();
  //find by Id
  Future<Cart> findCartById(int cartId);
  //update
  Future<String> updateCart(Cart cart);
  //delete
  Future<String> deleteCart(int cartId);

  Future<String> addNewCart(int userId,List<dynamic> products);
}