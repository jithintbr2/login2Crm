class AddClientInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddClientInfoModel({this.status, this.message, this.data});

  AddClientInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<ClientTypes>? clientTypes;
  List<ClientCat>? clientCat;
  List<CountryCodes>? countryCodes;

  Data({this.clientTypes, this.clientCat, this.countryCodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['client_types'] != null) {
      clientTypes = <ClientTypes>[];
      json['client_types'].forEach((v) {
        clientTypes!.add(new ClientTypes.fromJson(v));
      });
    }
    if (json['client_cat'] != null) {
      clientCat = <ClientCat>[];
      json['client_cat'].forEach((v) {
        clientCat!.add(new ClientCat.fromJson(v));
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
    if (this.clientTypes != null) {
      data['client_types'] = this.clientTypes!.map((v) => v.toJson()).toList();
    }
    if (this.clientCat != null) {
      data['client_cat'] = this.clientCat!.map((v) => v.toJson()).toList();
    }
    if (this.countryCodes != null) {
      data['country_codes'] =
          this.countryCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientTypes {
  String? ctId;
  String? ctName;

  ClientTypes({this.ctId, this.ctName});

  ClientTypes.fromJson(Map<String, dynamic> json) {
    ctId = json['ct_id'];
    ctName = json['ct_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ct_id'] = this.ctId;
    data['ct_name'] = this.ctName;
    return data;
  }
}

class ClientCat {
  String? ccId;
  String? ccName;

  ClientCat({this.ccId, this.ccName});

  ClientCat.fromJson(Map<String, dynamic> json) {
    ccId = json['cc_id'];
    ccName = json['cc_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cc_id'] = this.ccId;
    data['cc_name'] = this.ccName;
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