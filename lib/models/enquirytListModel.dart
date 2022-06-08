class EnquirytListModel {
  bool? status;
  String? message;
  List<Data>? data;

  EnquirytListModel({this.status, this.message, this.data});

  EnquirytListModel.fromJson(Map<String, dynamic> json) {
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
  int? enquiryId;
  String? clientName;
  String? projectName;
  String? projectType;
  String? projectTypeId;
  String? cost;
  String? contactPerson;
  String? designation;
  String? contactNo;
  String? remarks;
  String? statusId;
  String? status;
  String? typeImage;
  String? createdDate;
  String? createdBy;

  Data(
      {this.enquiryId,
        this.clientName,
        this.projectName,
        this.projectType,
        this.projectTypeId,
        this.cost,
        this.contactPerson,
        this.designation,
        this.contactNo,
        this.remarks,
        this.statusId,
        this.status,
        this.typeImage,
        this.createdDate,
        this.createdBy});

  Data.fromJson(Map<String, dynamic> json) {
    enquiryId = json['enquiryId'];
    clientName = json['clientName'];
    projectName = json['projectName'];
    projectType = json['projectType'];
    projectTypeId = json['projectTypeId'];
    cost = json['cost'];
    contactPerson = json['contactPerson'];
    designation = json['designation'];
    contactNo = json['contactNo'];
    remarks = json['remarks'];
    statusId = json['statusId'];
    status = json['status'];
    typeImage = json['typeImage'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enquiryId'] = this.enquiryId;
    data['clientName'] = this.clientName;
    data['projectName'] = this.projectName;
    data['projectType'] = this.projectType;
    data['projectTypeId'] = this.projectTypeId;
    data['cost'] = this.cost;
    data['contactPerson'] = this.contactPerson;
    data['designation'] = this.designation;
    data['contactNo'] = this.contactNo;
    data['remarks'] = this.remarks;
    data['statusId'] = this.statusId;
    data['status'] = this.status;
    data['typeImage'] = this.typeImage;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    return data;
  }
}