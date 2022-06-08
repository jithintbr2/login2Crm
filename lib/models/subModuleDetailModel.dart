class SubModuleDetailsModel {
  bool? status;
  String? message;
  Data? data;

  SubModuleDetailsModel({this.status, this.message, this.data});

  SubModuleDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? projectId;
  String? clientName;
  String? projectName;
  String? activity;
  String? subTask;
  List<String>? descriptions;
  String? estimatedTime;
  String? completedTime;
  String? statusName;
  List<SubModuleDetails>? subModuleDetails;

  Data(
      {this.projectId,
        this.clientName,
        this.projectName,
        this.activity,
        this.subTask,
        this.descriptions,
        this.estimatedTime,
        this.completedTime,
        this.statusName,
        this.subModuleDetails});

  Data.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    clientName = json['clientName'];
    projectName = json['projectName'];
    activity = json['activity'];
    subTask = json['subTask'];
    descriptions = json['descriptions'].cast<String>();
    estimatedTime = json['estimatedTime'];
    completedTime = json['completedTime'];
    statusName = json['statusName'];
    if (json['subModule_details'] != null) {
      subModuleDetails = <SubModuleDetails>[];
      json['subModule_details'].forEach((v) {
        subModuleDetails!.add(new SubModuleDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['clientName'] = this.clientName;
    data['projectName'] = this.projectName;
    data['activity'] = this.activity;
    data['subTask'] = this.subTask;
    data['descriptions'] = this.descriptions;
    data['estimatedTime'] = this.estimatedTime;
    data['completedTime'] = this.completedTime;
    data['statusName'] = this.statusName;
    if (this.subModuleDetails != null) {
      data['subModule_details'] =
          this.subModuleDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubModuleDetails {
  String? date;
  String? fromTime;
  String? toTime;
  String? completedTime;
  String? remarks;
  String? status;

  SubModuleDetails(
      {this.date,
        this.fromTime,
        this.toTime,
        this.completedTime,
        this.remarks,
        this.status});

  SubModuleDetails.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    completedTime = json['completedTime'];
    remarks = json['remarks'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['fromTime'] = this.fromTime;
    data['toTime'] = this.toTime;
    data['completedTime'] = this.completedTime;
    data['remarks'] = this.remarks;
    data['status'] = this.status;
    return data;
  }
}