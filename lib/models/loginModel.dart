class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? role;
  String? token;
  int? userId;
  String? fullName;

  Data({this.name, this.role, this.token, this.userId, this.fullName});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
    token = json['token'];
    userId = json['user_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['role'] = this.role;
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    return data;
  }
}
