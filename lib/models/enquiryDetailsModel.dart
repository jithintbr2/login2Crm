class EnquiryDetailsModel {
  bool? status;
  String? message;
  Data? data;

  EnquiryDetailsModel({this.status, this.message, this.data});

  EnquiryDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? companyName;
  String? contactNumber;
  String? enquiryId;
  String? contactPerson;
  String? designation;
  String? projectType;
  String? projectTypeImage;
  String? projectTypeId;
  String? cost;
  String? remarks;
  String? statusId;
  String? status;
  String? createdBy;
  String? createdDate;
  String? projectName;
  List<FollowUps>? followUps;

  Data(
      {this.companyName,
        this.contactNumber,
        this.enquiryId,
        this.contactPerson,
        this.designation,
        this.projectType,
        this.projectTypeImage,
        this.projectTypeId,
        this.cost,
        this.remarks,
        this.statusId,
        this.status,
        this.createdBy,
        this.createdDate,
        this.projectName,
        this.followUps});

  Data.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    contactNumber = json['contactNumber'];
    enquiryId = json['enquiryId'];
    contactPerson = json['contactPerson'];
    designation = json['designation'];
    projectType = json['projectType'];
    projectTypeImage = json['projectTypeImage'];
    projectTypeId = json['projectTypeId'];
    cost = json['cost'];
    remarks = json['remarks'];
    statusId = json['statusId'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    projectName = json['projectName'];
    if (json['followUps'] != null) {
      followUps = <FollowUps>[];
      json['followUps'].forEach((v) {
        followUps!.add(new FollowUps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyName'] = this.companyName;
    data['contactNumber'] = this.contactNumber;
    data['enquiryId'] = this.enquiryId;
    data['contactPerson'] = this.contactPerson;
    data['designation'] = this.designation;
    data['projectType'] = this.projectType;
    data['projectTypeImage'] = this.projectTypeImage;
    data['projectTypeId'] = this.projectTypeId;
    data['cost'] = this.cost;
    data['remarks'] = this.remarks;
    data['statusId'] = this.statusId;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['projectName'] = this.projectName;
    if (this.followUps != null) {
      data['followUps'] = this.followUps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FollowUps {
  String? followUpId;
  String? followUpDate;
  String? followUpDateDay;
  String? followUpDateMonth;
  String? followUpDateYear;
  String? followUpTime;
  String? nextDate;
  String? nextfollowDay;
  String? nextfollowMonth;
  String? nextfollowYear;
  String? followUpRemarks;
  String? isCompleted;
  String? status;
  String? createdBy;
  String? statusId;
  String? userImage;

  FollowUps(
      {this.followUpId,
        this.followUpDate,
        this.followUpDateDay,
        this.followUpDateMonth,
        this.followUpDateYear,
        this.followUpTime,
        this.nextDate,
        this.nextfollowDay,
        this.nextfollowMonth,
        this.nextfollowYear,
        this.followUpRemarks,
        this.isCompleted,
        this.status,
        this.createdBy,
        this.statusId,
        this.userImage});

  FollowUps.fromJson(Map<String, dynamic> json) {
    followUpId = json['followUpId'];
    followUpDate = json['followUpDate'];
    followUpDateDay = json['followUpDateDay'];
    followUpDateMonth = json['followUpDateMonth'];
    followUpDateYear = json['followUpDateYear'];
    followUpTime = json['followUpTime'];
    nextDate = json['nextDate'];
    nextfollowDay = json['nextfollowDay'];
    nextfollowMonth = json['nextfollowMonth'];
    nextfollowYear = json['nextfollowYear'];
    followUpRemarks = json['followUpRemarks'];
    isCompleted = json['isCompleted'];
    status = json['status'];
    createdBy = json['createdBy'];
    statusId = json['statusId'];
    userImage = json['UserImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followUpId'] = this.followUpId;
    data['followUpDate'] = this.followUpDate;
    data['followUpDateDay'] = this.followUpDateDay;
    data['followUpDateMonth'] = this.followUpDateMonth;
    data['followUpDateYear'] = this.followUpDateYear;
    data['followUpTime'] = this.followUpTime;
    data['nextDate'] = this.nextDate;
    data['nextfollowDay'] = this.nextfollowDay;
    data['nextfollowMonth'] = this.nextfollowMonth;
    data['nextfollowYear'] = this.nextfollowYear;
    data['followUpRemarks'] = this.followUpRemarks;
    data['isCompleted'] = this.isCompleted;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['statusId'] = this.statusId;
    data['UserImage'] = this.userImage;
    return data;
  }
}