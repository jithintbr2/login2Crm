class ProjectListModel {
  bool? status;
  String? message;
  Data? data;

  ProjectListModel({this.status, this.message, this.data});

  ProjectListModel.fromJson(Map<String, dynamic> json) {
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
  List<ProjectList>? projectList;

  Data({this.projectList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['projectList'] != null) {
      projectList = <ProjectList>[];
      json['projectList'].forEach((v) {
        projectList!.add(new ProjectList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projectList != null) {
      data['projectList'] = this.projectList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectList {
  int? projectId;
  String? projectName;
  String? clientName;
  String? statusName;
  String? projectTypeIcon;
  String? createdDate;
  String? createdBy;
  int? balanceDue;
  String? taskCount;
  String? documentCount;
  List<Staffs>? staffs;

  ProjectList(
      {this.projectId,
        this.projectName,
        this.clientName,
        this.statusName,
        this.projectTypeIcon,
        this.createdDate,
        this.createdBy,
        this.balanceDue,
        this.taskCount,
        this.documentCount,
        this.staffs});

  ProjectList.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
    clientName = json['clientName'];
    statusName = json['statusName'];
    projectTypeIcon = json['projectTypeIcon'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    balanceDue = json['balanceDue'];
    taskCount = json['taskCount'];
    documentCount = json['documentCount'];
    if (json['staffs'] != null) {
      staffs = <Staffs>[];
      json['staffs'].forEach((v) {
        staffs!.add(new Staffs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['projectName'] = this.projectName;
    data['clientName'] = this.clientName;
    data['statusName'] = this.statusName;
    data['projectTypeIcon'] = this.projectTypeIcon;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['balanceDue'] = this.balanceDue;
    data['taskCount'] = this.taskCount;
    data['documentCount'] = this.documentCount;
    if (this.staffs != null) {
      data['staffs'] = this.staffs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Staffs {
  String? userId;
  String? staffName;
  String? image;

  Staffs({this.userId, this.staffName, this.image});

  Staffs.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    staffName = json['staffName'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['staffName'] = this.staffName;
    data['Image'] = this.image;
    return data;
  }
}