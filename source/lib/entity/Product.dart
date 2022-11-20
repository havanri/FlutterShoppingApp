import 'dart:convert';

List<Product> productsnewModelFromJson(String str) =>
    List<Product>.from(
        json.decode(str).map((x) => Product.fromJson(x)));

String productsnewModelToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Product {
  int _id;
  String _title;
  double _price;
  String _description;
  int _category;
  String _image;
  Rating _rating;

  Product(this._id, this._title, this._price, this._description, this._category,
      this._image, this._rating);

  Rating get rating => _rating;

  set rating(Rating value) {
    _rating = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  int get category => _category;

  set category(int value) {
    _category = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    json["id"],
    json["title"],
    json["price"].toDouble(),
    json["description"],
    json["category"],
    json["image"],
    Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": _id,
    "title": _title,
    "price": _price,
    "description": _description,
    "category": _category,
    "image": _image,
    "rating": _rating!.toJson(),
  };
}
class Rating {
  double _rate;
  int _count;

  Rating(this._rate, this._count);
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    json["rate"].toDouble(),
    json["count"],
  );

  double get rate => _rate;

  set rate(double value) {
    _rate = value;
  }

  Map<String, dynamic> toJson() => {
    "rate": _rate,
    "count": _count,
  };

  int get count => _count;

  set count(int value) {
    _count = value;
  }
}