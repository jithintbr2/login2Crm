class TaskDetailsModel {
  bool? status;
  String? message;
  Data? data;

  TaskDetailsModel({this.status, this.message, this.data});

  TaskDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? title;
  String? taskId;
  String? project;
  String? projectId;
  String? dateTime;
  String? assignUserId;
  String? assignedTo;
  String? assignedstaffImage;
  String? assignedBy;
  String? assignedByImage;
  String? status;
  List<Descriptions>? descriptions;

  Data(
      {this.title,
        this.taskId,
        this.project,
        this.projectId,
        this.dateTime,
        this.assignUserId,
        this.assignedTo,
        this.assignedstaffImage,
        this.assignedBy,
        this.assignedByImage,
        this.status,
        this.descriptions});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    taskId = json['taskId'];
    project = json['project'];
    projectId = json['projectId'];
    dateTime = json['dateTime'];
    assignUserId = json['assignUserId'];
    assignedTo = json['assignedTo'];
    assignedstaffImage = json['assignedstaffImage'];
    assignedBy = json['assignedBy'];
    assignedByImage = json['assignedByImage'];
    status = json['status'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(new Descriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['taskId'] = this.taskId;
    data['project'] = this.project;
    data['projectId'] = this.projectId;
    data['dateTime'] = this.dateTime;
    data['assignUserId'] = this.assignUserId;
    data['assignedTo'] = this.assignedTo;
    data['assignedstaffImage'] = this.assignedstaffImage;
    data['assignedBy'] = this.assignedBy;
    data['assignedByImage'] = this.assignedByImage;
    data['status'] = this.status;
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Descriptions {
  String? descriptions;
  String? discriptionId;
  bool? isCompleted;
  String? completedDate;
  String? status;
  String? remarks;

  Descriptions(
      {this.descriptions,
        this.discriptionId,
        this.isCompleted,
        this.completedDate,
        this.status,
        this.remarks});

  Descriptions.fromJson(Map<String, dynamic> json) {
    descriptions = json['descriptions'];
    discriptionId = json['discriptionId'];
    isCompleted = json['isCompleted'];
    completedDate = json['completedDate'];
    status = json['status'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descriptions'] = this.descriptions;
    data['discriptionId'] = this.discriptionId;
    data['isCompleted'] = this.isCompleted;
    data['completedDate'] = this.completedDate;
    data['status'] = this.status;
    data['remarks'] = this.remarks;
    return data;
  }
}