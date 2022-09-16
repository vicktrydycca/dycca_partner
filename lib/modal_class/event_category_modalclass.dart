// To parse this JSON data, do
//
//     final eventCategory = eventCategoryFromJson(jsonString);

import 'dart:convert';

EventCategory eventCategoryFromJson(String str) => EventCategory.fromJson(json.decode(str));

String eventCategoryToJson(EventCategory data) => json.encode(data.toJson());

class EventCategory {
  EventCategory({
    this.status,
    this.message,
    this.dropdown,
    this.category,
  });

  bool? status;
  String? message;
  bool? dropdown;
  List<Category>? category;

  EventCategory copyWith({
    bool? status,
    String? message,
    bool? dropdown,
    List<Category>? category,
  }) =>
      EventCategory(
        status: status ?? this.status,
        message: message ?? this.message,
        dropdown: dropdown ?? this.dropdown,
        category: category ?? this.category,
      );

  factory EventCategory.fromJson(Map<String, dynamic> json) => EventCategory(
    status: json["status"],
    message: json["message"],
    dropdown: json["dropdown"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "dropdown": dropdown,
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.typeId,
    this.typeName,
    this.parentId,
    this.artId,
    this.top,
    this.catimg,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.eventsub,
    this.topeventsub,
  });

  int? typeId;
  String? typeName;
  int? parentId;
  int? artId;
  int? top;
  String? catimg;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Category>? eventsub;
  List<Category>? topeventsub;

  Category copyWith({
    int? typeId,
    String? typeName,
    int? parentId,
    int? artId,
    int? top,
    String? catimg,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Category>? eventsub,
    List<Category>? topeventsub,
  }) =>
      Category(
        typeId: typeId ?? this.typeId,
        typeName: typeName ?? this.typeName,
        parentId: parentId ?? this.parentId,
        artId: artId ?? this.artId,
        top: top ?? this.top,
        catimg: catimg ?? this.catimg,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        eventsub: eventsub ?? this.eventsub,
        topeventsub: topeventsub ?? this.topeventsub,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    typeId: json["typeId"],
    typeName: json["typeName"],
    parentId: json["parentId"],
    artId: json["artId"],
    top: json["top"],
    catimg: json["catimg"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    eventsub: json["eventsub"] == null ? null : List<Category>.from(json["eventsub"].map((x) => Category.fromJson(x))),
    topeventsub: json["topeventsub"] == null ? null : List<Category>.from(json["topeventsub"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "typeId": typeId,
    "typeName": typeName,
    "parentId": parentId,
    "artId": artId,
    "top": top,
    "catimg": catimg  ?? "https://t4.ftcdn.net/jpg/04/00/24/31/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg",
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "eventsub": eventsub == null ? null : List<dynamic>.from(eventsub!.map((x) => x.toJson())),
    "topeventsub": topeventsub == null ? null : List<dynamic>.from(topeventsub!.map((x) => x.toJson())),
  };
}



class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
