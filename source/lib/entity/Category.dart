import 'dart:convert';

List<Category> CategoryModelFromJson(String str) =>
    List<Category>.from(
        json.decode(str).map((x) => Category.fromJson(x)));

String CategoryModelToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Category{
  int _id;
  String _name;
  int _parentId;
  String _featureImage;

  Category(this._id, this._name, this._parentId, this._featureImage);

  String get featureImage => _featureImage;

  set featureImage(String value) {
    _featureImage = value;
  }

  int get parentId => _parentId;

  set parentId(int value) {
    _parentId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
  factory Category.fromJson(Map<String, dynamic> json) => Category(
    json["id"] ,
    json["name"],
    json["parentId"],
    json["featureImage"]);
  Map<String,dynamic> toJson()=>{
    "id":_id,
    "name":_name,
    "parentId":_parentId,
    "featureImage":_featureImage
  };
}