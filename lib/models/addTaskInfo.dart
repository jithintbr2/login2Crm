class AddTaskInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddTaskInfoModel({this.status, this.message, this.data});

  AddTaskInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<Staffs>? staffs;
  List<Projects>? projects;
  List<CountryCodes>? countryCodes;

  Data({this.staffs, this.projects, this.countryCodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['staffs'] != null) {
      staffs = <Staffs>[];
      json['staffs'].forEach((v) {
        staffs!.add(new Staffs.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
    if (json['country_codes'] != null) {
      countryCodes = <CountryCodes>[];
      json['country_codes'].forEach((v) {
        countryCodes!.add(new CountryCodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.staffs != null) {
      data['staffs'] = this.staffs!.map((v) => v.toJson()).toList();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    if (this.countryCodes != null) {
      data['country_codes'] =
          this.countryCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Staffs {
  String? userId;
  String? staffName;

  Staffs({this.userId, this.staffName});

  Staffs.fromJson(Map<String, dynamic> json) {
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

class Projects {
  String? projectId;
  String? projectName;

  Projects({this.projectId, this.projectName});

  Projects.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['projectName'] = this.projectName;
    return data;
  }
}

class CountryCodes {
  String? country;
  String? code;

  CountryCodes({this.country, this.code});

  CountryCodes.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['code'] = this.code;
    return data;
  }
}