// To parse this JSON data, do
//
//     final eventListRoundwiseModelclass = eventListRoundwiseModelclassFromJson(jsonString);

import 'dart:convert';

EventListRoundwiseModelclass eventListRoundwiseModelclassFromJson(String str) => EventListRoundwiseModelclass.fromJson(json.decode(str));

String eventListRoundwiseModelclassToJson(EventListRoundwiseModelclass data) => json.encode(data.toJson());

class EventListRoundwiseModelclass {
  EventListRoundwiseModelclass({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory EventListRoundwiseModelclass.fromJson(Map<String, dynamic> json) => EventListRoundwiseModelclass(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.autionusers,
    this.eventrnd,
    this.auditions,
    this.auditratecheck,
    this.event,
    this.auditionjudge,
    this.eventRounds,
    this.roundId,
    this.eventsubs,
    this.users,
    this.studios,
    this.venueusers,
    this.judges,
    this.user,
    this.partnervenues,
    this.btntext,
    this.rndstate,
  });

  List<dynamic>? autionusers;
  Eventrnd? eventrnd;
  List<Audition>? auditions;
  Auditratecheck? auditratecheck;
  Event? event;
  Auditionjudge? auditionjudge;
  List<EventRound>? eventRounds;
  String? roundId;
  Eventsub? eventsubs;
  List<dynamic>? users;
  List<dynamic>? studios;
  List<Venueuser>? venueusers;
  List<Judge>? judges;
  DataUser? user;
  List<dynamic>? partnervenues;
  String? btntext;
  int? rndstate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    autionusers: List<dynamic>.from(json["autionusers"].map((x) => x)),
    eventrnd: Eventrnd.fromJson(json["eventrnd"]),
    auditions: List<Audition>.from(json["auditions"].map((x) => Audition.fromJson(x))),

    ///uncomment this
    // auditratecheck: Auditratecheck.fromJson(json["auditratecheck"]??""),
    event: Event.fromJson(json["event"]),
    // auditionjudge: Auditionjudge.fromJson(json["auditionjudge"]),
    eventRounds: List<EventRound>.from(json["eventRounds"].map((x) => EventRound.fromJson(x))),
    roundId: json["roundId"],
    eventsubs: Eventsub.fromJson(json["eventsubs"]),
    users: List<dynamic>.from(json["users"].map((x) => x)),
    studios: List<dynamic>.from(json["studios"].map((x) => x)),
    venueusers: List<Venueuser>.from(json["venueusers"].map((x) => Venueuser.fromJson(x))),
    judges: List<Judge>.from(json["judges"].map((x) => Judge.fromJson(x))),
    user: DataUser.fromJson(json["user"]),
    partnervenues: List<dynamic>.from(json["partnervenues"].map((x) => x)),
    btntext: json["btntext"],
    rndstate: json["rndstate"],
  );

  Map<String, dynamic> toJson() => {
    "autionusers": List<dynamic>.from(autionusers!.map((x) => x)),
    "eventrnd": eventrnd?.toJson(),
    "auditions": List<dynamic>.from(auditions!.map((x) => x.toJson())),
    "auditratecheck": auditratecheck?.toJson(),
    "event": event?.toJson(),
    "auditionjudge": auditionjudge?.toJson(),
    "eventRounds": List<dynamic>.from(eventRounds!.map((x) => x.toJson())),
    "roundId": roundId,
    "eventsubs": eventsubs?.toJson(),
    "users": List<dynamic>.from(users!.map((x) => x)),
    "studios": List<dynamic>.from(studios!.map((x) => x)),
    "venueusers": List<dynamic>.from(venueusers!.map((x) => x.toJson())),
    "judges": List<dynamic>.from(judges!.map((x) => x.toJson())),
    "user": user?.toJson(),
    "partnervenues": List<dynamic>.from(partnervenues!.map((x) => x)),
    "btntext": btntext,
    "rndstate": rndstate,
  };
}

class Auditionjudge {
  Auditionjudge({
    this.id,
    this.eventId,
    this.roundId,
    this.judgeUserId,
    this.judgeStatus,
  });

  int? id;
  int? eventId;
  String? roundId;
  int? judgeUserId;
  int? judgeStatus;

