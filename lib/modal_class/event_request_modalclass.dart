// To parse this JSON data, do
//
//     final eventRequestModalClass = eventRequestModalClassFromJson(jsonString);

import 'dart:convert';

EventRequestModalClass eventRequestModalClassFromJson(String str) => EventRequestModalClass.fromJson(json.decode(str));

String eventRequestModalClassToJson(EventRequestModalClass data) => json.encode(data.toJson());

class EventRequestModalClass {
  EventRequestModalClass({
    required this.status,
    required this.message,
    required this.eventreqs,
  });

  bool status;
  String message;
  List<Eventreq> eventreqs;

  factory EventRequestModalClass.fromJson(Map<String, dynamic> json) => EventRequestModalClass(
    status: json["status"],
    message: json["message"],
    eventreqs: List<Eventreq>.from(json["eventreqs"].map((x) => Eventreq.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "eventreqs": List<dynamic>.from(eventreqs.map((x) => x.toJson())),
  };
}

class Eventreq {
  Eventreq({
    required this.requestId,
    required this.eventId,
    required this.userId,
    this.studioId,
    required this.requestType,
    this.requestBy,
    required this.accepted,
    required this.participated,
    required this.updated,
    this.event,
  });

  int requestId;
  int eventId;
  int userId;
  int? studioId;
  String requestType;
  dynamic requestBy;
  int accepted;
  int participated;
  int updated;
  Event? event;

  factory Eventreq.fromJson(Map<String, dynamic> json) => Eventreq(
    requestId: json["requestId"],
    eventId: json["eventId"],
    userId: json["userId"],
    studioId: json["studioId"],
    requestType: json["requestType"],
    requestBy: json["requestBy"],
    accepted: json["accepted"],
    participated: json["participated"],
    updated: json["updated"],
    event: json["event"] == null ? null : Event.fromJson(json["event"]),
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "eventId": eventId,
    "userId": userId,
    "studioId": studioId,
    "requestType": requestType,
    "requestBy": requestBy,
    "accepted": accepted,
    "participated": participated,
    "updated": updated,
    "event": event?.toJson(),
  };
}

class Event {
  Event({
    required this.eventId,
    required this.userId,
    required this.typeId,
    required this.subtypeId,
    required this.eventName,
    required this.auditionseq,
    required this.eventDesc,
    required this.eventRound,
    required this.eventReward,
    required this.eventPrice,
    required this.eventJudgement,
    required this.venuepartner,
    required this.judges,
    required this.sponsors,
    required this.eventProjects,
    this.eventLocation,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.eventStatus,
    this.eventImg,
    this.eventBanner,
    required this.partnerPublish,
    required this.participatePublish,
    required this.eventvisiblity,
    required this.tempId,
    this.commId,
    required this.serviceChargeId,
    required this.eventuniqId,
    required this.approved,
    required this.sessionId,
    required this.createdAt,
    required this.updatedAt,
    required this.mcat,
    required this.subcat,
    required this.user,
  });

  int eventId;
  int userId;
  int typeId;
  int subtypeId;
  String eventName;
  int auditionseq;
  String eventDesc;
  String eventRound;
  String eventReward;
  String eventPrice;
  String eventJudgement;
  String venuepartner;
  String judges;
  String sponsors;
  String eventProjects;
  dynamic eventLocation;
  DateTime startDate;
  String startTime;
  DateTime endDate;
  String endTime;
  int eventStatus;
  dynamic eventImg;
  dynamic eventBanner;
  int partnerPublish;
  int participatePublish;
  int eventvisiblity;
  int tempId;
  dynamic commId;
  int serviceChargeId;
  String eventuniqId;
  int approved;
  String sessionId;
  String createdAt;
  String updatedAt;
  Cat mcat;
  Cat subcat;
  User user;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    eventId: json["eventId"],
    userId: json["userId"],
    typeId: json["typeId"],
    subtypeId: json["subtypeId"],
    eventName: json["eventName"],
    auditionseq: json["auditionseq"],
    eventDesc: json["eventDesc"],
    eventRound: json["eventRound"],
    eventReward: json["eventReward"],
    eventPrice: json["eventPrice"],
    eventJudgement: json["eventJudgement"],
    venuepartner: json["venuepartner"],
    judges: json["judges"],
    sponsors: json["sponsors"],
    eventProjects: json["eventProjects"],
    eventLocation: json["eventLocation"],
    startDate: DateTime.parse(json["startDate"]),
    startTime: json["startTime"],
    endDate: DateTime.parse(json["endDate"]),
    endTime: json["endTime"],
    eventStatus: json["eventStatus"],
    eventImg: json["eventImg"],
    eventBanner: json["eventBanner"],
    partnerPublish: json["partnerPublish"],
    participatePublish: json["participatePublish"],
    eventvisiblity: json["eventvisiblity"],
    tempId: json["tempId"],
    commId: json["commId"],
    serviceChargeId: json["serviceChargeId"],
    eventuniqId: json["eventuniqId"],
    approved: json["approved"],
    sessionId: json["sessionId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    mcat: Cat.fromJson(json["mcat"]),
    subcat: Cat.fromJson(json["subcat"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "userId": userId,
    "typeId": typeId,
    "subtypeId": subtypeId,
    "eventName": eventName,
    "auditionseq": auditionseq,
    "eventDesc": eventDesc,
    "eventRound": eventRound,
    "eventReward": eventReward,
    "eventPrice": eventPrice,
    "eventJudgement": eventJudgement,
    "venuepartner": venuepartner,
    "judges": judges,
    "sponsors": sponsors,
    "eventProjects": eventProjects,
    "eventLocation": eventLocation,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "endTime": endTime,
    "eventStatus": eventStatus,
    "eventImg": eventImg,
    "eventBanner": eventBanner,
    "partnerPublish": partnerPublish,
    "participatePublish": participatePublish,
    "eventvisiblity": eventvisiblity,
    "tempId": tempId,
    "commId": commId,
    "serviceChargeId": serviceChargeId,
    "eventuniqId": eventuniqId,
    "approved": approved,
    "sessionId": sessionId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "mcat": mcat.toJson(),
    "subcat": subcat.toJson(),
    "user": user.toJson(),
  };
}

class Cat {
  Cat({
    required this.typeId,
    required this.typeName,
    required this.catimg,
  });

  int typeId;
  String typeName;
  String catimg;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    typeId: json["typeId"],
    typeName: json["typeName"],
    catimg: json["catimg"],
  );

  Map<String, dynamic> toJson() => {
    "typeId": typeId,
    "typeName": typeName,
    "catimg": catimg,
  };
}

class User {
  User({
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.mobile,
    required this.date,
    required this.status,
    this.businessId,
    this.referedCode,
    this.fname,
    this.location,
    this.about,
    required this.st,
    this.services,
    required this.paid,
    this.userImg,
    required this.wallet,
  });

  int userId;
  String name;
  String username;
  String email;
  String mobile;
  String date;
  int status;
  String? businessId;
  dynamic referedCode;
  dynamic fname;
  dynamic location;
  dynamic about;
  String st;
  dynamic services;
  String paid;
  dynamic userImg;
  int wallet;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    date: json["date"],
    status: json["status"],
    businessId: json["businessId"],
    referedCode: json["referedCode"],
    fname: json["fname"],
    location: json["location"],
    about: json["about"],
    st: json["st"],
    services: json["services"],
    paid: json["paid"],
    userImg: json["userImg"],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "username": username,
    "email": email,
    "mobile": mobile,
    "date": date,
    "status": status,
    "businessId": businessId,
    "referedCode": referedCode,
    "fname": fname,
    "location": location,
    "about": about,
    "st": st,
    "services": services,
    "paid": paid,
    "userImg": userImg,
    "wallet": wallet,
  };
}
