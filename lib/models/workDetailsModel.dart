class WorkDetailsModel {
  bool? status;
  String? message;
  Data? data;

  WorkDetailsModel({this.status, this.message, this.data});

  WorkDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? staffName;
  String? staffImage;
  String? projectId;
  String? clientName;
  String? projectName;
  String? activity;
  List<String>? discriptions;
  String? estimatedTime;
  String? completedTime;
  String? completedDate;
  String? statusName;
  List<SubModules>? subModules;

  Data(
      {this.staffName,
        this.staffImage,
        this.projectId,
        this.clientName,
        this.projectName,
        this.activity,
        this.discriptions,
        this.estimatedTime,
        this.completedTime,
        this.completedDate,
        this.statusName,
        this.subModules});

  Data.fromJson(Map<String, dynamic> json) {
    staffName = json['staffName'];
    staffImage = json['staffImage'];
    projectId = json['projectId'];
    clientName = json['clientName'];
    projectName = json['projectName'];
    activity = json['activity'];
    discriptions = json['discriptions'].cast<String>();
    estimatedTime = json['estimatedTime'];
    completedTime = json['completedTime'];
    completedDate = json['completedDate'];
    statusName = json['statusName'];
    if (json['subModules'] != null) {
      subModules = <SubModules>[];
      json['subModules'].forEach((v) {
        subModules!.add(new SubModules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staffName'] = this.staffName;
    data['staffImage'] = this.staffImage;
    data['projectId'] = this.projectId;
    data['clientName'] = this.clientName;
    data['projectName'] = this.projectName;
    data['activity'] = this.activity;
    data['discriptions'] = this.discriptions;
    data['estimatedTime'] = this.estimatedTime;
    data['completedTime'] = this.completedTime;
    data['completedDate'] = this.completedDate;
    data['statusName'] = this.statusName;
    if (this.subModules != null) {
      data['subModules'] = this.subModules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubModules {
  String? subModuleId;
  String? subModuleName;
  String? createdDate;
  String? estimatedTime;
  String? completedTime;
  String? remarks;
  String? statusName;

  SubModules(
      {this.subModuleId,
        this.subModuleName,
        this.createdDate,
        this.estimatedTime,
        this.completedTime,
        this.remarks,
        this.statusName});

  SubModules.fromJson(Map<String, dynamic> json) {
    subModuleId = json['subModuleId'];
    subModuleName = json['subModuleName'];
    createdDate = json['createdDate'];
    estimatedTime = json['estimatedTime'];
    completedTime = json['completedTime'];
    remarks = json['remarks'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subModuleId'] = this.subModuleId;
    data['subModuleName'] = this.subModuleName;
    data['createdDate'] = this.createdDate;
    data['estimatedTime'] = this.estimatedTime;
    data['completedTime'] = this.completedTime;
    data['remarks'] = this.remarks;
    data['statusName'] = this.statusName;
    return data;
  }
}