class ReceiptDetailsModel {
  bool? status;
  String? message;
  Data? data;

  ReceiptDetailsModel({this.status, this.message, this.data});

  ReceiptDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? clientName;
  String? clientAddress;
  String? receiptNo;
  String? invoiceNo;
  String? receiptDate;
  List<Projects>? projects;
  int? totalAmount;
  String? amountInWords;

  Data(
      {this.clientName,
        this.clientAddress,
        this.receiptNo,
        this.invoiceNo,
        this.receiptDate,
        this.projects,
        this.totalAmount,
        this.amountInWords});

  Data.fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'];
    clientAddress = json['clientAddress'];
    receiptNo = json['receiptNo'];
    invoiceNo = json['invoiceNo'];
    receiptDate = json['receiptDate'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
    amountInWords = json['AmountInWords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientName'] = this.clientName;
    data['clientAddress'] = this.clientAddress;
    data['receiptNo'] = this.receiptNo;
    data['invoiceNo'] = this.invoiceNo;
    data['receiptDate'] = this.receiptDate;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = this.totalAmount;
    data['AmountInWords'] = this.amountInWords;
    return data;
  }
}

class Projects {
  int? sNo;
  String? projectName;
  String? remark;
  String? amount;

  Projects({this.sNo, this.projectName, this.remark, this.amount});

  Projects.fromJson(Map<String, dynamic> json) {
    sNo = json['SNo'];
    projectName = json['projectName'];
    remark = json['remark'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SNo'] = this.sNo;
    data['projectName'] = this.projectName;
    data['remark'] = this.remark;
    data['amount'] = this.amount;
    return data;
  }
}