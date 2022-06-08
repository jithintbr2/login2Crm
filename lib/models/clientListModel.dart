class ClientListModel {
  bool? status;
  String? message;
  Data? data;

  ClientListModel({this.status, this.message, this.data});

  ClientListModel.fromJson(Map<String, dynamic> json) {
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
  List<ClientList>? clientList;

  Data({this.clientList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['clientList'] != null) {
      clientList = <ClientList>[];
      json['clientList'].forEach((v) {
        clientList!.add(new ClientList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientList != null) {
      data['clientList'] = this.clientList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientList {
  String? clientId;
  String? clientName;
  String? contact1;
  String? contactPerson;
  String? designation;
  String? email;
  String? createdDate;
  String? createdBy;
  String? clientImage;
  String? projectsCount;
  int? balanceDue;

  ClientList(
      {this.clientId,
        this.clientName,
        this.contact1,
        this.contactPerson,
        this.designation,
        this.email,
        this.createdDate,
        this.createdBy,
        this.clientImage,
        this.projectsCount,
        this.balanceDue});

  ClientList.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    contact1 = json['contact1'];
    contactPerson = json['contact_person'];
    designation = json['designation'];
    email = json['email'];
    createdDate = json['created_date'];
    createdBy = json['createdBy'];
    clientImage = json['clientImage'];
    projectsCount = json['projectsCount'];
    balanceDue = json['balanceDue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['contact1'] = this.contact1;
    data['contact_person'] = this.contactPerson;
    data['designation'] = this.designation;
    data['email'] = this.email;
    data['created_date'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['clientImage'] = this.clientImage;
    data['projectsCount'] = this.projectsCount;
    data['balanceDue'] = this.balanceDue;
    return data;
  }
}