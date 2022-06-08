class ClientProjectsModel {
  bool? status;
  String? message;
  List<Data>? data;

  ClientProjectsModel({this.status, this.message, this.data});

  ClientProjectsModel.fromJson(Map<String, dynamic> json) {
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
  int? projectId;
  String? projectName;
  int? projectAmount;

  Data({this.projectId, this.projectName, this.projectAmount});

  Data.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    projectName = json['project_name'];
    projectAmount = json['project_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.projectId;
    data['project_name'] = this.projectName;
    data['project_amount'] = this.projectAmount;
    return data;
  }
}