
import 'package:sheinshop/entity/User.dart';

abstract class UserRepository{
  Future<List<User>> getAllUsers();
  //find by Id
  Future<User> findUserById(int idUser);
  //update
  Future<String> updateUser(User user);
  //delete
  Future<String> deleteUser(int userId);

  Future<String> addUser(String email,String password,List<dynamic> deliveryAddress);
}