class PendingExpenseModel {
  bool? status;
  String? message;
  Data? data;

  PendingExpenseModel({this.status, this.message, this.data});

  PendingExpenseModel.fromJson(Map<String, dynamic> json) {
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
  List<Expenses>? expenses;

  Data({this.totalAmount, this.expenses});

  Data.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    if (json['Expenses'] != null) {
      expenses = <Expenses>[];
      json['Expenses'].forEach((v) {
        expenses!.add(new Expenses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    if (this.expenses != null) {
      data['Expenses'] = this.expenses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expenses {
  int? sNo;
  String? accountId;
  String? person;
  int? amount;

  Expenses({this.sNo, this.accountId, this.person, this.amount});

  Expenses.fromJson(Map<String, dynamic> json) {
    sNo = json['SNo'];
    accountId = json['accountId'];
    person = json['person'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SNo'] = this.sNo;
    data['accountId'] = this.accountId;
    data['person'] = this.person;
    data['amount'] = this.amount;
    return data;
  }
}