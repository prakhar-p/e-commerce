/// id : 1
/// name : "Clothessss"
/// image : "https://i.imgur.com/kTPCFG2.jpeg"
/// creationAt : "2023-10-19T10:23:44.000Z"
/// updatedAt : "2023-10-19T11:11:06.000Z"

class CategoryM {
  CategoryM({
      num? id, 
      String? name, 
      String? image, 
      String? creationAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _creationAt = creationAt;
    _updatedAt = updatedAt;
}

  CategoryM.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _creationAt = json['creationAt'];
    _updatedAt = json['updatedAt'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _creationAt;
  String? _updatedAt;
CategoryM copyWith({  num? id,
  String? name,
  String? image,
  String? creationAt,
  String? updatedAt,
}) => CategoryM(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  creationAt: creationAt ?? _creationAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get creationAt => _creationAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['creationAt'] = _creationAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}