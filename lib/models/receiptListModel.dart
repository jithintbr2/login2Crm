class ReceiptListModel {
  bool? status;
  String? message;
  Data? data;

  ReceiptListModel({this.status, this.message, this.data});

  ReceiptListModel.fromJson(Map<String, dynamic> json) {
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
  String? totalAmount;
  List<Receipt>? receipt;

  Data({this.totalAmount, this.receipt});

  Data.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    if (json['receipt'] != null) {
      receipt = <Receipt>[];
      json['receipt'].forEach((v) {
        receipt!.add(new Receipt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    if (this.receipt != null) {
      data['receipt'] = this.receipt!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Receipt {
  int? receiptId;
  String? receiptNo;
  String? invoiceNo;
  String? client;
  String? dateOfReceipt;
  String? paidAmount;
  String? collectedBy;
  String? createdBy;

  Receipt(
      {this.receiptId,
      this.receiptNo,
      this.invoiceNo,
      this.client,
      this.dateOfReceipt,
      this.paidAmount,
      this.collectedBy,
      this.createdBy});

  Receipt.fromJson(Map<String, dynamic> json) {
    receiptId = json['receiptId'];
    receiptNo = json['receiptNo'];
    invoiceNo = json['invoiceNo'];
    client = json['client'];
    dateOfReceipt = json['dateOfReceipt'];
    paidAmount = json['paidAmount'];
    collectedBy = json['collectedBy'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiptId'] = this.receiptId;
    data['receiptNo'] = this.receiptNo;
    data['invoiceNo'] = this.invoiceNo;
    data['client'] = this.client;
    data['dateOfReceipt'] = this.dateOfReceipt;
    data['paidAmount'] = this.paidAmount;
    data['collectedBy'] = this.collectedBy;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
