// To parse this JSON data, do
//
//     final eventSubCategory = eventSubCategoryFromJson(jsonString);

import 'dart:convert';

EventSubCategory eventSubCategoryFromJson(String str) => EventSubCategory.fromJson(json.decode(str));

String eventSubCategoryToJson(EventSubCategory data) => json.encode(data.toJson());

class EventSubCategory {
  EventSubCategory({
    this.status,
    this.message,
    this.category,
  });

  bool? status;
  String? message;
  List<Category>? category;

  factory EventSubCategory.fromJson(Map<String, dynamic> json) => EventSubCategory(
    status: json["status"],
    message: json["message"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.catId,
    this.catName,
    this.parentId,
    this.activetab,
    this.createdAt,
    this.updatedAt,
    this.subcat,
  });

  int? catId;
  String? catName;
  int? parentId;
  int? activetab;
  String? createdAt;
  String? updatedAt;
  List<Subcat>? subcat;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    catId: json["catId"],
    catName: json["catName"],
    parentId: json["parentId"],
    activetab: json["activetab"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    subcat: List<Subcat>.from(json["subcat"].map((x) => Subcat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "catId": catId,
    "catName": catName,
    "parentId": parentId,
    "activetab": activetab,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "subcat": List<dynamic>.from(subcat!.map((x) => x.toJson())),
  };
}

class Subcat {
  Subcat({
    this.catId,
    this.catName,
    this.parentId,
    this.activetab,
    this.createdAt,
    this.updatedAt,
    this.eventsub,
  });

  int? catId;
  String? catName;
  int? parentId;
  int? activetab;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? eventsub;

  factory Subcat.fromJson(Map<String, dynamic> json) => Subcat(
    catId: json["catId"],
    catName: json["catName"],
    parentId: json["parentId"],
    activetab: json["activetab"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    eventsub: List<dynamic>.from(json["eventsub"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "catId": catId,
    "catName": catName,
    "parentId": parentId,
    "activetab": activetab,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "eventsub": List<dynamic>.from(eventsub!.map((x) => x)),
  };
}
