import 'dart:convert';

List<Cart> CartModelFromJson(String str) =>
    List<Cart>.from(
        json.decode(str).map((x) => Cart.fromJson(x)));

String CartModelToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Cart{
  int _id;
  int _userId;
  List<dynamic> _products;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  List<dynamic> get products => _products;

  set products(List<dynamic> value) {
    _products = value;
  }

  Cart(this._id, this._userId,this._products);

  factory Cart.fromJson(Map<String,dynamic> json)=> Cart(
      json["id"],
      json["userId"],
      json["products"]
  );

  Map<String,dynamic> toJson(){
    return {
      'id':_id,
      'userId':_userId,
      'products':_products
    };
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
}