  factory Auditionjudge.fromJson(Map<String, dynamic> json) => Auditionjudge(
    id: json["id"],
    eventId: json["eventId"],
    roundId: json["roundId"],
    judgeUserId: json["judgeUserId"],
    judgeStatus: json["judgeStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eventId": eventId,
    "roundId": roundId,
    "judgeUserId": judgeUserId,
    "judgeStatus": judgeStatus,
  };
}

class Audition {
  Audition({
    this.audId,
    this.roundid,
    this.eventId,
    this.userId,
    this.projectId,
    this.title,
    this.videoUrl,
    this.embeded,
    this.channeUrl,
    this.teams,
    this.sortOrder,
    this.status,
    this.rating,
    this.trating,
    this.avgRating,
    this.tavgRating,
    this.judgeUserId,
    this.createdAt,
    this.updatedAt,
    this.auditrating,
    this.audimg,
    this.user,
  });

  int? audId;
  String? roundid;
  int? eventId;
  int? userId;
  int? projectId;
  String? title;
  String? videoUrl;
  dynamic embeded;
  dynamic channeUrl;
  List<String>? teams;
  int? sortOrder;
  int? status;
  int? rating;
  int? trating;
  int? avgRating;
  int? tavgRating;
  int? judgeUserId;
  String? createdAt;
  String? updatedAt;
  Auditrating? auditrating;
  List<Audimg>? audimg;
  AuditionUser? user;

  factory Audition.fromJson(Map<String, dynamic> json) => Audition(
    audId: json["audId"],
    roundid: json["roundid"],
    eventId: json["eventId"],
    userId: json["userId"],
    projectId: json["projectId"],
    title: json["title"],
    videoUrl: json["videoUrl"],
    embeded: json["embeded"],
    channeUrl: json["channeUrl"],
    teams: List<String>.from(json["teams"].map((x) => x)),
    sortOrder: json["sortOrder"],
    status: json["status"],
    rating: json["rating"],
    trating: json["trating"],
    avgRating: json["avgRating"],
    tavgRating: json["tavgRating"],
    judgeUserId: json["judgeUserId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    auditrating: json["auditrating"] == null ? null : Auditrating.fromJson(json["auditrating"]),
    audimg: List<Audimg>.from(json["audimg"].map((x) => Audimg.fromJson(x))),
    user: AuditionUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "audId": audId,
    "roundid": roundid,
    "eventId": eventId,
    "userId": userId,
    "projectId": projectId,
    "title": title,
    "videoUrl": videoUrl,
    "embeded": embeded,
    "channeUrl": channeUrl,
    "teams": List<dynamic>.from(teams!.map((x) => x)),
    "sortOrder": sortOrder,
    "status": status,
    "rating": rating,
    "trating": trating,
    "avgRating": avgRating,
    "tavgRating": tavgRating,
    "judgeUserId": judgeUserId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "auditrating":  auditrating?.toJson(),
    "audimg": List<dynamic>.from(audimg!.map((x) => x.toJson())),
    "user": user?.toJson(),
  };
}

class Audimg {
  Audimg({
    this.imgId,
    this.audId,
    this.imgUrl,
    this.createdAt,
    this.updatedAt,
  });

  int? imgId;
  int? audId;
  String? imgUrl;
  String? createdAt;
  String? updatedAt;

