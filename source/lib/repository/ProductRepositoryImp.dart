import 'dart:convert';

import 'package:sheinshop/entity/Product.dart';
import 'package:sheinshop/repository/ProductRepository.dart';
import 'package:http/http.dart' as http;
class ProductRepositoryImp implements ProductRepository{

  static const String baseUrl="http://localhost:3000/api/products";
  static const headers = {"Content-type":"application/json"};
  @override
  Future<List<Product>> getAllProducts() async {
    var response = await http.get(Uri.parse("$baseUrl"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productsnewModelFromJson(data);
    } else {
      throw Exception();
    }
    throw UnimplementedError();
  }
  @override
  Future<Product> findProductById(int productId) {
    // TODO: implement findProductById
    throw UnimplementedError();
  }
  @override
  Future<String> updateProduct(Product product) async {
    var url = Uri.parse('$baseUrl/${product.id}');
    String resData = "";
    await http.patch(url,
        body:json.encode({
          "title": product.title,
          "price": product.price,
          "description": product.description,
          "category": product.category,
          "image": product.image,
          "rating": product.rating!.toJson(),
        }) ,
        headers: headers).then((response){
      Map<String,dynamic> result = json.decode(response.body);
    }).catchError((onError)=>print("Lỗi: "+onError));
    return resData;
  }
  @override
  Future<String> deleteProduct(int productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

}