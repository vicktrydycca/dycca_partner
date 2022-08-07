// To parse this JSON data, do
//
//     final amenityModalClass = amenityModalClassFromJson(jsonString);

import 'dart:convert';

AmenityModalClass amenityModalClassFromJson(String str) => AmenityModalClass.fromJson(json.decode(str));

String amenityModalClassToJson(AmenityModalClass data) => json.encode(data.toJson());

class AmenityModalClass {
  AmenityModalClass({
    this.status,
    this.message,
    this.amenity,
  });

  bool? status;
  String? message;
  List<Amenity>? amenity;

  AmenityModalClass copyWith({
    bool? status,
    String? message,
    List<Amenity>? amenity,
  }) =>
      AmenityModalClass(
        status: status ?? this.status,
        message: message ?? this.message,
        amenity: amenity ?? this.amenity,
      );

  factory AmenityModalClass.fromJson(Map<String, dynamic> json) => AmenityModalClass(
    status: json["status"],
    message: json["message"],
    amenity: List<Amenity>.from(json["amenity"].map((x) => Amenity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "amenity": List<dynamic>.from(amenity!.map((x) => x.toJson())),
  };
}

class Amenity {
  Amenity({
    this.amentId,
    this.catId,
    this.amentName,
    this.image,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  int? amentId;
  int? catId;
  String? amentName;
  dynamic image;
  int? status;
  dynamic createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;

  Amenity copyWith({
    int? amentId,
    int? catId,
    String? amentName,
    dynamic image,
    int? status,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
  }) =>
      Amenity(
        amentId: amentId ?? this.amentId,
        catId: catId ?? this.catId,
        amentName: amentName ?? this.amentName,
        image: image ?? this.image,
        status: status ?? this.status,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
      );

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    amentId: json["amentId"],
    catId: json["catId"] == null ? null : json["catId"],
    amentName: json["amentName"] == null ? null : json["amentName"],
    image: json["image"],
    status: json["status"],
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "amentId": amentId,
    "catId": catId == null ? null : catId,
    "amentName": amentName == null ? null : amentName,
    "image": image,
    "status": status,
    "createdBy": createdBy,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "category": category == null ? null : category!.toJson(),
  };
}

class Category {
  Category({
    this.catId,
    this.catName,
    this.parentId,
    this.catImg,
    this.lastLevel,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? catId;
  String? catName;
  int? parentId;
  dynamic catImg;
  int? lastLevel;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category copyWith({
    int? catId,
    String? catName,
    int? parentId,
    dynamic catImg,
    int? lastLevel,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Category(
        catId: catId ?? this.catId,
        catName: catName ?? this.catName,
        parentId: parentId ?? this.parentId,
        catImg: catImg ?? this.catImg,
        lastLevel: lastLevel ?? this.lastLevel,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    catId: json["catId"],
    catName: json["catName"],
    parentId: json["parentId"],
    catImg: json["catImg"],
    lastLevel: json["lastLevel"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "catId": catId,
    "catName": catName,
    "parentId": parentId,
    "catImg": catImg,
    "lastLevel": lastLevel,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
