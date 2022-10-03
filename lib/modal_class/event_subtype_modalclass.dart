// To parse this JSON data, do
//
//     final eventTypeModalClass = eventTypeModalClassFromJson(jsonString);

import 'dart:convert';

EventTypeModalClass eventTypeModalClassFromJson(String str) => EventTypeModalClass.fromJson(json.decode(str));

String eventTypeModalClassToJson(EventTypeModalClass data) => json.encode(data.toJson());

class EventTypeModalClass {
  EventTypeModalClass({
    this.status,
    this.message,
    this.category,
  });

  bool? status;
  String? message;
  List<EventSubTypeCategory>? category;

  factory EventTypeModalClass.fromJson(Map<String, dynamic> json) => EventTypeModalClass(
    status: json["status"],
    message: json["message"],
    category: List<EventSubTypeCategory>.from(json["category"].map((x) => EventSubTypeCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class EventSubTypeCategory {
  EventSubTypeCategory({
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

  factory EventSubTypeCategory.fromJson(Map<String, dynamic> json) => EventSubTypeCategory(
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
  List<Eventsub>? eventsub;

  factory Subcat.fromJson(Map<String, dynamic> json) => Subcat(
    catId: json["catId"],
    catName: json["catName"],
    parentId: json["parentId"],
    activetab: json["activetab"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    eventsub: List<Eventsub>.from(json["eventsub"].map((x) => Eventsub.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "catId": catId,
    "catName": catName,
    "parentId": parentId,
    "activetab": activetab,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "eventsub": List<dynamic>.from(eventsub!.map((x) => x.toJson())),
  };
}

class Eventsub {
  Eventsub({
    this.typeId,
    this.typeName,
    this.parentId,
    this.artId,
    this.top,
    this.catimg,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? typeId;
  String? typeName;
  int? parentId;
  int? artId;
  int? top;
  String? catimg;
  int? status;
  String? createdAt;
  String? updatedAt;

  factory Eventsub.fromJson(Map<String, dynamic> json) => Eventsub(
    typeId: json["typeId"],
    typeName: json["typeName"],
    parentId: json["parentId"],
    artId: json["artId"],
    top: json["top"],
    catimg: json["catimg"] == null ? null : json["catimg"],
    status: json["status"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "typeId": typeId,
    "typeName": typeName,
    "parentId": parentId,
    "artId": artId,
    "top": top,
    "catimg": catimg == null ? null : catimg,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
