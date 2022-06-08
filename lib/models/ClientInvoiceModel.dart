class ClientInvoiceModel {
  bool? status;
  String? message;
  Data? data;

  ClientInvoiceModel({this.status, this.message, this.data});

  ClientInvoiceModel.fromJson(Map<String, dynamic> json) {
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
  int? totalAmount;
  List<InvoiceList>? invoiceList;

  Data({this.clientName, this.totalAmount, this.invoiceList});

  Data.fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'];
    totalAmount = json['totalAmount'];
    if (json['invoiceList'] != null) {
      invoiceList = <InvoiceList>[];
      json['invoiceList'].forEach((v) {
        invoiceList!.add(new InvoiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientName'] = this.clientName;
    data['totalAmount'] = this.totalAmount;
    if (this.invoiceList != null) {
      data['invoiceList'] = this.invoiceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceList {
  String? invoiceId;
  String? invoiceNo;
  String? invoiceDate;
  String? invoiceAmount;

  InvoiceList(
      {this.invoiceId, this.invoiceNo, this.invoiceDate, this.invoiceAmount});

  InvoiceList.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoiceId'];
    invoiceNo = json['invoiceNo'];
    invoiceDate = json['invoiceDate'];
    invoiceAmount = json['invoiceAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceId'] = this.invoiceId;
    data['invoiceNo'] = this.invoiceNo;
    data['invoiceDate'] = this.invoiceDate;
    data['invoiceAmount'] = this.invoiceAmount;
    return data;
  }
}