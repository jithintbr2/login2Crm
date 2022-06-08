class AddReciptInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddReciptInfoModel({this.status, this.message, this.data});

  AddReciptInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? invoiceNo;
  String? clientName;
  List<CollectedByList>? collectedByList;
  List<Particulars>? particulars;

  Data(
      {this.invoiceNo,
      this.clientName,
      this.collectedByList,
      this.particulars});

  Data.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoice_no'];
    clientName = json['client_name'];
    if (json['collected_by_list'] != null) {
      collectedByList = <CollectedByList>[];
      json['collected_by_list'].forEach((v) {
        collectedByList!.add(new CollectedByList.fromJson(v));
      });
    }
    if (json['particulars'] != null) {
      particulars = <Particulars>[];
      json['particulars'].forEach((v) {
        particulars!.add(new Particulars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_no'] = this.invoiceNo;
    data['client_name'] = this.clientName;
    if (this.collectedByList != null) {
      data['collected_by_list'] =
          this.collectedByList!.map((v) => v.toJson()).toList();
    }
    if (this.particulars != null) {
      data['particulars'] = this.particulars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CollectedByList {
  int? id;
  String? name;

  CollectedByList({this.id, this.name});

  CollectedByList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Particulars {
  String? particularId;
  String? particularName;
  String? particularAmount;

  Particulars({this.particularId, this.particularName, this.particularAmount});

  Particulars.fromJson(Map<String, dynamic> json) {
    particularId = json['particular_id'];
    particularName = json['particular_name'];
    particularAmount = json['particular_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['particular_id'] = this.particularId;
    data['particular_name'] = this.particularName;
    data['particular_amount'] = this.particularAmount;
    return data;
  }
}
