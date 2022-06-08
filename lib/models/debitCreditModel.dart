class DebitCreditModel {
  bool? status;
  String? message;
  Data? data;

  DebitCreditModel({this.status, this.message, this.data});

  DebitCreditModel.fromJson(Map<String, dynamic> json) {
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
  int? totalDebit;
  int? totalCredit;
  int? totalBalance;
  String? balance;
  List<DebitCredit>? debitCredit;

  Data(
      {this.totalDebit,
        this.totalCredit,
        this.totalBalance,
        this.balance,
        this.debitCredit});

  Data.fromJson(Map<String, dynamic> json) {
    totalDebit = json['total_debit'];
    totalCredit = json['total_credit'];
    totalBalance = json['total_balance'];
    balance = json['balance'];
    if (json['debit_credit'] != null) {
      debitCredit = <DebitCredit>[];
      json['debit_credit'].forEach((v) {
        debitCredit!.add(new DebitCredit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_debit'] = this.totalDebit;
    data['total_credit'] = this.totalCredit;
    data['total_balance'] = this.totalBalance;
    data['balance'] = this.balance;
    if (this.debitCredit != null) {
      data['debit_credit'] = this.debitCredit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DebitCredit {
  int? slNo;
  String? date;
  String? person;
  String? debitAmount;
  String? creditAmount;
  String? createdBy;
  String? remark;

  DebitCredit(
      {this.slNo,
        this.date,
        this.person,
        this.debitAmount,
        this.creditAmount,
        this.createdBy,
        this.remark});

  DebitCredit.fromJson(Map<String, dynamic> json) {
    slNo = json['slNo'];
    date = json['date'];
    person = json['person'];
    debitAmount = json['debitAmount'];
    creditAmount = json['creditAmount'];
    createdBy = json['created_by'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slNo'] = this.slNo;
    data['date'] = this.date;
    data['person'] = this.person;
    data['debitAmount'] = this.debitAmount;
    data['creditAmount'] = this.creditAmount;
    data['created_by'] = this.createdBy;
    data['remark'] = this.remark;
    return data;
  }
}