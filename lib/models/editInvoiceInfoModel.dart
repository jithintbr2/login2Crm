class EditInvoiceInfoModel {
  bool? status;
  String? message;
  Data? data;

  EditInvoiceInfoModel({this.status, this.message, this.data});

  EditInvoiceInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? invoiceNo;
  String? clientId;
  String? remark;
  String? clientName;
  String? inviceDate;
  List<Projects>? projects;
  String? totalAmount;

  Data(
      {this.invoiceNo,
        this.clientId,
        this.remark,
        this.clientName,
        this.inviceDate,
        this.projects,
        this.totalAmount});

  Data.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoiceNo'];
    clientId = json['clientId'];
    remark = json['remark'];
    clientName = json['clientName'];
    inviceDate = json['invice_date'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceNo'] = this.invoiceNo;
    data['clientId'] = this.clientId;
    data['remark'] = this.remark;
    data['clientName'] = this.clientName;
    data['invice_date'] = this.inviceDate;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class Projects {
  String? projectId;
  String? projectName;
  String? amount;

  Projects({this.projectId, this.projectName, this.amount});

  Projects.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['projectName'] = this.projectName;
    data['amount'] = this.amount;
    return data;
  }
}