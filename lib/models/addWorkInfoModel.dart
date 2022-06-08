class AddWorkInfoModel {
  bool? status;
  String? message;
  List<Data>? data;

  AddWorkInfoModel({this.status, this.message, this.data});

  AddWorkInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? staffName;

  Data({this.userId, this.staffName});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    staffName = json['staffName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['staffName'] = this.staffName;
    return data;
  }
}