  factory Audimg.fromJson(Map<String, dynamic> json) => Audimg(
    imgId: json["imgId"],
    audId: json["audId"],
    imgUrl: json["imgUrl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "imgId": imgId,
    "audId": audId,
    "imgUrl": imgUrl,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class Auditrating {
  Auditrating({
    this.id,
    this.judgeUserId,
    this.roundId,
    this.audId,
    this.rating,
    this.trating,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? judgeUserId;
  String? roundId;
  int? audId;
  int? rating;
  int? trating;
  String? createdAt;
  String? updatedAt;

  factory Auditrating.fromJson(Map<String, dynamic> json) => Auditrating(
    id: json["id"],
    judgeUserId: json["judgeUserId"],
    roundId: json["roundId"],
    audId: json["audId"],
    rating: json["rating"],
    trating: json["trating"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judgeUserId": judgeUserId,
    "roundId": roundId,
    "audId": audId,
    "rating": rating,
    "trating": trating,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class AuditionUser {
  AuditionUser({
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
  String? date;
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

  factory AuditionUser.fromJson(Map<String, dynamic> json) => AuditionUser(
    userId: json["userId"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    date: json["date"],
    status: json["status"],
    businessId: json["businessId"] == null ? null : json["businessId"],
    referedCode: json["referedCode"] == null ? null : json["referedCode"],
    fname: json["fname"],
    location: json["location"] == null ? null : json["location"],
    about: json["about"] == null ? null : json["about"],
    st: json["st"],
    services: json["services"],
    paid: json["paid"],
    userImg: json["userImg"] == null ? null : json["userImg"],
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
    "businessId": businessId == null ? null : businessId,
    "referedCode": referedCode == null ? null : referedCode,
    "fname": fname,
    "location": location == null ? null : location,
    "about": about == null ? null : about,
    "st": st,
    "services": services,
    "paid": paid,
    "userImg": userImg == null ? null : userImg,
    "wallet": wallet,
  };
}

class Auditratecheck {
  Auditratecheck({
    this.audId,
    this.roundid,
    this.eventId,
    this.userId,
    this.projectId,
    this.title,
    this.videoUrl,
    this.embeded,
    this.channeUrl,
    this.teams,
    this.sortOrder,
    this.status,
    this.rating,
    this.trating,
    this.avgRating,
    this.tavgRating,
    this.judgeUserId,
    this.createdAt,
    this.updatedAt,
  });

  int? audId;
  String? roundid;
  int? eventId;
  int? userId;
  int? projectId;
  String? title;
  String? videoUrl;
  dynamic embeded;
  dynamic channeUrl;
  List<dynamic>? teams;
  int? sortOrder;
  int? status;
  int? rating;
  int? trating;
  int? avgRating;
  int? tavgRating;
  int? judgeUserId;
  String? createdAt;
  String? updatedAt;

  factory Auditratecheck.fromJson(Map<String, dynamic> json) => Auditratecheck(
    audId: json["audId"],
    roundid: json["roundid"],
    eventId: json["eventId"],
    userId: json["userId"],
    projectId: json["projectId"],
    title: json["title"],
    videoUrl: json["videoUrl"],
    embeded: json["embeded"],
    channeUrl: json["channeUrl"],
    teams: List<dynamic>.from(json["teams"].map((x) => x)),
    sortOrder: json["sortOrder"],
    status: json["status"],
    rating: json["rating"],
    trating: json["trating"],
    avgRating: json["avgRating"],
    tavgRating: json["tavgRating"],
    judgeUserId: json["judgeUserId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "audId": audId,
    "roundid": roundid,
    "eventId": eventId,
    "userId": userId,
    "projectId": projectId,
    "title": title,
    "videoUrl": videoUrl,
    "embeded": embeded,
    "channeUrl": channeUrl,
    "teams": List<dynamic>.from(teams!.map((x) => x)),
    "sortOrder": sortOrder,
    "status": status,
    "rating": rating,
    "trating": trating,
    "avgRating": avgRating,
    "tavgRating": tavgRating,
    "judgeUserId": judgeUserId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class Event {
  Event({
    this.eventId,
    this.userId,
    this.typeId,
    this.subtypeId,
    this.eventName,
    this.auditionseq,
    this.eventDesc,
    this.eventRound,
    this.eventReward,
    this.eventPrice,
    this.eventJudgement,
    this.venuepartner,
    this.judges,
    this.sponsors,
    this.eventProjects,
    this.eventLocation,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.eventStatus,
    this.eventImg,
    this.eventBanner,
    this.partnerPublish,
    this.participatePublish,
    this.eventvisiblity,
    this.tempId,
    this.commId,
    this.serviceChargeId,
    this.eventuniqId,
    this.approved,
    this.sessionId,
    this.createdAt,
    this.updatedAt,
    this.eventsubtype,
    this.mcat,
    this.subcat,
    this.visiblity,
  });

  int? eventId;
  int? userId;
  int? typeId;
  int? subtypeId;
  String? eventName;
  int? auditionseq;
  String? eventDesc;
  String? eventRound;
  String? eventReward;
  String? eventPrice;
  String? eventJudgement;
  String? venuepartner;
  String? judges;
  String? sponsors;
  String? eventProjects;
  dynamic eventLocation;
  DateTime? startDate;
  String? startTime;
  DateTime? endDate;
  String? endTime;
  int? eventStatus;
  dynamic eventImg;
  dynamic eventBanner;
  int? partnerPublish;
  int? participatePublish;
  int? eventvisiblity;
  int? tempId;
  dynamic commId;
  int? serviceChargeId;
  String? eventuniqId;
  int? approved;
  String? sessionId;
  String? createdAt;
  String? updatedAt;
  Eventsub? eventsubtype;
  Cat? mcat;
  Cat? subcat;
  Visiblity? visiblity;

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
    eventsubtype: Eventsub.fromJson(json["eventsubtype"]),
    mcat: Cat.fromJson(json["mcat"]),
    subcat: Cat.fromJson(json["subcat"]),
    visiblity: Visiblity.fromJson(json["visiblity"]),
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
    "startDate": "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endDate": "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
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
    "eventsubtype": eventsubtype?.toJson(),
    "mcat": mcat?.toJson(),
    "subcat": subcat?.toJson(),
    "visiblity": visiblity?.toJson(),
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
    catimg: json["catimg"],
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
    "catimg": catimg,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class Cat {
  Cat({
    this.typeId,
    this.typeName,
    this.catimg,
  });

  int? typeId;
  String? typeName;
  String? catimg;

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

class Visiblity {
  Visiblity({
    this.id,
    this.vname,
  });

  int? id;
  String? vname;

  factory Visiblity.fromJson(Map<String, dynamic> json) => Visiblity(
    id: json["id"],
    vname: json["vname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vname": vname,
  };
}

class EventRound {
  EventRound({
    this.id,
    this.roundid,
    this.eventId,
    this.round,
    this.onoff,
    this.sortOrder,
    this.startdate,
    this.starttime,
    this.enddate,
    this.endtime,
    this.judges,
    this.venue,
    this.judgeStatus,
    this.ownerStatus,
  });

  int? id;
  String? roundid;
  int? eventId;
  String? round;
  int? onoff;
  int? sortOrder;
  DateTime? startdate;
  String? starttime;
  DateTime? enddate;
  String? endtime;
  String? judges;
  dynamic venue;
  int? judgeStatus;
  int? ownerStatus;

  factory EventRound.fromJson(Map<String, dynamic> json) => EventRound(
    id: json["id"],
    roundid: json["roundid"],
    eventId: json["eventId"],
    round: json["round"],
    onoff: json["onoff"],
    sortOrder: json["sortOrder"],
    startdate: DateTime.parse(json["startdate"]),
    starttime: json["starttime"],
    enddate: DateTime.parse(json["enddate"]),
    endtime: json["endtime"],
    judges: json["judges"] == null ? null : json["judges"],
    venue: json["venue"],
    judgeStatus: json["judgeStatus"],
    ownerStatus: json["ownerStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "roundid": roundid,
    "eventId": eventId,
    "round": round,
    "onoff": onoff,
    "sortOrder": sortOrder,
    "startdate": "${startdate?.year.toString().padLeft(4, '0')}-${startdate?.month.toString().padLeft(2, '0')}-${startdate?.day.toString().padLeft(2, '0')}",
    "starttime": starttime,
    "enddate": "${enddate?.year.toString().padLeft(4, '0')}-${enddate?.month.toString().padLeft(2, '0')}-${enddate?.day.toString().padLeft(2, '0')}",
    "endtime": endtime,
    "judges": judges == null ? null : judges,
    "venue": venue,
    "judgeStatus": judgeStatus,
    "ownerStatus": ownerStatus,
  };
}

class Eventrnd {
  Eventrnd({
    this.id,
    this.roundid,
    this.eventId,
    this.round,
    this.onoff,
    this.sortOrder,
    this.startdate,
    this.starttime,
    this.enddate,
    this.endtime,
    this.judges,
    this.venue,
    this.judgeStatus,
    this.ownerStatus,
  });

  int? id;
  String? roundid;
  int? eventId;
  String? round;
  int? onoff;
  int? sortOrder;
  DateTime? startdate;
  String? starttime;
  DateTime? enddate;
  String? endtime;
  String? judges;
  dynamic venue;
  int? judgeStatus;
  int? ownerStatus;

  factory Eventrnd.fromJson(Map<String, dynamic> json) => Eventrnd(
    id: json["id"],
    roundid: json["roundid"],
    eventId: json["eventId"],
    round: json["round"],
    onoff: json["onoff"],
    sortOrder: json["sortOrder"],
    startdate: DateTime.parse(json["startdate"]),
    starttime: json["starttime"],
    enddate: DateTime.parse(json["enddate"]),
    endtime: json["endtime"],
    judges: json["judges"],
    venue: json["venue"],
    judgeStatus: json["judgeStatus"],
    ownerStatus: json["ownerStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "roundid": roundid,
    "eventId": eventId,
    "round": round,
    "onoff": onoff,
    "sortOrder": sortOrder,
    "startdate": "${startdate?.year.toString().padLeft(4, '0')}-${startdate?.month.toString().padLeft(2, '0')}-${startdate?.day.toString().padLeft(2, '0')}",
    "starttime": starttime,
    "enddate": "${enddate?.year.toString().padLeft(4, '0')}-${enddate?.month.toString().padLeft(2, '0')}-${enddate?.day.toString().padLeft(2, '0')}",
    "endtime": endtime,
    "judges": judges,
    "venue": venue,
    "judgeStatus": judgeStatus,
    "ownerStatus": ownerStatus,
  };
}

class Judge {
  Judge({
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
  String? date;
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

  factory Judge.fromJson(Map<String, dynamic> json) => Judge(
    userId: json["userId"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    date: json["date"],
    status: json["status"],
    businessId: json["businessId"],
    referedCode: json["referedCode"] == null ? null : json["referedCode"],
    fname: json["fname"],
    location: json["location"] == null ? null : json["location"],
    about: json["about"] == null ? null : json["about"],
    st: json["st"],
    services: json["services"],
    paid: json["paid"],
    userImg: json["userImg"] == null ? null : json["userImg"],
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
    "referedCode": referedCode == null ? null : referedCode,
    "fname": fname,
    "location": location == null ? null : location,
    "about": about == null ? null : about,
    "st": st,
    "services": services,
    "paid": paid,
    "userImg": userImg == null ? null : userImg,
    "wallet": wallet,
  };
}

class DataUser {
  DataUser({
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
  String? date;
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

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
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

class Venueuser {
  Venueuser({
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
    this.user,
  });

  int? studioId;
  int? userId;
  int? catId;
  String? studioName;
  String? searchKeyword;
  dynamic studioUniq;
  dynamic studioLogo;
  String? location;
  dynamic about;
  dynamic studioRules;
  dynamic studioTime;
  dynamic charges;
  dynamic amentities;
  dynamic equipment;
  int? status;
  int? completionRatio;
  String? createdAt;
  String? updatedAt;
  VenueuserUser? user;

  factory Venueuser.fromJson(Map<String, dynamic> json) => Venueuser(
    studioId: json["studioId"],
    userId: json["userId"],
    catId: json["catId"],
    studioName: json["studioName"],
    searchKeyword: json["searchKeyword"] == null ? null : json["searchKeyword"],
    studioUniq: json["studioUniq"],
    studioLogo: json["studioLogo"],
    location: json["location"] == null ? null : json["location"],
    about: json["about"],
    studioRules: json["studioRules"],
    studioTime: json["studioTime"],
    charges: json["charges"],
    amentities: json["amentities"],
    equipment: json["equipment"],
    status: json["status"],
    completionRatio: json["completionRatio"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    user: VenueuserUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "studioId": studioId,
    "userId": userId,
    "catId": catId,
    "studioName": studioName,
    "searchKeyword": searchKeyword == null ? null : searchKeyword,
    "studioUniq": studioUniq,
    "studioLogo": studioLogo,
    "location": location == null ? null : location,
    "about": about,
    "studioRules": studioRules,
    "studioTime": studioTime,
    "charges": charges,
    "amentities": amentities,
    "equipment": equipment,
    "status": status,
    "completionRatio": completionRatio,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "user": user?.toJson(),
  };
}

class VenueuserUser {
  VenueuserUser({
    this.userId,
    this.userImg,
    this.username,
    this.mobile,
    this.name,
    this.businessId,
    this.email,
  });

  int? userId;
  dynamic userImg;
  String? username;
  String? mobile;
  String? name;
  String? businessId;
  String? email;

  factory VenueuserUser.fromJson(Map<String, dynamic> json) => VenueuserUser(
    userId: json["userId"],
    userImg: json["userImg"],
    username: json["username"],
    mobile: json["mobile"],
    name: json["name"],
    businessId: json["businessId"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userImg": userImg,
    "username": username,
    "mobile": mobile,
    "name": name,
    "businessId": businessId,
    "email": email,
  };
}
