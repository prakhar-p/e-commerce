import 'Category.dart';

/// id : 14
/// title : "Intelligent Steel Tuna"
/// price : 433
/// description : "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit"
/// images : ["https://i.imgur.com/gxaUWSF.jpeg","https://i.imgur.com/rDC2jWQ.jpeg","https://i.imgur.com/s8WRA2O.jpeg"]
/// creationAt : "2023-10-18T10:07:54.000Z"
/// updatedAt : "2023-10-18T10:07:54.000Z"
/// category : {"id":1,"name":"Clothes","image":"https://i.imgur.com/QEGACen.jpeg","creationAt":"2023-10-18T10:07:54.000Z","updatedAt":"2023-10-18T10:07:54.000Z"}

class CategoryProduct {
  CategoryProduct({
      num? id, 
      String? title, 
      num? price, 
      String? description, 
      List<String>? images, 
      String? creationAt, 
      String? updatedAt, 
      Category? category,}){
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _images = images;
    _creationAt = creationAt;
    _updatedAt = updatedAt;
    _category = category;
}

  CategoryProduct.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _creationAt = json['creationAt'];
    _updatedAt = json['updatedAt'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  num? _id;
  String? _title;
  num? _price;
  String? _description;
  List<String>? _images;
  String? _creationAt;
  String? _updatedAt;
  Category? _category;
CategoryProduct copyWith({  num? id,
  String? title,
  num? price,
  String? description,
  List<String>? images,
  String? creationAt,
  String? updatedAt,
  Category? category,
}) => CategoryProduct(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  description: description ?? _description,
  images: images ?? _images,
  creationAt: creationAt ?? _creationAt,
  updatedAt: updatedAt ?? _updatedAt,
  category: category ?? _category,
);
  num? get id => _id;
  String? get title => _title;
  num? get price => _price;
  String? get description => _description;
  List<String>? get images => _images;
  String? get creationAt => _creationAt;
  String? get updatedAt => _updatedAt;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    map['images'] = _images;
    map['creationAt'] = _creationAt;
    map['updatedAt'] = _updatedAt;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

