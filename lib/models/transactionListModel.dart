class TransactionListModel {
  bool? status;
  String? message;
  Data? data;

  TransactionListModel({this.status, this.message, this.data});

  TransactionListModel.fromJson(Map<String, dynamic> json) {
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
  List<Transactions>? transactions;

  Data({this.totalAmount, this.transactions});

  Data.fromJson(Map<String, dynamic> json) {
    totalAmount = json['total_amount'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_amount'] = this.totalAmount;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  int? transactionId;
  String? fromAccluntId;
  String? fromPerson;
  String? toAccountId;
  String? toPerson;
  String? date;
  String? day;
  String? month;
  String? year;
  String? remark;
  String? amount;
  String? createdBy;
  String? createdDate;
  String? toStaffImage;

  Transactions(
      {this.transactionId,
        this.fromAccluntId,
        this.fromPerson,
        this.toAccountId,
        this.toPerson,
        this.date,
        this.day,
        this.month,
        this.year,
        this.remark,
        this.amount,
        this.createdBy,
        this.createdDate,
        this.toStaffImage});

  Transactions.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    fromAccluntId = json['fromAccluntId'];
    fromPerson = json['fromPerson'];
    toAccountId = json['toAccountId'];
    toPerson = json['toPerson'];
    date = json['date'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    remark = json['remark'];
    amount = json['amount'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    toStaffImage = json['toStaffImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['fromAccluntId'] = this.fromAccluntId;
    data['fromPerson'] = this.fromPerson;
    data['toAccountId'] = this.toAccountId;
    data['toPerson'] = this.toPerson;
    data['date'] = this.date;
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['remark'] = this.remark;
    data['amount'] = this.amount;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['toStaffImage'] = this.toStaffImage;
    return data;
  }
}