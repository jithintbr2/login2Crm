class AddTransactionInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddTransactionInfoModel({this.status, this.message, this.data});

  AddTransactionInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<FromAccounts>? fromAccounts;
  List<ToAccounts>? toAccounts;

  Data({this.fromAccounts, this.toAccounts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['from_accounts'] != null) {
      fromAccounts = <FromAccounts>[];
      json['from_accounts'].forEach((v) {
        fromAccounts!.add(new FromAccounts.fromJson(v));
      });
    }
    if (json['to_accounts'] != null) {
      toAccounts = <ToAccounts>[];
      json['to_accounts'].forEach((v) {
        toAccounts!.add(new ToAccounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fromAccounts != null) {
      data['from_accounts'] =
          this.fromAccounts!.map((v) => v.toJson()).toList();
    }
    if (this.toAccounts != null) {
      data['to_accounts'] = this.toAccounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FromAccounts {
  int? fromAccountId;
  String? fromAccountName;

  FromAccounts({this.fromAccountId, this.fromAccountName});

  FromAccounts.fromJson(Map<String, dynamic> json) {
    fromAccountId = json['fromAccountId'];
    fromAccountName = json['fromAccountName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromAccountId'] = this.fromAccountId;
    data['fromAccountName'] = this.fromAccountName;
    return data;
  }
}

class ToAccounts {
  int? toAccountId;
  String? toAccountName;

  ToAccounts({this.toAccountId, this.toAccountName});

  ToAccounts.fromJson(Map<String, dynamic> json) {
    toAccountId = json['toAccountId'];
    toAccountName = json['toAccountName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toAccountId'] = this.toAccountId;
    data['toAccountName'] = this.toAccountName;
    return data;
  }
}