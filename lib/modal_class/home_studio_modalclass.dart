// To parse this JSON data, do
//
//     final homeStudioModalClass = homeStudioModalClassFromJson(jsonString);

import 'dart:convert';

HomeStudioModalClass homeStudioModalClassFromJson(String str) =>
    HomeStudioModalClass.fromJson(json.decode(str));

String homeStudioModalClassToJson(HomeStudioModalClass data) =>
    json.encode(data.toJson());

class HomeStudioModalClass {
  HomeStudioModalClass({
    this.status,
    this.message,
    this.services,
  });

  bool? status;
  String? message;
  List<Service>? services;

  HomeStudioModalClass copyWith({
    bool? status,
    String? message,
    List<Service>? services,
  }) =>
      HomeStudioModalClass(
        status: status ?? this.status,
        message: message ?? this.message,
        services: services ?? this.services,
      );

  factory HomeStudioModalClass.fromJson(Map<String, dynamic> json) =>
      HomeStudioModalClass(
        status: json["status"],
        message: json["message"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    this.catId,
    this.catName,
    this.parentId,
    this.catImg,
    this.lastLevel,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.subcat,
  });

  int? catId;
  String? catName;
  int? parentId;
  dynamic catImg;
  int? lastLevel;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Service>? subcat;

  Service copyWith({
    int? catId,
    String? catName,
    int? parentId,
    dynamic? catImg,
    int? lastLevel,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Service>? subcat,
  }) =>
      Service(
        catId: catId ?? this.catId,
        catName: catName ?? this.catName,
        parentId: parentId ?? this.parentId,
        catImg: catImg ?? this.catImg,
        lastLevel: lastLevel ?? this.lastLevel,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        subcat: subcat ?? this.subcat,
      );

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        catId: json["catId"],
        catName: json["catName"],
        parentId: json["parentId"],
        catImg: json["catImg"],
        lastLevel: json["lastLevel"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        subcat: json["subcat"] == null
            ? null
            : List<Service>.from(
                json["subcat"].map((x) => Service.fromJson(x))),
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
        "subcat": subcat == null
            ? null
            : List<dynamic>.from(subcat!.map((x) => x.toJson())),
      };
}
