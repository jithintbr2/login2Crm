class DebitCreditInfoModel {
  bool? status;
  String? message;
  List<Data>? data;

  DebitCreditInfoModel({this.status, this.message, this.data});

  DebitCreditInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? accountId;
  String? accountName;

  Data({this.accountId, this.accountName});

  Data.fromJson(Map<String, dynamic> json) {
    accountId = json['accountId'];
    accountName = json['accountName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['accountName'] = this.accountName;
    return data;
  }
}