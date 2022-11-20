
import 'dart:convert';

import 'package:sheinshop/entity/Cart.dart';
import 'package:sheinshop/repository/CartRepository.dart';
import 'package:http/http.dart' as http;

class CartRepositoryImp extends CartRepository{

  static const String baseUrl="http://localhost:3000/api/carts";
  static const headers = {"Content-type":"application/json"};
  @override
  Future<String> deleteCart(int cartId) {
    // TODO: implement deleteCart
    throw UnimplementedError();
  }

  @override
  Future<Cart> findCartById(int cartId) async {
    print("cartId chúa:"+cartId.toString());
    var response = await http.get(Uri.parse("$baseUrl/$cartId"));
    if (response.statusCode == 200) {
     // var data = response.body;//json
      var jsonData=json.decode(response.body);
      return Cart.fromJson(jsonData);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Cart>> getAllCarts() async {
    var response = await http.get(Uri.parse("$baseUrl"));
    if (response.statusCode == 200) {
      var data = response.body;//json
      //var jsonData=json.decode(response.body);
      return CartModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> updateCart(Cart cart) async {
    var url = Uri.parse('$baseUrl/${cart.id}');
    String resData = "";
    await http.patch(url,
        body:json.encode({
          "userId": cart.userId,
          "products":cart.products,
        }) ,
        headers: headers).then((response){
      Map<String,dynamic> result = json.decode(response.body);
    }).catchError((onError)=>print("Lỗi: "+onError));
    return resData;
  }

  @override
  Future<String> addNewCart(int userId, List<dynamic> products) async {
    var url = Uri.parse('$baseUrl/');
    String resData = "";
    List<dynamic> result;
    await http.post(url,
        body:json.encode({
          "userId":userId,
          "products":products,
        }) ,
        headers: headers).then((response){
      Map<String,dynamic> result = json.decode(response.body);
    }).catchError((onError)=>print("Lỗi: "+onError));
    return resData;
  }


  
}