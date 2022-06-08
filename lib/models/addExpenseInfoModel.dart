class AddExpenseInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddExpenseInfoModel({this.status, this.message, this.data});

  AddExpenseInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? myAccountId;
  List<FromAccount>? fromAccount;
  List<ToAccount>? toAccount;
  List<ExpenseType>? expenseType;

  Data({this.myAccountId, this.fromAccount, this.toAccount, this.expenseType});

  Data.fromJson(Map<String, dynamic> json) {
    myAccountId = json['my_account_id'];
    if (json['from_account'] != null) {
      fromAccount = <FromAccount>[];
      json['from_account'].forEach((v) {
        fromAccount!.add(new FromAccount.fromJson(v));
      });
    }
    if (json['to_account'] != null) {
      toAccount = <ToAccount>[];
      json['to_account'].forEach((v) {
        toAccount!.add(new ToAccount.fromJson(v));
      });
    }
    if (json['expense_type'] != null) {
      expenseType = <ExpenseType>[];
      json['expense_type'].forEach((v) {
        expenseType!.add(new ExpenseType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['my_account_id'] = this.myAccountId;
    if (this.fromAccount != null) {
      data['from_account'] = this.fromAccount!.map((v) => v.toJson()).toList();
    }
    if (this.toAccount != null) {
      data['to_account'] = this.toAccount!.map((v) => v.toJson()).toList();
    }
    if (this.expenseType != null) {
      data['expense_type'] = this.expenseType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FromAccount {
  int? fromId;
  String? fromStaffName;

  FromAccount({this.fromId, this.fromStaffName});

  FromAccount.fromJson(Map<String, dynamic> json) {
    fromId = json['from_id'];
    fromStaffName = json['from_staff_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_id'] = this.fromId;
    data['from_staff_name'] = this.fromStaffName;
    return data;
  }
}

class ToAccount {
  int? toId;
  String? toStaffName;

  ToAccount({this.toId, this.toStaffName});

  ToAccount.fromJson(Map<String, dynamic> json) {
    toId = json['to_id'];
    toStaffName = json['to_staff_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['to_id'] = this.toId;
    data['to_staff_name'] = this.toStaffName;
    return data;
  }
}

class ExpenseType {
  int? typeId;
  String? typeName;

  ExpenseType({this.typeId, this.typeName});

  ExpenseType.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.typeId;
    data['type_name'] = this.typeName;
    return data;
  }
}