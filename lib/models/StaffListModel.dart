class StaffListModel {
  bool? status;
  String? message;
  List<Data>? data;

  StaffListModel({this.status, this.message, this.data});

  StaffListModel.fromJson(Map<String, dynamic> json) {
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
  int? staffId;
  int? userId;
  String? staffName;
  String? staffDesignationId;
  String? phoneNo;
  String? proPic;
  String? staffDesignation;
  int? completedProjects;
  int? pendingProjects;
  int? newProjects;

  Data(
      {this.staffId,
      this.userId,
      this.staffName,
      this.staffDesignationId,
      this.phoneNo,
      this.proPic,
      this.staffDesignation,
      this.completedProjects,
      this.pendingProjects,
      this.newProjects});

  Data.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];
    userId = json['user_id'];
    staffName = json['staff_name'];
    staffDesignationId = json['staff_designation_id'];
    phoneNo = json['phone_no'];
    proPic = json['pro_pic'];
    staffDesignation = json['staff_designation'];
    completedProjects = json['completed_projects'];
    pendingProjects = json['pending_projects'];
    newProjects = json['new_projects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staff_id'] = this.staffId;
    data['user_id'] = this.userId;
    data['staff_name'] = this.staffName;
    data['staff_designation_id'] = this.staffDesignationId;
    data['phone_no'] = this.phoneNo;
    data['pro_pic'] = this.proPic;
    data['staff_designation'] = this.staffDesignation;
    data['completed_projects'] = this.completedProjects;
    data['pending_projects'] = this.pendingProjects;
    data['new_projects'] = this.newProjects;
    return data;
  }
}
