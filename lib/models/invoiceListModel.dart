class InvoiceListModel {
  bool? status;
  String? message;
  Data? data;

  InvoiceListModel({this.status, this.message, this.data});

  InvoiceListModel.fromJson(Map<String, dynamic> json) {
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
  int? totalAmount;
  int? totalPaid;
  int? totalBalance;
  List<InvoiceList>? invoiceList;

  Data({this.totalAmount, this.totalPaid, this.totalBalance, this.invoiceList});

  Data.fromJson(Map<String, dynamic> json) {
    totalAmount = json['total_amount'];
    totalPaid = json['total_paid'];
    totalBalance = json['total_balance'];
    if (json['invoice_list'] != null) {
      invoiceList = <InvoiceList>[];
      json['invoice_list'].forEach((v) {
        invoiceList!.add(new InvoiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_amount'] = this.totalAmount;
    data['total_paid'] = this.totalPaid;
    data['total_balance'] = this.totalBalance;
    if (this.invoiceList != null) {
      data['invoice_list'] = this.invoiceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceList {
  String? id;
  String? invoiceNo;
  String? client;
  String? invoiceAmount;
  String? amountPaid;
  int? balanceAmount;
  String? date;
  String? createdBy;
  String? status;

  InvoiceList(
      {this.id,
      this.invoiceNo,
      this.client,
      this.invoiceAmount,
      this.amountPaid,
      this.balanceAmount,
      this.date,
      this.createdBy,
      this.status});

  InvoiceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNo = json['invoice_no'];
    client = json['client'];
    invoiceAmount = json['invoice_amount'];
    amountPaid = json['amount_paid'];
    balanceAmount = json['balance_amount'];
    date = json['date'];
    createdBy = json['created_by'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoice_no'] = this.invoiceNo;
    data['client'] = this.client;
    data['invoice_amount'] = this.invoiceAmount;
    data['amount_paid'] = this.amountPaid;
    data['balance_amount'] = this.balanceAmount;
    data['date'] = this.date;
    data['created_by'] = this.createdBy;
    data['status'] = this.status;
    return data;
  }
}
