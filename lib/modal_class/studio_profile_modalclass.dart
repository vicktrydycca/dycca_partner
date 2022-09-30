// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.user,
    this.studio,
    this.cats,
    this.servcat,
    this.equipments,
    this.amenities,
    this.status,
  });

  User? user;
  Studio? studio;
  List<Cat>? cats;
  dynamic servcat;
  List<Amenity>? equipments;
  List<Amenity>? amenities;
  bool? status;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    user: User.fromJson(json["user"]),
    studio: Studio.fromJson(json["studio"]),
    cats: List<Cat>.from(json["cats"].map((x) => Cat.fromJson(x))),
    servcat: json["servcat"],
    equipments: List<Amenity>.from(json["equipments"].map((x) => Amenity.fromJson(x))),
    amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "studio": studio!.toJson(),
    "cats": List<dynamic>.from(cats!.map((x) => x.toJson())),
    "servcat": servcat,
    "equipments": List<dynamic>.from(equipments!.map((x) => x.toJson())),
    "amenities": List<dynamic>.from(amenities!.map((x) => x.toJson())),
    "status": status,
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
    this.equipId,
    this.equipName,
  });

  int? amentId;
  int? catId;
  String? amentName;
  dynamic image;
  int? status;
  dynamic createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? equipId;
  String? equipName;

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    amentId: json["amentId"] == null ? null : json["amentId"],
    catId: json["catId"] == null ? null : json["catId"],
    amentName: json["amentName"] == null ? null : json["amentName"],
    image: json["image"],
    status: json["status"],
    createdBy: json["createdBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    equipId: json["equipId"] == null ? null : json["equipId"],
    equipName: json["equipName"] == null ? null : json["equipName"],
  );

  Map<String, dynamic> toJson() => {
    "amentId": amentId == null ? null : amentId,
    "catId": catId == null ? null : catId,
    "amentName": amentName == null ? null : amentName,
    "image": image,
    "status": status,
    "createdBy": createdBy,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "equipId": equipId == null ? null : equipId,
    "equipName": equipName == null ? null : equipName,
  };
}

