class HomeModel {
  bool? status;
  String? message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? image;
  List<Staffs>? staffs;

  Data({this.userName, this.image, this.staffs});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    image = json['Image'];
    if (json['staffs'] != null) {
      staffs = <Staffs>[];
      json['staffs'].forEach((v) {
        staffs!.add(new Staffs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['Image'] = this.image;
    if (this.staffs != null) {
      data['staffs'] = this.staffs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Staffs {
  String? staffName;
  bool? nowWorking;
  String? image;

  Staffs({this.staffName, this.nowWorking, this.image});

  Staffs.fromJson(Map<String, dynamic> json) {
    staffName = json['staffName'];
    nowWorking = json['nowWorking'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staffName'] = this.staffName;
    data['nowWorking'] = this.nowWorking;
    data['Image'] = this.image;
    return data;
  }
}