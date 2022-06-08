class ClientDetailsModel {
  bool? status;
  String? message;
  Data? data;

  ClientDetailsModel({this.status, this.message, this.data});

  ClientDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? clientId;
  String? clientName;
  String? address1;
  String? address2;
  String? contact1;
  String? contact2;
  String? contactPerson;
  String? designation;
  String? email;
  String? description;
  String? remarks;
  String? clientCategory;
  String? clientType;
  String? gstNo;
  String? careOff;
  bool? isInvoice;
  bool? isReciept;
  String? dueAmount;
  int? projectCount;
  String? createdDate;
  String? createdBy;
  List<Projects>? projects;

  Data(
      {this.clientId,
        this.clientName,
        this.address1,
        this.address2,
        this.contact1,
        this.contact2,
        this.contactPerson,
        this.designation,
        this.email,
        this.description,
        this.remarks,
        this.clientCategory,
        this.clientType,
        this.gstNo,
        this.careOff,
        this.isInvoice,
        this.isReciept,
        this.dueAmount,
        this.projectCount,
        this.createdDate,
        this.createdBy,
        this.projects});

  Data.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    clientName = json['clientName'];
    address1 = json['address1'];
    address2 = json['address2'];
    contact1 = json['contact1'];
    contact2 = json['contact2'];
    contactPerson = json['contact_person'];
    designation = json['designation'];
    email = json['email'];
    description = json['description'];
    remarks = json['remarks'];
    clientCategory = json['client_category'];
    clientType = json['client_type'];
    gstNo = json['gstNo'];
    careOff = json['careOff'];
    isInvoice = json['isInvoice'];
    isReciept = json['isReciept'];
    dueAmount = json['dueAmount'];
    projectCount = json['project_count'];
    createdDate = json['created_date'];
    createdBy = json['createdBy'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['clientName'] = this.clientName;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['contact1'] = this.contact1;
    data['contact2'] = this.contact2;
    data['contact_person'] = this.contactPerson;
    data['designation'] = this.designation;
    data['email'] = this.email;
    data['description'] = this.description;
    data['remarks'] = this.remarks;
    data['client_category'] = this.clientCategory;
    data['client_type'] = this.clientType;
    data['gstNo'] = this.gstNo;
    data['careOff'] = this.careOff;
    data['isInvoice'] = this.isInvoice;
    data['isReciept'] = this.isReciept;
    data['dueAmount'] = this.dueAmount;
    data['project_count'] = this.projectCount;
    data['created_date'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  int? projectId;
  String? projectName;
  String? clientName;
  String? statusName;
  String? projectTypeIcon;
  String? projectType;
  String? createdDate;
  String? createdBy;
  int? balanceDue;
  String? taskCount;
  String? documentCount;
  int? staffCount;
  List<Staffs>? staffs;

  Projects(
      {this.projectId,
        this.projectName,
        this.clientName,
        this.statusName,
        this.projectTypeIcon,
        this.projectType,
        this.createdDate,
        this.createdBy,
        this.balanceDue,
        this.taskCount,
        this.documentCount,
        this.staffCount,
        this.staffs});

  Projects.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
    clientName = json['clientName'];
    statusName = json['statusName'];
    projectTypeIcon = json['projectTypeIcon'];
    projectType = json['project_type'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    balanceDue = json['balanceDue'];
    taskCount = json['taskCount'];
    documentCount = json['documentCount'];
    staffCount = json['staffCount'];
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
    data['project_type'] = this.projectType;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['balanceDue'] = this.balanceDue;
    data['taskCount'] = this.taskCount;
    data['documentCount'] = this.documentCount;
    data['staffCount'] = this.staffCount;
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