import 'dart:convert';

List<Favourite> FavouriteModelFromJson(String str) =>
    List<Favourite>.from(
        json.decode(str).map((x) => Favourite.fromJson(x)));

String FavouriteModelToJson(List<Favourite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Favourite{
  int _id;
  int _userId;
  int _productId;

  Favourite(this._id, this._userId, this._productId);


  int get productId => _productId;

  set productId(int value) {
    _productId = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  factory Favourite.fromJson(Map<String,dynamic> json) =>Favourite(
      json["id"],
      json["userId"],
      json["productId"]
  );
  Map<String,dynamic> toJson() =>{
    "id":_id,
    "userId":_userId,
    "productId":_productId
  };
}