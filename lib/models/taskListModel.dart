class ListTaskModel {
  bool? status;
  String? message;
  List<Data>? data;

  ListTaskModel({this.status, this.message, this.data});

  ListTaskModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? sNo;
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
  String? description;
  String? status;
  String? completedSubTask;

  Data(
      {this.sNo,
        this.title,
        this.taskId,
        this.project,
        this.projectId,
        this.dateTime,
        this.assignUserId,
        this.assignedTo,
        this.assignedstaffImage,
        this.assignedBy,
        this.assignedByImage,
        this.description,
        this.status,
        this.completedSubTask});

  Data.fromJson(Map<String, dynamic> json) {
    sNo = json['SNo'];
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
    description = json['description'];
    status = json['status'];
    completedSubTask = json['completedSubTask'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SNo'] = this.sNo;
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
    data['description'] = this.description;
    data['status'] = this.status;
    data['completedSubTask'] = this.completedSubTask;
    return data;
  }
}