class ClientReceiptModel {
  bool? status;
  String? message;
  Data? data;

  ClientReceiptModel({this.status, this.message, this.data});

  ClientReceiptModel.fromJson(Map<String, dynamic> json) {
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
  List<RecieptList>? recieptList;

  Data({this.clientName, this.totalAmount, this.recieptList});

  Data.fromJson(Map<String, dynamic> json) {
    clientName = json['clientName'];
    totalAmount = json['totalAmount'];
    if (json['recieptList'] != null) {
      recieptList = <RecieptList>[];
      json['recieptList'].forEach((v) {
        recieptList!.add(new RecieptList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientName'] = this.clientName;
    data['totalAmount'] = this.totalAmount;
    if (this.recieptList != null) {
      data['recieptList'] = this.recieptList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecieptList {
  String? recieptId;
  String? recieptNo;
  String? recieptDate;
  String? recieptAmount;

  RecieptList(
      {this.recieptId, this.recieptNo, this.recieptDate, this.recieptAmount});

  RecieptList.fromJson(Map<String, dynamic> json) {
    recieptId = json['recieptId'];
    recieptNo = json['recieptNo'];
    recieptDate = json['recieptDate'];
    recieptAmount = json['recieptAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recieptId'] = this.recieptId;
    data['recieptNo'] = this.recieptNo;
    data['recieptDate'] = this.recieptDate;
    data['recieptAmount'] = this.recieptAmount;
    return data;
  }
}