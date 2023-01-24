// To parse this JSON data, do
//
//     final workflowModalClass = workflowModalClassFromJson(jsonString);

import 'dart:convert';

WorkflowModalClass workflowModalClassFromJson(String str) => WorkflowModalClass.fromJson(json.decode(str));

String workflowModalClassToJson(WorkflowModalClass data) => json.encode(data.toJson());

class WorkflowModalClass {
  WorkflowModalClass({
    this.status,
    this.workflow,
  });

  bool? status;
  List<Workflow>? workflow;

  factory WorkflowModalClass.fromJson(Map<String, dynamic> json) => WorkflowModalClass(
    status: json["status"],
    workflow: List<Workflow>.from(json["workflow"].map((x) => Workflow.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "workflow": List<dynamic>.from(workflow!.map((x) => x.toJson())),
  };
}

class Workflow {
  Workflow({
    this.id,
    this.workflowTitle,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? workflowTitle;
  String? createdAt;
  String? updatedAt;

  factory Workflow.fromJson(Map<String, dynamic> json) => Workflow(
    id: json["id"],
    workflowTitle: json["workflow_title"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "workflow_title": workflowTitle,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
