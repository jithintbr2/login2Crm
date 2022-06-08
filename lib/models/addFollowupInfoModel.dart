class AddFollowupInfoModel {
  bool? status;
  String? message;
  List<Data>? data;

  AddFollowupInfoModel({this.status, this.message, this.data});

  AddFollowupInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? stsId;
  String? stsName;

  Data({this.stsId, this.stsName});

  Data.fromJson(Map<String, dynamic> json) {
    stsId = json['stsId'];
    stsName = json['stsName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stsId'] = this.stsId;
    data['stsName'] = this.stsName;
    return data;
  }
}