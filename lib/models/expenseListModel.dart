class ExpenseListModel {
  bool? status;
  String? message;
  Data? data;

  ExpenseListModel({this.status, this.message, this.data});

  ExpenseListModel.fromJson(Map<String, dynamic> json) {
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
  String? totalExpense;
  List<Expense>? expense;

  Data({this.totalExpense, this.expense});

  Data.fromJson(Map<String, dynamic> json) {
    totalExpense = json['totalExpense'];
    if (json['expense'] != null) {
      expense = <Expense>[];
      json['expense'].forEach((v) {
        expense!.add(new Expense.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalExpense'] = this.totalExpense;
    if (this.expense != null) {
      data['expense'] = this.expense!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expense {
  int? id;
  String? expenseHead;
  String? expenseTypeId;
  String? expenseImage;
  String? date;
  int? day;
  int? month;
  int? year;
  String? remarks;
  String? amount;
  String? fromAccount;
  String? fromAccountId;
  String? toAccountId;

  Expense(
      {this.id,
        this.expenseHead,
        this.expenseTypeId,
        this.expenseImage,
        this.date,
        this.day,
        this.month,
        this.year,
        this.remarks,
        this.amount,
        this.fromAccount,
        this.fromAccountId,
        this.toAccountId});

  Expense.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    expenseHead = json['expenseHead'];
    expenseTypeId = json['expenseTypeId'];
    expenseImage = json['ExpenseImage'];
    date = json['date'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    remarks = json['Remarks'];
    amount = json['Amount'];
    fromAccount = json['fromAccount'];
    fromAccountId = json['fromAccountId'];
    toAccountId = json['toAccountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['expenseHead'] = this.expenseHead;
    data['expenseTypeId'] = this.expenseTypeId;
    data['ExpenseImage'] = this.expenseImage;
    data['date'] = this.date;
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['Remarks'] = this.remarks;
    data['Amount'] = this.amount;
    data['fromAccount'] = this.fromAccount;
    data['fromAccountId'] = this.fromAccountId;
    data['toAccountId'] = this.toAccountId;
    return data;
  }
}