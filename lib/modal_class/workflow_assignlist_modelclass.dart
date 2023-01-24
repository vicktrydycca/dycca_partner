// To parse this JSON data, do
//
//     final workflowAssignlistModelclass = workflowAssignlistModelclassFromJson(jsonString);

import 'dart:convert';

WorkflowAssignlistModelclass workflowAssignlistModelclassFromJson(String str) => WorkflowAssignlistModelclass.fromJson(json.decode(str));

String workflowAssignlistModelclassToJson(WorkflowAssignlistModelclass data) => json.encode(data.toJson());

class WorkflowAssignlistModelclass {
  WorkflowAssignlistModelclass({
    this.status,
    this.assignworkflow,
  });

  bool? status;
  List<Assignworkflow>? assignworkflow;

  factory WorkflowAssignlistModelclass.fromJson(Map<String, dynamic> json) => WorkflowAssignlistModelclass(
    status: json["status"],
    assignworkflow: List<Assignworkflow>.from(json["assignworkflow"].map((x) => Assignworkflow.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "assignworkflow": List<dynamic>.from(assignworkflow!.map((x) => x.toJson())),
  };
}

class Assignworkflow {
  Assignworkflow({
    this.workflowId,
    this.workflowTitle,
    this.seq,
    this.status,
  });

  int? workflowId;
  String? workflowTitle;
  int? seq;
  int? status;

  factory Assignworkflow.fromJson(Map<String, dynamic> json) => Assignworkflow(
    workflowId: json["workflowId"],
    workflowTitle: json["workflow_title"],
    seq: json["seq"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "workflowId": workflowId,
    "workflow_title": workflowTitle,
    "seq": seq,
    "status": status,
  };
}
