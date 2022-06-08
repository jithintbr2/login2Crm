class AddQuickInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddQuickInfoModel({this.status, this.message, this.data});

  AddQuickInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<CountryCodes>? countryCodes;

  Data({this.projectTypes, this.countryCodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['project_types'] != null) {
      projectTypes = <ProjectTypes>[];
      json['project_types'].forEach((v) {
        projectTypes!.add(new ProjectTypes.fromJson(v));
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
    if (this.projectTypes != null) {
      data['project_types'] =
          this.projectTypes!.map((v) => v.toJson()).toList();
    }
    if (this.countryCodes != null) {
      data['country_codes'] =
          this.countryCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectTypes {
  String? id;
  String? typeName;

  ProjectTypes({this.id, this.typeName});

  ProjectTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_name'] = this.typeName;
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