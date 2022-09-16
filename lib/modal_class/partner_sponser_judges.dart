// To parse this JSON data, do
//
//     final partnerSponserJudges = partnerSponserJudgesFromJson(jsonString);

import 'dart:convert';

PartnerSponserJudges partnerSponserJudgesFromJson(String str) => PartnerSponserJudges.fromJson(json.decode(str));

String partnerSponserJudgesToJson(PartnerSponserJudges data) => json.encode(data.toJson());

class PartnerSponserJudges {
  PartnerSponserJudges({
    this.status,
    this.message,
    this.sponsers,
    this.partners,
    this.performancecat,
    this.projects,
    this.judges,
  });

  bool? status;
  String? message;
  List<Judge>? sponsers;
  List<Judge>? partners;
  List<Performancecat>? performancecat;
  List<Project>? projects;
  List<Judge>? judges;

  PartnerSponserJudges copyWith({
    bool? status,
    String? message,
    List<Judge>? sponsers,
    List<Judge>? partners,
    List<Performancecat>? performancecat,
    List<Project>? projects,
    List<Judge>? judges,
  }) =>
      PartnerSponserJudges(
        status: status ?? this.status,
        message: message ?? this.message,
        sponsers: sponsers ?? this.sponsers,
        partners: partners ?? this.partners,
        performancecat: performancecat ?? this.performancecat,
        projects: projects ?? this.projects,
        judges: judges ?? this.judges,
      );

  factory PartnerSponserJudges.fromJson(Map<String, dynamic> json) => PartnerSponserJudges(
    status: json["status"],
    message: json["message"],
    sponsers: List<Judge>.from(json["sponsers"].map((x) => Judge.fromJson(x))),
    partners: List<Judge>.from(json["partners"].map((x) => Judge.fromJson(x))),
    performancecat: List<Performancecat>.from(json["performancecat"].map((x) => Performancecat.fromJson(x))),
    projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
    judges: List<Judge>.from(json["judges"].map((x) => Judge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "sponsers": List<dynamic>.from(sponsers!.map((x) => x.toJson())),
    "partners": List<dynamic>.from(partners!.map((x) => x.toJson())),
    "performancecat": List<dynamic>.from(performancecat!.map((x) => x.toJson())),
    "projects": List<dynamic>.from(projects!.map((x) => x.toJson())),
    "judges": List<dynamic>.from(judges!.map((x) => x.toJson())),
  };
}

class Judge {
  Judge({
    this.userId,
    this.name,
    this.username,
    this.studioName,
  });

  int? userId;
  String? name;
  String? username;
  String? studioName;

  Judge copyWith({
    int? userId,
    String? name,
    String? username,
    String? studioName,
  }) =>
      Judge(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        username: username ?? this.username,
        studioName: studioName ?? this.studioName,
      );

  factory Judge.fromJson(Map<String, dynamic> json) => Judge(
    userId: json["userId"],
    name: json["name"],
    username: json["username"],
    studioName: json["studioName"] == null ? null : json["studioName"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "username": username,
    "studioName": studioName == null ? null : studioName,
  };
}


class Performancecat {
  Performancecat({
    this.pcatId,
    this.pcatName,
    this.status,
  });

  int? pcatId;
  String? pcatName;
  int? status;

  Performancecat copyWith({
    int? pcatId,
    String? pcatName,
    int? status,
  }) =>
      Performancecat(
        pcatId: pcatId ?? this.pcatId,
        pcatName: pcatName ?? this.pcatName,
        status: status ?? this.status,
      );

  factory Performancecat.fromJson(Map<String, dynamic> json) => Performancecat(
    pcatId: json["pcatId"],
    pcatName: json["pcatName"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "pcatId": pcatId,
    "pcatName": pcatName,
    "status": status,
  };
}

class Project {
  Project({
    this.projectId,
    this.userCatId,
    this.projectName,
    this.artId,
    this.projectimg,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? projectId;
  int? userCatId;
  String? projectName;
  int? artId;
  String? projectimg;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Project copyWith({
    int? projectId,
    int? userCatId,
    String? projectName,
    int? artId,
    String? projectimg,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Project(
        projectId: projectId ?? this.projectId,
        userCatId: userCatId ?? this.userCatId,
        projectName: projectName ?? this.projectName,
        artId: artId ?? this.artId,
        projectimg: projectimg ?? this.projectimg,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    projectId: json["projectId"],
    userCatId: json["userCatId"],
    projectName: json["projectName"],
    artId: json["artId"],
    projectimg: json["projectimg"] == null ? null : json["projectimg"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "projectId": projectId,
    "userCatId": userCatId,
    "projectName": projectName,
    "artId": artId,
    "projectimg": projectimg == null ? null : projectimg,
    "status": status,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
