class AddMilieStoneInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddMilieStoneInfoModel({this.status, this.message, this.data});

  AddMilieStoneInfoModel.fromJson(Map<String, dynamic> json) {
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
  int? projectId;
  String? projectName;
  String? clientName;
  String? projectTypeId;
  String? projectType;
  String? statusId;
  String? status;
  int? balanceAmount;
  String? createdDate;
  String? createdBy;
  String? typeImage;
  String? taskCount;
  String? documentCount;
  List<MileStones>? mileStones;
  List<Assignments>? assignments;

  Data(
      {this.projectId,
        this.projectName,
        this.clientName,
        this.projectTypeId,
        this.projectType,
        this.statusId,
        this.status,
        this.balanceAmount,
        this.createdDate,
        this.createdBy,
        this.typeImage,
        this.taskCount,
        this.documentCount,
        this.mileStones,
        this.assignments});

  Data.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    projectName = json['project_name'];
    clientName = json['client_name'];
    projectTypeId = json['project_type_id'];
    projectType = json['project_type'];
    statusId = json['status_id'];
    status = json['status'];
    balanceAmount = json['balance_amount'];
    createdDate = json['created_date'];
    createdBy = json['created_by'];
    typeImage = json['type_image'];
    taskCount = json['task_count'];
    documentCount = json['documentCount'];
    if (json['mileStones'] != null) {
      mileStones = <MileStones>[];
      json['mileStones'].forEach((v) {
        mileStones!.add(new MileStones.fromJson(v));
      });
    }
    if (json['assignments'] != null) {
      assignments = <Assignments>[];
      json['assignments'].forEach((v) {
        assignments!.add(new Assignments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    data['client_name'] = this.clientName;
    data['project_type_id'] = this.projectTypeId;
    data['project_type'] = this.projectType;
    data['status_id'] = this.statusId;
    data['status'] = this.status;
    data['balance_amount'] = this.balanceAmount;
    data['created_date'] = this.createdDate;
    data['created_by'] = this.createdBy;
    data['type_image'] = this.typeImage;
    data['task_count'] = this.taskCount;
    data['documentCount'] = this.documentCount;
    if (this.mileStones != null) {
      data['mileStones'] = this.mileStones!.map((v) => v.toJson()).toList();
    }
    if (this.assignments != null) {
      data['assignments'] = this.assignments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MileStones {
  int? sNo;
  int? milestoneId;
  String? milestone;

  MileStones({this.sNo, this.milestoneId, this.milestone});

  MileStones.fromJson(Map<String, dynamic> json) {
    sNo = json['SNo'];
    milestoneId = json['milestoneId'];
    milestone = json['milestone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SNo'] = this.sNo;
    data['milestoneId'] = this.milestoneId;
    data['milestone'] = this.milestone;
    return data;
  }
}

class Assignments {
  int? activityId;
  String? activity;
  String? staffName;
  String? staffUserId;
  String? staffImage;
  String? estimatedTime;
  String? completedTime;
  String? timeVarience;
  String? hourlyExpense;
  String? statusName;

  Assignments(
      {this.activityId,
        this.activity,
        this.staffName,
        this.staffUserId,
        this.staffImage,
        this.estimatedTime,
        this.completedTime,
        this.timeVarience,
        this.hourlyExpense,
        this.statusName});

  Assignments.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    activity = json['activity'];
    staffName = json['staff_name'];
    staffUserId = json['staff_userId'];
    staffImage = json['staff_image'];
    estimatedTime = json['estimated_time'];
    completedTime = json['completed_time'];
    timeVarience = json['time_varience'];
    hourlyExpense = json['hourly_expense'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity_id'] = this.activityId;
    data['activity'] = this.activity;
    data['staff_name'] = this.staffName;
    data['staff_userId'] = this.staffUserId;
    data['staff_image'] = this.staffImage;
    data['estimated_time'] = this.estimatedTime;
    data['completed_time'] = this.completedTime;
    data['time_varience'] = this.timeVarience;
    data['hourly_expense'] = this.hourlyExpense;
    data['status_name'] = this.statusName;
    return data;
  }
}