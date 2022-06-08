class EditTaskInfoModel {
  bool? status;
  String? message;
  Data? data;

  EditTaskInfoModel({this.status, this.message, this.data});

  EditTaskInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? phoneNo;
  String? staffId;
  bool? isProject;
  String? ptojectId;
  String? date;
  String? dateDay;
  String? dateMonth;
  String? dateYear;
  String? lastDate;
  String? lastDateDay;
  String? lastDateMonth;
  String? lastDateYear;
  List<Description>? description;
  List<ProjectList>? projectList;
  List<StaffList>? staffList;

  Data(
      {this.title,
        this.phoneNo,
        this.staffId,
        this.isProject,
        this.ptojectId,
        this.date,
        this.dateDay,
        this.dateMonth,
        this.dateYear,
        this.lastDate,
        this.lastDateDay,
        this.lastDateMonth,
        this.lastDateYear,
        this.description,
        this.projectList,
        this.staffList});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    phoneNo = json['phoneNo'];
    staffId = json['staffId'];
    isProject = json['isProject'];
    ptojectId = json['ptojectId'];
    date = json['date'];
    dateDay = json['dateDay'];
    dateMonth = json['dateMonth'];
    dateYear = json['dateYear'];
    lastDate = json['lastDate'];
    lastDateDay = json['lastDateDay'];
    lastDateMonth = json['lastDateMonth'];
    lastDateYear = json['lastDateYear'];
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(new Description.fromJson(v));
      });
    }
    if (json['projectList'] != null) {
      projectList = <ProjectList>[];
      json['projectList'].forEach((v) {
        projectList!.add(new ProjectList.fromJson(v));
      });
    }
    if (json['staffList'] != null) {
      staffList = <StaffList>[];
      json['staffList'].forEach((v) {
        staffList!.add(new StaffList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['phoneNo'] = this.phoneNo;
    data['staffId'] = this.staffId;
    data['isProject'] = this.isProject;
    data['ptojectId'] = this.ptojectId;
    data['date'] = this.date;
    data['dateDay'] = this.dateDay;
    data['dateMonth'] = this.dateMonth;
    data['dateYear'] = this.dateYear;
    data['lastDate'] = this.lastDate;
    data['lastDateDay'] = this.lastDateDay;
    data['lastDateMonth'] = this.lastDateMonth;
    data['lastDateYear'] = this.lastDateYear;
    if (this.description != null) {
      data['description'] = this.description!.map((v) => v.toJson()).toList();
    }
    if (this.projectList != null) {
      data['projectList'] = this.projectList!.map((v) => v.toJson()).toList();
    }
    if (this.staffList != null) {
      data['staffList'] = this.staffList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Description {
  String? id;
  String? taskId;
  String? descriptions;
  String? date;
  String? isCompleted;
  String? completedBy;
  String? completedDate;
  String? remarks;
  int? slNo;

  Description(
      {this.id,
        this.taskId,
        this.descriptions,
        this.date,
        this.isCompleted,
        this.completedBy,
        this.completedDate,
        this.remarks,
        this.slNo});

  Description.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    descriptions = json['descriptions'];
    date = json['date'];
    isCompleted = json['is_completed'];
    completedBy = json['completed_by'];
    completedDate = json['completed_date'];
    remarks = json['remarks'];
    slNo = json['slNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_id'] = this.taskId;
    data['descriptions'] = this.descriptions;
    data['date'] = this.date;
    data['is_completed'] = this.isCompleted;
    data['completed_by'] = this.completedBy;
    data['completed_date'] = this.completedDate;
    data['remarks'] = this.remarks;
    data['slNo'] = this.slNo;
    return data;
  }
}

class ProjectList {
  String? id;
  String? projectName;

  ProjectList({this.id, this.projectName});

  ProjectList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['projectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['projectName'] = this.projectName;
    return data;
  }
}

class StaffList {
  int? slNo;
  String? userId;
  String? staffName;

  StaffList({this.slNo, this.userId, this.staffName});

  StaffList.fromJson(Map<String, dynamic> json) {
    slNo = json['slNo'];
    userId = json['userId'];
    staffName = json['staffName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slNo'] = this.slNo;
    data['userId'] = this.userId;
    data['staffName'] = this.staffName;
    return data;
  }
}