
import 'dart:convert';

import 'package:get/get.dart';
import 'package:sheinshop/entity/Favourite.dart';
import 'package:sheinshop/extensions/regex_extension.dart';
import 'package:sheinshop/repository/FavoutiteRepository.dart';
import 'package:http/http.dart' as http;


class FavouriteRepositoryImp implements FavouriteRepository{

  static const String baseUrl="http://localhost:3000/api/favourites";
  static const headers = {"Content-type":"application/json"};

  @override
  Future<String> deleteFavourite(int favouriteId) async {
    var response = await http.delete(Uri.parse("$baseUrl/${favouriteId}"));
    if (response.statusCode == 200) {
      var data = response.body;
      return "Delete success!!";
    } else {
      throw Exception();
    }
  }

  @override
  Future<Favourite> findFavouriteById(int favouriteId) {
    // TODO: implement findFavouriteById
    throw UnimplementedError();
  }

  @override
  Future<List<Favourite>> getAllFavourites() async {
    var response = await http.get(Uri.parse("$baseUrl"));
    if (response.statusCode == 200) {
      var data = response.body;
      return FavouriteModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> updateFavourite(Favourite favourite) async {
    var url = Uri.parse('$baseUrl/');
    String resData = "";
    await http.patch(url,
        body:json.encode({
          "userId":favourite.userId,
          "productId":favourite.productId
        }) ,
        headers: headers).then((response){
      Map<String,dynamic> result = json.decode(response.body);
    }).catchError((onError)=>print("Lỗi: "+onError));
    return resData;
  }

  @override
  Future<String> addFavourite(int userId,int productId) async {
    var url = Uri.parse('$baseUrl/');
    String resData = "";
    await http.post(url,
        body:json.encode({
          "userId":userId,
          "productId":productId
        }) ,
        headers: headers).then((response){
      Map<String,dynamic> result = json.decode(response.body);
    }).catchError((onError)=>print("Lỗi: "+onError));
    return resData;
  }

  @override
  Future<bool> isFavourite(int userId, int productId) async {
    // TODO: implement isFavourite
    var response = await http.get(Uri.parse('$baseUrl?userId=${userId}&productId=${productId}'));
    if (response.statusCode == 200) {
      List<dynamic> result = json.decode(response.body);
      if(result.length!=0){
        return true;
      }
      else {
        return false;
      }
    }
    throw Exception();
  }
}