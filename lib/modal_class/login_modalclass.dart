// To parse this JSON data, do
//
//     final loginModalClass = loginModalClassFromJson(jsonString);

import 'dart:convert';

LoginModalClass loginModalClassFromJson(String str) => LoginModalClass.fromJson(json.decode(str));

String loginModalClassToJson(LoginModalClass data) => json.encode(data.toJson());

class LoginModalClass {
  LoginModalClass({
    this.user,
    this.userservice,
    this.userprofession,
    this.token,
    this.status,
  });

  User? user;
  List<dynamic>? userservice;
  List<Userprofession>? userprofession;
  String? token;
  bool? status;

  factory LoginModalClass.fromJson(Map<String, dynamic> json) => LoginModalClass(
    user: User.fromJson(json["user"]),
    userservice: List<dynamic>.from(json["userservice"].map((x) => x)),
    userprofession: List<Userprofession>.from(json["userprofession"].map((x) => Userprofession.fromJson(x))),
    token: json["token"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "userservice": List<dynamic>.from(userservice!.map((x) => x)),
    "userprofession": List<dynamic>.from(userprofession!.map((x) => x.toJson())),
    "token": token,
    "status": status,
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
    this.usertype,
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
  List<Usertype>? usertype;

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
    usertype: List<Usertype>.from(json["usertype"].map((x) => Usertype.fromJson(x))),
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
    "usertype": List<dynamic>.from(usertype!.map((x) => x.toJson())),
  };
}

class Usertype {
  Usertype({
    this.id,
    this.userId,
    this.roleId,
  });

  int? id;
  int? userId;
  int? roleId;

  factory Usertype.fromJson(Map<String, dynamic> json) => Usertype(
    id: json["id"],
    userId: json["userId"],
    roleId: json["roleId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "roleId": roleId,
  };
}

class Userprofession {
  Userprofession({
    this.id,
    this.professionId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.profession,
    this.userskill,
  });

  int? id;
  int? professionId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Profession? profession;
  List<Userskill>? userskill;

  factory Userprofession.fromJson(Map<String, dynamic> json) => Userprofession(
    id: json["id"],
    professionId: json["professionId"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    profession: Profession.fromJson(json["profession"]),
    userskill: List<Userskill>.from(json["userskill"].map((x) => Userskill.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "professionId": professionId,
    "userId": userId,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "profession": profession!.toJson(),
    "userskill": List<dynamic>.from(userskill!.map((x) => x.toJson())),
  };
}

class Profession {
  Profession({
    this.professionId,
    this.userCatId,
    this.profeesionName,
    this.professionimg,
    this.artId,
    this.status,
  });

  int? professionId;
  int? userCatId;
  String? profeesionName;
  String? professionimg;
  int? artId;
  int? status;

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
    professionId: json["professionId"],
    userCatId: json["userCatId"],
    profeesionName: json["profeesionName"],
    professionimg: json["professionimg"],
    artId: json["artId"] == null ? null : json["artId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "professionId": professionId,
    "userCatId": userCatId,
    "profeesionName": profeesionName,
    "professionimg": professionimg,
    "artId": artId == null ? null : artId,
    "status": status,
  };
}

class Userskill {
  Userskill({
    this.id,
    this.userId,
    this.professionId,
    this.skillId,
    this.createdAt,
    this.updatedAt,
    this.skills,
  });

  int? id;
  int? userId;
  int? professionId;
  int? skillId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Skills? skills;

  factory Userskill.fromJson(Map<String, dynamic> json) => Userskill(
    id: json["id"],
    userId: json["userId"],
    professionId: json["professionId"],
    skillId: json["skillId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    skills: Skills.fromJson(json["skills"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "professionId": professionId,
    "skillId": skillId,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "skills": skills!.toJson(),
  };
}

class Skills {
  Skills({
    this.skillId,
    this.professionId,
    this.skillName,
    this.status,
    this.scount,
    this.createdAt,
    this.updatedAt,
  });

  int? skillId;
  int? professionId;
  String? skillName;
  int? status;
  int? scount;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Skills.fromJson(Map<String, dynamic> json) => Skills(
    skillId: json["skillId"],
    professionId: json["professionId"],
    skillName: json["skillName"],
    status: json["status"],
    scount: json["scount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "skillId": skillId,
    "professionId": professionId,
    "skillName": skillName,
    "status": status,
    "scount": scount,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
