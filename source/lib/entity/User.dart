import 'dart:convert';

List<User> UserModelFromJson(String str) =>
    List<User>.from(
        json.decode(str).map((x) => User.fromJson(x)));

String UserModelToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User{
  int _id;
  String _email;
  String _password;
  List<dynamic> _deliveryAddress;

  User(this._id, this._email, this._password, this._deliveryAddress);

  List<dynamic> get deliveryAddress => _deliveryAddress;

  set deliveryAddress(List<dynamic> value) {
    _deliveryAddress = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
  factory User.fromJson(Map<String,dynamic> json)=> User(
      json["id"],
      json["email"],
      json["password"],
      json["deliveryAddress"]
  );

  Map<String,dynamic> toJson(){
    return {
      'id':_id,
      'email':_email,
      'password':_password,
      'deliveryAddress':_deliveryAddress
    };
  }
}