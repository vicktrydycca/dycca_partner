// To parse this JSON data, do
//
//     final eventTypeModalClass = eventTypeModalClassFromJson(jsonString);

import 'dart:convert';

EventTypeModalClass eventTypeModalClassFromJson(String str) => EventTypeModalClass.fromJson(json.decode(str));

String eventTypeModalClassToJson(EventTypeModalClass data) => json.encode(data.toJson());

class EventTypeModalClass {
  EventTypeModalClass({
    this.status,
    this.event,
    this.message,
  });

  bool? status;
  Event? event;
  String? message;

  factory EventTypeModalClass.fromJson(Map<String, dynamic> json) => EventTypeModalClass(
    status: json["status"],
    event: Event.fromJson(json["event"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "event": event!.toJson(),
    "message": message,
  };
}

class Event {
  Event({
    this.userId,
    this.eventName,
    this.auditionseq,
    this.eventDesc,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.eventRound,
    this.eventJudgement,
    this.eventReward,
    this.eventPrice,
    this.eventvisiblity,
    this.venuepartner,
    this.judges,
    this.sponsors,
    this.eventProjects,
    this.typeId,
    this.subtypeId,
    this.updatedAt,
    this.createdAt,
    this.eventId,
  });

  int? userId;
  String? eventName;
  int? auditionseq;
  String? eventDesc;
  dynamic startDate;
  dynamic startTime;
  dynamic endDate;
  dynamic endTime;
  String? eventRound;
  String? eventJudgement;
  String? eventReward;
  String? eventPrice;
  int? eventvisiblity;
  String? venuepartner;
  String? judges;
  String? sponsors;
  String? eventProjects;
  String? typeId;
  String? subtypeId;
  String? updatedAt;
  String? createdAt;
  int? eventId;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    userId: json["userId"],
    eventName: json["eventName"],
    auditionseq: json["auditionseq"],
    eventDesc: json["eventDesc"],
    startDate: json["startDate"],
    startTime: json["startTime"],
    endDate: json["endDate"],
    endTime: json["endTime"],
    eventRound: json["eventRound"],
    eventJudgement: json["eventJudgement"],
    eventReward: json["eventReward"],
    eventPrice: json["eventPrice"],
    eventvisiblity: json["eventvisiblity"],
    venuepartner: json["venuepartner"],
    judges: json["judges"],
    sponsors: json["sponsors"],
    eventProjects: json["eventProjects"],
    typeId: json["typeId"],
    subtypeId: json["subtypeId"],
    updatedAt: json["updatedAt"],
    createdAt: json["createdAt"],
    eventId: json["eventId"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "eventName": eventName,
    "auditionseq": auditionseq,
    "eventDesc": eventDesc,
    "startDate": startDate,
    "startTime": startTime,
    "endDate": endDate,
    "endTime": endTime,
    "eventRound": eventRound,
    "eventJudgement": eventJudgement,
    "eventReward": eventReward,
    "eventPrice": eventPrice,
    "eventvisiblity": eventvisiblity,
    "venuepartner": venuepartner,
    "judges": judges,
    "sponsors": sponsors,
    "eventProjects": eventProjects,
    "typeId": typeId,
    "subtypeId": subtypeId,
    "updatedAt": updatedAt,
    "createdAt": createdAt,
    "eventId": eventId,
  };
}
