// To parse this JSON data, do
//
//     final equipmentsModalClass = equipmentsModalClassFromJson(jsonString);

import 'dart:convert';

EquipmentsModalClass equipmentsModalClassFromJson(String str) => EquipmentsModalClass.fromJson(json.decode(str));

String equipmentsModalClassToJson(EquipmentsModalClass data) => json.encode(data.toJson());

class EquipmentsModalClass {
  EquipmentsModalClass({
    this.status,
    this.message,
    this.equipments,
  });

  bool? status;
  String? message;
  List<Equipment>? equipments;

  EquipmentsModalClass copyWith({
    bool? status,
    String? message,
    List<Equipment>? equipments,
  }) =>
      EquipmentsModalClass(
        status: status ?? this.status,
        message: message ?? this.message,
        equipments: equipments ?? this.equipments,
      );

  factory EquipmentsModalClass.fromJson(Map<String, dynamic> json) => EquipmentsModalClass(
    status: json["status"],
    message: json["message"],
    equipments: List<Equipment>.from(json["equipments"].map((x) => Equipment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "equipments": List<dynamic>.from(equipments!.map((x) => x.toJson())),
  };
}

class Equipment {
  Equipment({
    this.equipId,
    this.catId,
    this.equipName,
    this.image,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  int? equipId;
  int? catId;
  String? equipName;
  dynamic image;
  int? status;
  dynamic createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;

  Equipment copyWith({
    int? equipId,
    int? catId,
    String? equipName,
    dynamic image,
    int? status,
    dynamic createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
  }) =>
      Equipment(
        equipId: equipId ?? this.equipId,
        catId: catId ?? this.catId,
        equipName: equipName ?? this.equipName,
        image: image ?? this.image,
        status: status ?? this.status,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
      );

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
    equipId: json["equipId"],
    catId: json["catId"] == null ? null : json["catId"],
    equipName: json["equipName"],
    image: json["image"],
    status: json["status"],
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "equipId": equipId,
    "catId": catId == null ? null : catId,
    "equipName": equipName,
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
