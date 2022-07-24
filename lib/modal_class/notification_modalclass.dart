// To parse this JSON data, do
//
//     final notificationModalClass = notificationModalClassFromJson(jsonString);

import 'dart:convert';

NotificationModalClass notificationModalClassFromJson(String str) => NotificationModalClass.fromJson(json.decode(str));

String notificationModalClassToJson(NotificationModalClass data) => json.encode(data.toJson());

class NotificationModalClass {
  NotificationModalClass({
    this.status,
    this.message,
    this.notification,
  });

  bool? status;
  String? message;
  List<NotificationList>? notification;

  NotificationModalClass copyWith({
    bool? status,
    String? message,
    List<NotificationList>? notification,
  }) =>
      NotificationModalClass(
        status: status ?? this.status,
        message: message ?? this.message,
        notification: notification ?? this.notification,
      );

  factory NotificationModalClass.fromJson(Map<String, dynamic> json) => NotificationModalClass(
    status: json["status"],
    message: json["message"],
    notification: List<NotificationList>.from(json["notification"].map((x) => NotificationList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "notification": List<dynamic>.from(notification!.map((x) => x.toJson())),
  };
}

class NotificationList {
  NotificationList({
    this.id,
    this.userId,
    this.eventId,
    this.description,
    this.createdBy,
    this.readStatus,
    this.actionType,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  dynamic eventId;
  String? description;
  int? createdBy;
  int? readStatus;
  String? actionType;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationList copyWith({
    int? id,
    int? userId,
    dynamic eventId,
    String? description,
    int? createdBy,
    int? readStatus,
    String? actionType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      NotificationList(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        eventId: eventId ?? this.eventId,
        description: description ?? this.description,
        createdBy: createdBy ?? this.createdBy,
        readStatus: readStatus ?? this.readStatus,
        actionType: actionType ?? this.actionType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
    id: json["id"],
    userId: json["userId"],
    eventId: json["eventId"],
    description: json["description"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    readStatus: json["readStatus"],
    actionType: json["actionType"] == null ? null : json["actionType"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "eventId": eventId,
    "description": description,
    "created_by": createdBy == null ? null : createdBy,
    "readStatus": readStatus,
    "actionType": actionType == null ? null : actionType,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
