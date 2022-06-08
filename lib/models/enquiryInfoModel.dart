class EnquiryInfoModel {
  bool? status;
  String? message;
  Data? data;

  EnquiryInfoModel({this.status, this.message, this.data});

  EnquiryInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<StaffList>? staffList;
  List<Status>? status;

  Data({this.staffList, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['staffList'] != null) {
      staffList = <StaffList>[];
      json['staffList'].forEach((v) {
        staffList!.add(new StaffList.fromJson(v));
      });
    }
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.staffList != null) {
      data['staffList'] = this.staffList!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StaffList {
  String? createdBy;
  String? username;

  StaffList({this.createdBy, this.username});

  StaffList.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['username'] = this.username;
    return data;
  }
}

class Status {
  String? status;
  String? statusId;
  int? count;

  Status({this.status, this.statusId, this.count});

  Status.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusId = json['statusId'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusId'] = this.statusId;
    data['count'] = this.count;
    return data;
  }
}