// To parse this JSON data, do
//
//     final eventTypeDetaillsModalClass = eventTypeDetaillsModalClassFromJson(jsonString);

import 'dart:convert';

EventTypeDetaillsModalClass eventTypeDetaillsModalClassFromJson(String str) => EventTypeDetaillsModalClass.fromJson(json.decode(str));

String eventTypeDetaillsModalClassToJson(EventTypeDetaillsModalClass data) => json.encode(data.toJson());

class EventTypeDetaillsModalClass {
  EventTypeDetaillsModalClass({
    this.status,
    this.message,
    this.event,
  });

  bool? status;
  String? message;
  Event? event;

  factory EventTypeDetaillsModalClass.fromJson(Map<String, dynamic> json) => EventTypeDetaillsModalClass(
    status: json["status"],
    message: json["message"],
    event: Event.fromJson(json["event"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "event": event!.toJson(),
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
    this.venuepartnerTotal,
    this.judgesTotal,
    this.sponsorsTotal,
    this.collaboratorTotal,
    this.ratingTotal,
    this.auditionSequence,
    this.participantTotal,
    this.eventsubtype,
    this.eventround,
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
  List<EventRound>? eventRound;
  List<EventReward>? eventReward;
  List<EventPrice>? eventPrice;
  List<String>? eventJudgement;
  List<Venuepartner>? venuepartner;
  List<Judge>? judges;
  List<Judge>? sponsors;
  List<EventProject>? eventProjects;
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
  int? venuepartnerTotal;
  int? judgesTotal;
  int? sponsorsTotal;
  int? collaboratorTotal;
  int? ratingTotal;
  String? auditionSequence;
  int? participantTotal;
  Eventsubtype? eventsubtype;
  List<Eventround>? eventround;
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
    eventRound: List<EventRound>.from(json["eventRound"].map((x) => EventRound.fromJson(x))),
    eventReward: List<EventReward>.from(json["eventReward"].map((x) => EventReward.fromJson(x))),
    eventPrice: List<EventPrice>.from(json["eventPrice"].map((x) => EventPrice.fromJson(x))),
    eventJudgement: List<String>.from(json["eventJudgement"].map((x) => x)),
    venuepartner: List<Venuepartner>.from(json["venuepartner"].map((x) => Venuepartner.fromJson(x))),
    judges: List<Judge>.from(json["judges"].map((x) => Judge.fromJson(x))),
    sponsors: List<Judge>.from(json["sponsors"].map((x) => Judge.fromJson(x))),
    eventProjects: List<EventProject>.from(json["eventProjects"].map((x) => EventProject.fromJson(x))),
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
    venuepartnerTotal: json["venuepartner_total"],
    judgesTotal: json["judges_total"],
    sponsorsTotal: json["sponsors_total"],
    collaboratorTotal: json["collaborator_total"],
    ratingTotal: json["rating_total"],
    auditionSequence: json["audition_sequence"],
    participantTotal: json["participant_total"],
    eventsubtype: Eventsubtype.fromJson(json["eventsubtype"]),
    eventround: List<Eventround>.from(json["eventround"].map((x) => Eventround.fromJson(x))),
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
    "eventRound": List<dynamic>.from(eventRound!.map((x) => x.toJson())),
    "eventReward": List<dynamic>.from(eventReward!.map((x) => x.toJson())),
    "eventPrice": List<dynamic>.from(eventPrice!.map((x) => x.toJson())),
    "eventJudgement": List<dynamic>.from(eventJudgement!.map((x) => x)),
    "venuepartner": List<dynamic>.from(venuepartner!.map((x) => x.toJson())),
    "judges": List<dynamic>.from(judges!.map((x) => x.toJson())),
    "sponsors": List<dynamic>.from(sponsors!.map((x) => x.toJson())),
    "eventProjects": List<dynamic>.from(eventProjects!.map((x) => x.toJson())),
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
    "venuepartner_total": venuepartnerTotal,
    "judges_total": judgesTotal,
    "sponsors_total": sponsorsTotal,
    "collaborator_total": collaboratorTotal,
    "rating_total": ratingTotal,
    "audition_sequence": auditionSequence,
    "participant_total": participantTotal,
    "eventsubtype": eventsubtype!.toJson(),
    "eventround": List<dynamic>.from(eventround!.map((x) => x.toJson())),
    "mcat": mcat!.toJson(),
    "subcat": subcat!.toJson(),
    "visiblity": visiblity!.toJson(),
  };
}

class EventPrice {
  EventPrice({
    this.pcatId,
    this.pcatName,
    this.price,
    this.pricewithfriends,
  });

  String? pcatId;
  String? pcatName;
  String? price;
  String? pricewithfriends;

  factory EventPrice.fromJson(Map<String, dynamic> json) => EventPrice(
    pcatId: json["pcatId"],
    pcatName: json["pcatName"],
    price: json["price"],
    pricewithfriends: json["pricewithfriends"],
  );

  Map<String, dynamic> toJson() => {
    "pcatId": pcatId,
    "pcatName": pcatName,
    "price": price,
    "pricewithfriends": pricewithfriends,
  };
}

class EventProject {
  EventProject({
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
  String? createdAt;
  String? updatedAt;

  factory EventProject.fromJson(Map<String, dynamic> json) => EventProject(
    projectId: json["projectId"],
    userCatId: json["userCatId"],
    projectName: json["projectName"],
    artId: json["artId"],
    projectimg: json["projectimg"],
    status: json["status"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "projectId": projectId,
    "userCatId": userCatId,
    "projectName": projectName,
    "artId": artId,
    "projectimg": projectimg,
    "status": status,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class EventReward {
  EventReward({
    this.pcatId,
    this.pcatName,
    this.reward,
  });

  String? pcatId;
  String? pcatName;
  String? reward;

  factory EventReward.fromJson(Map<String, dynamic> json) => EventReward(
    pcatId: json["pcatId"],
    pcatName: json["pcatName"],
    reward: json["reward"],
  );

  Map<String, dynamic> toJson() => {
    "pcatId": pcatId,
    "pcatName": pcatName,
    "reward": reward,
  };
}

class EventRound {
  EventRound({
    this.roundid,
    this.round,
    this.sortorder,
    this.onoff,
    this.startdate,
    this.enddate,
    this.starttime,
    this.endtime,
  });

  String? roundid;
  String? round;
  int? sortorder;
  int? onoff;
  String? startdate;
  String? enddate;
  String? starttime;
  String? endtime;

  factory EventRound.fromJson(Map<String, dynamic> json) => EventRound(
    roundid: json["roundid"],
    round: json["round"],
    sortorder: json["sortorder"],
    onoff: json["onoff"],
    startdate: json["startdate"],
    enddate: json["enddate"],
    starttime: json["starttime"],
    endtime: json["endtime"],
  );

  Map<String, dynamic> toJson() => {
    "roundid": roundid,
    "round": round,
    "sortorder": sortorder,
    "onoff": onoff,
    "startdate": startdate,
    "enddate": enddate,
    "starttime": starttime,
    "endtime": endtime,
  };
}

class Eventround {
  Eventround({
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
  dynamic judges;
  dynamic venue;
  int? judgeStatus;
  int? ownerStatus;

  factory Eventround.fromJson(Map<String, dynamic> json) => Eventround(
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

class Eventsubtype {
  Eventsubtype({
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

  factory Eventsubtype.fromJson(Map<String, dynamic> json) => Eventsubtype(
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
  dynamic businessId;
  dynamic referedCode;
  dynamic fname;
  dynamic location;
  dynamic about;
  String? st;
  dynamic services;
  String? paid;
  dynamic userImg;
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

class Venuepartner {
  Venuepartner({
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

  factory Venuepartner.fromJson(Map<String, dynamic> json) => Venuepartner(
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
