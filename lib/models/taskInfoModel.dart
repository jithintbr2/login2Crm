class TaskInfoModel {
  bool? status;
  String? message;
  Data? data;

  TaskInfoModel({this.status, this.message, this.data});

  TaskInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? loginUserId;
  List<StaffList>? staffList;
  List<Status>? status;

  Data({this.loginUserId, this.staffList, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    loginUserId = json['loginUserId'];
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
    data['loginUserId'] = this.loginUserId;
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
  String? userId;
  String? staffName;

  StaffList({this.userId, this.staffName});

  StaffList.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    staffName = json['staff_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['staff_name'] = this.staffName;
    return data;
  }
}

class Status {
  String? status;
  int? count;

  Status({this.status, this.count});

  Status.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['count'] = this.count;
    return data;
  }
}