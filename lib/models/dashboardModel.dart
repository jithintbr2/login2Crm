class DashboardModel {
  bool? status;
  String? message;
  Data? data;

  DashboardModel({this.status, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
  bool? isNotificationActive;
  String? loginUserId;
  String? loginUser;
  String? loginUserImage;
  List<Staff>? staff;
  List<Menus>? menus;
  String? totalReciept;
  int? totalExpense;
  int? totalPendingExpense;
  String? myTasks;
  String? pendingAssignedTask;
  String? accountId;
  bool? isCredit;
  String? account;

  Data(
      {this.isNotificationActive,
        this.loginUserId,
        this.loginUser,
        this.loginUserImage,
        this.staff,
        this.menus,
        this.totalReciept,
        this.totalExpense,
        this.totalPendingExpense,
        this.myTasks,
        this.pendingAssignedTask,
        this.accountId,
        this.isCredit,
        this.account});

  Data.fromJson(Map<String, dynamic> json) {
    isNotificationActive = json['isNotificationActive'];
    loginUserId = json['LoginUserId'];
    loginUser = json['LoginUser'];
    loginUserImage = json['LoginUserImage'];
    if (json['staff'] != null) {
      staff = <Staff>[];
      json['staff'].forEach((v) {
        staff!.add(new Staff.fromJson(v));
      });
    }
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v));
      });
    }
    totalReciept = json['totalReciept'];
    totalExpense = json['totalExpense'];
    totalPendingExpense = json['totalPendingExpense'];
    myTasks = json['myTasks'];
    pendingAssignedTask = json['pendingAssignedTask'];
    accountId = json['accountId'];
    isCredit = json['is_credit'];
    account = json['account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isNotificationActive'] = this.isNotificationActive;
    data['LoginUserId'] = this.loginUserId;
    data['LoginUser'] = this.loginUser;
    data['LoginUserImage'] = this.loginUserImage;
    if (this.staff != null) {
      data['staff'] = this.staff!.map((v) => v.toJson()).toList();
    }
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    data['totalReciept'] = this.totalReciept;
    data['totalExpense'] = this.totalExpense;
    data['totalPendingExpense'] = this.totalPendingExpense;
    data['myTasks'] = this.myTasks;
    data['pendingAssignedTask'] = this.pendingAssignedTask;
    data['accountId'] = this.accountId;
    data['is_credit'] = this.isCredit;
    data['account'] = this.account;
    return data;
  }
}

class Staff {
  String? name;
  String? staffImage;
  bool? active;
  String? staffUserId;
  List<Timeline>? timeline;

  Staff(
      {this.name,
        this.staffImage,
        this.active,
        this.staffUserId,
        this.timeline});

  Staff.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    staffImage = json['staffImage'];
    active = json['active'];
    staffUserId = json['staffUserId'];
    if (json['timeline'] != null) {
      timeline = <Timeline>[];
      json['timeline'].forEach((v) {
        timeline!.add(new Timeline.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['staffImage'] = this.staffImage;
    data['active'] = this.active;
    data['staffUserId'] = this.staffUserId;
    if (this.timeline != null) {
      data['timeline'] = this.timeline!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timeline {
  String? project;
  String? status;
  String? isActive;
  String? subTask;
  String? activity;
  String? remarks;
  String? datetime;
  String? fromTime;
  String? toTime;
  String? activityId;
  String? timeString;

  Timeline(
      {this.project,
        this.status,
        this.isActive,
        this.subTask,
        this.activity,
        this.remarks,
        this.datetime,
        this.fromTime,
        this.toTime,
        this.activityId,
        this.timeString});

  Timeline.fromJson(Map<String, dynamic> json) {
    project = json['project'];
    status = json['status'];
    isActive = json['isActive'];
    subTask = json['subTask'];
    activity = json['activity'];
    remarks = json['remarks'];
    datetime = json['datetime'];
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    activityId = json['activityId'];
    timeString = json['timeString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project'] = this.project;
    data['status'] = this.status;
    data['isActive'] = this.isActive;
    data['subTask'] = this.subTask;
    data['activity'] = this.activity;
    data['remarks'] = this.remarks;
    data['datetime'] = this.datetime;
    data['fromTime'] = this.fromTime;
    data['toTime'] = this.toTime;
    data['activityId'] = this.activityId;
    data['timeString'] = this.timeString;
    return data;
  }
}

class Menus {
  String? id;
  String? menuTitle;
  String? activePg;
  String? iconImage;

  Menus({this.id, this.menuTitle, this.activePg, this.iconImage});

  Menus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuTitle = json['menu_title'];
    activePg = json['active_pg'];
    iconImage = json['iconImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu_title'] = this.menuTitle;
    data['active_pg'] = this.activePg;
    data['iconImage'] = this.iconImage;
    return data;
  }
}