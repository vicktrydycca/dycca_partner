// To parse this JSON data, do
//
//     final eventHistoryModalClass = eventHistoryModalClassFromJson(jsonString);

import 'dart:convert';

EventHistoryModalClass eventHistoryModalClassFromJson(String str) => EventHistoryModalClass.fromJson(json.decode(str));

String eventHistoryModalClassToJson(EventHistoryModalClass data) => json.encode(data.toJson());

class EventHistoryModalClass {
  EventHistoryModalClass({
    required this.status,
    required this.message,
    required this.events,
  });

  bool status;
  String message;
  List<Event> events;

  factory EventHistoryModalClass.fromJson(Map<String, dynamic> json) => EventHistoryModalClass(
    status: json["status"],
    message: json["message"],
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
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
    required this.eventPrice,
    required this.venuepartner,
    required this.judges,
    required this.sponsors,
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
    this.commId,
    required this.serviceChargeId,
    required this.eventuniqId,
    required this.approved,
    this.sessionId,
    required this.createdAt,
    required this.updatedAt,
    required this.auditionSequence,
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
  List<EventPrice> eventPrice;
  List<Venuepartner> venuepartner;
  List<Judge> judges;
  List<Sponsor> sponsors;
  dynamic eventLocation;
  DateTime startDate;
  String startTime;
  DateTime endDate;
  String endTime;
  int eventStatus;
  String? eventImg;
  String? eventBanner;
  int partnerPublish;
  int participatePublish;
  int eventvisiblity;
  int? commId;
  int serviceChargeId;
  String eventuniqId;
  int approved;
  String? sessionId;
  String createdAt;
  String updatedAt;
  String auditionSequence;
  Mcat mcat;
  Subcat subcat;
  User user;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    eventId: json["eventId"],
    userId: json["userId"],
    typeId: json["typeId"],
    subtypeId: json["subtypeId"],
    eventName: json["eventName"],
    auditionseq: json["auditionseq"],
    eventDesc: json["eventDesc"],
    eventPrice: List<EventPrice>.from(json["eventPrice"].map((x) => EventPrice.fromJson(x))),
    venuepartner: List<Venuepartner>.from(json["venuepartner"].map((x) => Venuepartner.fromJson(x))),
    judges: List<Judge>.from(json["judges"].map((x) => Judge.fromJson(x))),
    sponsors: List<Sponsor>.from(json["sponsors"].map((x) => Sponsor.fromJson(x))),
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
    commId: json["commId"],
    serviceChargeId: json["serviceChargeId"],
    eventuniqId: json["eventuniqId"],
    approved: json["approved"],
    sessionId: json["sessionId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    auditionSequence: json["audition_sequence"],
    mcat: Mcat.fromJson(json["mcat"]),
    subcat: Subcat.fromJson(json["subcat"]),
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
    "eventPrice": List<dynamic>.from(eventPrice.map((x) => x.toJson())),
    "venuepartner": List<dynamic>.from(venuepartner.map((x) => x.toJson())),
    "judges": List<dynamic>.from(judges.map((x) => x.toJson())),
    "sponsors": List<dynamic>.from(sponsors.map((x) => x.toJson())),
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
    "commId": commId,
    "serviceChargeId": serviceChargeId,
    "eventuniqId": eventuniqId,
    "approved": approved,
    "sessionId": sessionId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "audition_sequence": auditionSequence,
    "mcat": mcat.toJson(),
    "subcat": subcat.toJson(),
    "user": user.toJson(),
  };
}

class EventPrice {
  EventPrice({
    required this.pcatId,
    required this.price,
    required this.pricewithfriends,
    this.pcatName,
  });

  String pcatId;
  String price;
  String pricewithfriends;
  String? pcatName;

  factory EventPrice.fromJson(Map<String, dynamic> json) => EventPrice(
    pcatId: json["pcatId"],
    price: json["price"],
    pricewithfriends: json["pricewithfriends"],
    pcatName: json["pcatName"],
  );

  Map<String, dynamic> toJson() => {
    "pcatId": pcatId,
    "price": price,
    "pricewithfriends": pricewithfriends,
    "pcatName": pcatName,
  };
}

class Judge {
  Judge({
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.mobile,
    this.userImg,
  });

  int userId;
  String name;
  String username;
  String email;
  String mobile;
  String? userImg;

  factory Judge.fromJson(Map<String, dynamic> json) => Judge(
    userId: json["userId"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    userImg: json["userImg"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "username": username,
    "email": email,
    "mobile": mobile,
    "userImg": userImg,
  };
}

class Mcat {
  Mcat({
    required this.typeId,
    required this.typeName,
    required this.catimg,
  });

  int typeId;
  String typeName;
  String catimg;

  factory Mcat.fromJson(Map<String, dynamic> json) => Mcat(
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

class Sponsor {
  Sponsor({
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.mobile,
    this.userImg,
  });

  int userId;
  String name;
  String username;
  String email;
  String mobile;
  dynamic userImg;

  factory Sponsor.fromJson(Map<String, dynamic> json) => Sponsor(
    userId: json["userId"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    userImg: json["userImg"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "username": username,
    "email": email,
    "mobile": mobile,
    "userImg": userImg,
  };
}

class Subcat {
  Subcat({
    required this.typeId,
    required this.typeName,
    this.catimg,
  });

  int typeId;
  String typeName;
  String? catimg;

  factory Subcat.fromJson(Map<String, dynamic> json) => Subcat(
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
    required this.businessId,
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
  String businessId;
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

class Venuepartner {
  Venuepartner({
    required this.studioId,
    required this.studioName,
    this.studioLogo,
  });

  int studioId;
  String studioName;
  dynamic studioLogo;

  factory Venuepartner.fromJson(Map<String, dynamic> json) => Venuepartner(
    studioId: json["studioId"],
    studioName: json["studioName"],
    studioLogo: json["studioLogo"],
  );

  Map<String, dynamic> toJson() => {
    "studioId": studioId,
    "studioName": studioName,
    "studioLogo": studioLogo,
  };
}