class Cat {
  Cat({
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

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
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

class Studio {
  Studio({
    this.studioId,
    this.userId,
    this.catId,
    this.studioName,
    this.searchKeyword,
    this.studioUniq,
    this.studioLogo,
    this.location,
    this.about,
    this.studioRules,
    this.studioTime,
    this.charges,
    this.amentities,
    this.equipment,
    this.status,
    this.completionRatio,
    this.createdAt,
    this.updatedAt,
    this.service,
    this.stamenity,
    this.stequipment,
    this.sttime,
    this.stimg,
  });

  int? studioId;
  int? userId;
  int? catId;
  String? studioName;
  dynamic searchKeyword;
  dynamic studioUniq;
  String? studioLogo;
  String? location;
  String? about;
  String? studioRules;
  dynamic studioTime;
  String? charges;
  String? amentities;
  String? equipment;
  int? status;
  int? completionRatio;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;
  List<Stamenity>? stamenity;
  List<Stequipment>? stequipment;
  List<Sttime>? sttime;
  List<Stimg>? stimg;

  factory Studio.fromJson(Map<String, dynamic> json) => Studio(
    studioId: json["studioId"],
    userId: json["userId"],
    catId: json["catId"],
    studioName: json["studioName"],
    searchKeyword: json["searchKeyword"],
    studioUniq: json["studioUniq"],
    studioLogo: json["studioLogo"],
    location: json["location"],
    about: json["about"],
    studioRules: json["studioRules"],
    studioTime: json["studioTime"],
    charges: json["charges"],
    amentities: json["amentities"],
    equipment: json["equipment"],
    status: json["status"],
    completionRatio: json["completionRatio"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    service: Service.fromJson(json["service"]),
    stamenity: List<Stamenity>.from(json["stamenity"].map((x) => Stamenity.fromJson(x))),
    stequipment: List<Stequipment>.from(json["stequipment"].map((x) => Stequipment.fromJson(x))),
    sttime: List<Sttime>.from(json["sttime"].map((x) => Sttime.fromJson(x))),
    stimg: List<Stimg>.from(json["stimg"].map((x) => Stimg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "studioId": studioId,
    "userId": userId,
    "catId": catId,
    "studioName": studioName,
    "searchKeyword": searchKeyword,
    "studioUniq": studioUniq,
    "studioLogo": studioLogo,
    "location": location,
    "about": about,
    "studioRules": studioRules,
    "studioTime": studioTime,
    "charges": charges,
    "amentities": amentities,
    "equipment": equipment,
    "status": status,
    "completionRatio": completionRatio,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "service": service!.toJson(),
    "stamenity": List<dynamic>.from(stamenity!.map((x) => x.toJson())),
    "stequipment": List<dynamic>.from(stequipment!.map((x) => x.toJson())),
    "sttime": List<dynamic>.from(sttime!.map((x) => x.toJson())),
    "stimg": List<dynamic>.from(stimg!.map((x) => x.toJson())),
  };
}

class Service {
  Service({
    this.catId,
    this.catName,
    this.catImg,
  });

  int? catId;
  String? catName;
  dynamic catImg;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    catId: json["catId"],
    catName: json["catName"],
    catImg: json["catImg"],
  );

  Map<String, dynamic> toJson() => {
    "catId": catId,
    "catName": catName,
    "catImg": catImg,
  };
}

class Stamenity {
  Stamenity({
    this.id,
    this.studioId,
    this.amentId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.amenities,
  });

  int? id;
  int? studioId;
  int? amentId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Amenity? amenities;

  factory Stamenity.fromJson(Map<String, dynamic> json) => Stamenity(
    id: json["id"],
    studioId: json["studioId"],
    amentId: json["amentId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    amenities: Amenity.fromJson(json["amenities"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "studioId": studioId,
    "amentId": amentId,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "amenities": amenities!.toJson(),
  };
}

class Stequipment {
  Stequipment({
    this.id,
    this.studioId,
    this.equipId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.equipment,
  });

  int? id;
  int? studioId;
  int? equipId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Amenity? equipment;

  factory Stequipment.fromJson(Map<String, dynamic> json) => Stequipment(
    id: json["id"],
    studioId: json["studioId"],
    equipId: json["equipId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    equipment: Amenity.fromJson(json["equipment"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "studioId": studioId,
    "equipId": equipId,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "equipment": equipment!.toJson(),
  };
}

class Stimg {
  Stimg({
    this.imgId,
    this.studioId,
    this.imgUrl,
    this.createdAt,
    this.updatedAt,
  });

  int? imgId;
  int? studioId;
  String? imgUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Stimg.fromJson(Map<String, dynamic> json) => Stimg(
    imgId: json["imgId"],
    studioId: json["studioId"],
    imgUrl: json["imgUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "imgId": imgId,
    "studioId": studioId,
    "imgUrl": imgUrl,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class Sttime {
  Sttime({
    this.id,
    this.studioId,
    this.weekdays,
    this.multiday,
    this.fromDay,
    this.today,
    this.closed,
    this.fromTime,
    this.toTime,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? studioId;
  dynamic weekdays;
  int? multiday;
  String? fromDay;
  String? today;
  int? closed;
  dynamic fromTime;
  dynamic toTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Sttime.fromJson(Map<String, dynamic> json) => Sttime(
    id: json["id"],
    studioId: json["studioId"],
    weekdays: json["weekdays"],
    multiday: json["multiday"],
    fromDay: json["fromDay"],
    today: json["today"],
    closed: json["closed"],
    fromTime: json["fromTime"],
    toTime: json["toTime"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "studioId": studioId,
    "weekdays": weekdays,
    "multiday": multiday,
    "fromDay": fromDay,
    "today": today,
    "closed": closed,
    "fromTime": fromTime,
    "toTime": toTime,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class User {
  User({
    this.userId,
    this.name,
    this.username,
    this.email,
    this.mobile,
    this.date,
    this.status,
    this.businessId,
    this.referedCode,
    this.fname,
    this.location,
    this.about,
    this.st,
    this.services,
    this.paid,
    this.userImg,
    this.wallet,
  });

  int? userId;
  String? name;
  String? username;
  String? email;
  String? mobile;
  DateTime? date;
  int? status;
  String? businessId;
  String? referedCode;
  dynamic fname;
  String? location;
  String? about;
  String? st;
  dynamic services;
  String? paid;
  String? userImg;
  int? wallet;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    date: DateTime.parse(json["date"]),
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
    "date": date!.toIso8601String(),
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
