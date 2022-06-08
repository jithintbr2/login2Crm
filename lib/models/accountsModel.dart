class AccountsModel {
  bool? status;
  String? message;
  Data? data;

  AccountsModel({this.status, this.message, this.data});

  AccountsModel.fromJson(Map<String, dynamic> json) {
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
  List<Submenus>? submenus;

  Data({this.submenus});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['submenus'] != null) {
      submenus = <Submenus>[];
      json['submenus'].forEach((v) {
        submenus!.add(new Submenus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.submenus != null) {
      data['submenus'] = this.submenus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Submenus {
  String? subMenuId;
  String? submenuTitle;
  String? appPage;
  String? subMenuIcon;

  Submenus({this.subMenuId, this.submenuTitle, this.appPage, this.subMenuIcon});

  Submenus.fromJson(Map<String, dynamic> json) {
    subMenuId = json['sub_menu_id'];
    submenuTitle = json['submenu_title'];
    appPage = json['app_page'];
    subMenuIcon = json['sub_menu_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_menu_id'] = this.subMenuId;
    data['submenu_title'] = this.submenuTitle;
    data['app_page'] = this.appPage;
    data['sub_menu_icon'] = this.subMenuIcon;
    return data;
  }
}