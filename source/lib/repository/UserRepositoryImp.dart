
import 'dart:convert';

import 'package:sheinshop/entity/User.dart';
import 'package:sheinshop/repository/UserRepository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImp implements UserRepository{

  static const String baseUrl="http://localhost:3000/api/users";
  static const headers = {"Content-type":"application/json"};

  @override
  Future<String> deleteUser(int userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> findUserById(int idUser) async {
    var response = await http.get(Uri.parse("$baseUrl/$idUser"));
    if (response.statusCode == 200) {
      // var data = response.body;//json
      var jsonData=json.decode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    var response = await http.get(Uri.parse("$baseUrl"));
    if (response.statusCode == 200) {
      var data = response.body;//json
      //var jsonData=json.decode(response.body);
      return UserModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> updateUser(User user) async {
    var url = Uri.parse('$baseUrl/${user.id}');
    String resData = "";
    await http.patch(url,
        body:json.encode({
          "email":user.email,
          "password":user.password,
          "deliveryAddress":user.deliveryAddress
        }) ,
        headers: headers).then((response){
      Map<String,dynamic> result = json.decode(response.body);
    }).catchError((onError)=>print("Lỗi: "+onError));
    return resData;
  }

  @override
  Future<String> addUser(String email, String password,List<dynamic> deliveryAddress) async {
    var url = Uri.parse('$baseUrl/');
    String resData = "";
    List<dynamic> result;
    await http.post(url,
        body:json.encode({
          "email":email,
          "password":password,
          "deliveryAddress":deliveryAddress
        }) ,
        headers: headers).then((response){
      Map<String,dynamic> result = json.decode(response.body);
    }).catchError((onError)=>print("Lỗi: "+onError));
    return resData;
  }
  
}