class AddProjectInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddProjectInfoModel({this.status, this.message, this.data});

  AddProjectInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<ProjectTypes>? projectTypes;
  List<Clients>? clients;
  List<Statuses>? statuses;

  Data({this.projectTypes, this.clients, this.statuses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['project_types'] != null) {
      projectTypes = <ProjectTypes>[];
      json['project_types'].forEach((v) {
        projectTypes!.add(new ProjectTypes.fromJson(v));
      });
    }
    if (json['clients'] != null) {
      clients = <Clients>[];
      json['clients'].forEach((v) {
        clients!.add(new Clients.fromJson(v));
      });
    }
    if (json['statuses'] != null) {
      statuses = <Statuses>[];
      json['statuses'].forEach((v) {
        statuses!.add(new Statuses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projectTypes != null) {
      data['project_types'] =
          this.projectTypes!.map((v) => v.toJson()).toList();
    }
    if (this.clients != null) {
      data['clients'] = this.clients!.map((v) => v.toJson()).toList();
    }
    if (this.statuses != null) {
      data['statuses'] = this.statuses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectTypes {
  String? ptId;
  String? ptName;

  ProjectTypes({this.ptId, this.ptName});

  ProjectTypes.fromJson(Map<String, dynamic> json) {
    ptId = json['pt_id'];
    ptName = json['pt_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt_id'] = this.ptId;
    data['pt_name'] = this.ptName;
    return data;
  }
}

class Clients {
  String? clientId;
  String? clientName;

  Clients({this.clientId, this.clientName});

  Clients.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    return data;
  }
}

class Statuses {
  String? statusId;
  String? statusName;

  Statuses({this.statusId, this.statusName});

  Statuses.fromJson(Map<String, dynamic> json) {
    statusId = json['status_id'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_id'] = this.statusId;
    data['status_name'] = this.statusName;
    return data;
  }
}
