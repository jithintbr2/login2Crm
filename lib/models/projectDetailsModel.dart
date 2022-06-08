class ProjectDetailsModel {
  bool? status;
  String? message;
  Data? data;

  ProjectDetailsModel({this.status, this.message, this.data});

  ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? clientId;
  String? projectTypeId;
  String? statusId;
  String? email;
  String? gstNo;
  String? createdBy;
  String? projectCost;
  String? amountPaid;
  String? invoiceAmount;
  String? estStart;
  String? estEnd;
  String? remarks;
  String? address1;
  String? address2;
  String? contact1;
  String? contact2;
  String? contactPerson;
  String? designation;
  String? projectType;
  String? status;
  String? typeImage;
  String? createdDate;
  int? balanceAmount;
  String? timeLeft;
  String? taskCount;
  String? documentCount;
  List<Descriptions>? descriptions;
  List<MileStones>? mileStones;
  List<Assignments>? assignments;

  Data(
      {this.projectId,
        this.projectName,
        this.clientName,
        this.clientId,
        this.projectTypeId,
        this.statusId,
        this.email,
        this.gstNo,
        this.createdBy,
        this.projectCost,
        this.amountPaid,
        this.invoiceAmount,
        this.estStart,
        this.estEnd,
        this.remarks,
        this.address1,
        this.address2,
        this.contact1,
        this.contact2,
        this.contactPerson,
        this.designation,
        this.projectType,
        this.status,
        this.typeImage,
        this.createdDate,
        this.balanceAmount,
        this.timeLeft,
        this.taskCount,
        this.documentCount,
        this.descriptions,
        this.mileStones,
        this.assignments});

  Data.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    projectName = json['project_name'];
    clientName = json['client_name'];
    clientId = json['client_id'];
    projectTypeId = json['project_type_id'];
    statusId = json['status_id'];
    email = json['email'];
    gstNo = json['gst_no'];
    createdBy = json['created by'];
    projectCost = json['project_cost'];
    amountPaid = json['amount_paid'];
    invoiceAmount = json['invoice_amount'];
    estStart = json['est_start'];
    estEnd = json['est_end'];
    remarks = json['remarks'];
    address1 = json['address1'];
    address2 = json['address2'];
    contact1 = json['contact1'];
    contact2 = json['contact2'];
    contactPerson = json['contact_person'];
    designation = json['designation'];
    projectType = json['project_type'];
    status = json['status'];
    typeImage = json['type_image'];
    createdDate = json['created_date'];
    balanceAmount = json['balance_amount'];
    timeLeft = json['time_left'];
    taskCount = json['task_count'];
    documentCount = json['documentCount'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(new Descriptions.fromJson(v));
      });
    }
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
    data['client_id'] = this.clientId;
    data['project_type_id'] = this.projectTypeId;
    data['status_id'] = this.statusId;
    data['email'] = this.email;
    data['gst_no'] = this.gstNo;
    data['created by'] = this.createdBy;
    data['project_cost'] = this.projectCost;
    data['amount_paid'] = this.amountPaid;
    data['invoice_amount'] = this.invoiceAmount;
    data['est_start'] = this.estStart;
    data['est_end'] = this.estEnd;
    data['remarks'] = this.remarks;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['contact1'] = this.contact1;
    data['contact2'] = this.contact2;
    data['contact_person'] = this.contactPerson;
    data['designation'] = this.designation;
    data['project_type'] = this.projectType;
    data['status'] = this.status;
    data['type_image'] = this.typeImage;
    data['created_date'] = this.createdDate;
    data['balance_amount'] = this.balanceAmount;
    data['time_left'] = this.timeLeft;
    data['task_count'] = this.taskCount;
    data['documentCount'] = this.documentCount;
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions!.map((v) => v.toJson()).toList();
    }
    if (this.mileStones != null) {
      data['mileStones'] = this.mileStones!.map((v) => v.toJson()).toList();
    }
    if (this.assignments != null) {
      data['assignments'] = this.assignments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Descriptions {
  int? slNo;
  String? descriptionId;
  String? description;

  Descriptions({this.slNo, this.descriptionId, this.description});

  Descriptions.fromJson(Map<String, dynamic> json) {
    slNo = json['slNo'];
    descriptionId = json['descriptionId'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slNo'] = this.slNo;
    data['descriptionId'] = this.descriptionId;
    data['description'] = this.description;
    return data;
  }
}

class MileStones {
  int? sNo;
  String? milestoneId;
  String? milestone;
  bool? isCompleted;
  String? completedBy;
  String? completedDate;
  String? completionRemark;

  MileStones(
      {this.sNo,
        this.milestoneId,
        this.milestone,
        this.isCompleted,
        this.completedBy,
        this.completedDate,
        this.completionRemark});

  MileStones.fromJson(Map<String, dynamic> json) {
    sNo = json['SNo'];
    milestoneId = json['milestoneId'];
    milestone = json['milestone'];
    isCompleted = json['isCompleted'];
    completedBy = json['completedBy'];
    completedDate = json['completedDate'];
    completionRemark = json['completionRemark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SNo'] = this.sNo;
    data['milestoneId'] = this.milestoneId;
    data['milestone'] = this.milestone;
    data['isCompleted'] = this.isCompleted;
    data['completedBy'] = this.completedBy;
    data['completedDate'] = this.completedDate;
    data['completionRemark'] = this.completionRemark;
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