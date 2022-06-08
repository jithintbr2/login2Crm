class AddInvoiceInfoModel {
  bool? status;
  String? message;
  Data? data;

  AddInvoiceInfoModel({this.status, this.message, this.data});

  AddInvoiceInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? invoiceId;

  Data({this.clientList, this.invoiceId});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['client_list'] != null) {
      clientList = <ClientList>[];
      json['client_list'].forEach((v) {
        clientList!.add(new ClientList.fromJson(v));
      });
    }
    invoiceId = json['invoice_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientList != null) {
      data['client_list'] = this.clientList!.map((v) => v.toJson()).toList();
    }
    data['invoice_id'] = this.invoiceId;
    return data;
  }
}

class ClientList {
  int? clientId;
  String? clientName;

  ClientList({this.clientId, this.clientName});

  ClientList.fromJson(Map<String, dynamic> json) {
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
