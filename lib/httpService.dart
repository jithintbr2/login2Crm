import 'dart:convert';
import 'package:crm_admin/models/notificationOnOffModel.dart';
import 'package:dio/dio.dart';
import 'models/ClientInvoiceModel.dart';
import 'models/EditExpenseModel.dart';
import 'models/StaffListModel.dart';
import 'models/accountsModel.dart';
import 'models/addClientInfoModel.dart';
import 'models/addClientModel.dart';
import 'models/addExpenseInfoModel.dart';
import 'models/addExpenseModel.dart';
import 'models/addFollowupInfoModel.dart';
import 'models/addFollowupModel.dart';
import 'models/addInvoiceInfoModel.dart';
import 'models/addInvoiceModel.dart';
import 'models/addMileStoneInfoModel.dart';
import 'models/addMileStoneModel.dart';
import 'models/addProjectDescriptionInfoModel.dart';
import 'models/addProjectDescriptionModel.dart';
import 'models/addProjectInfoModel.dart';
import 'models/addProjectModel.dart';
import 'models/addQuickInfoModel.dart';
import 'models/addReceiptInfoModel.dart';
import 'models/addReceiptModel.dart';
import 'models/addTaskInfo.dart';
import 'models/addTaskModel.dart';
import 'models/addTransactionInfoModel.dart';
import 'models/addTransactionModel.dart';
import 'models/addWorkAssignModel.dart';
import 'models/addWorkInfoModel.dart';
import 'models/clientDetailsModel.dart';
import 'models/clientListModel.dart';
import 'models/clientProjectsModel.dart';
import 'models/clientReceiptModel.dart';
import 'models/dashboardModel.dart';
import 'models/debitCreditInfoModel.dart';
import 'models/debitCreditModel.dart';
import 'models/deleteClientModel.dart';
import 'models/deleteDescriptionModel.dart';
import 'models/deleteEnquiryFollowupModel.dart';
import 'models/deleteEnquiryModel.dart';
import 'models/deleteExpenseModel.dart';
import 'models/deleteInvoiceModel.dart';
import 'models/deleteMileStoneModel.dart';
import 'models/deleteProjectModel.dart';
import 'models/deleteReceiptModel.dart';
import 'models/deleteTaskDescriptionModel.dart';
import 'models/deleteTaskModel.dart';
import 'models/deleteTransactionModel.dart';
import 'models/descriptionStatusUpdateModel.dart';
import 'models/editClientModel.dart';
import 'models/editDescriptionModel.dart';
import 'models/editFollowupModel.dart';
import 'models/editInvoiceInfoModel.dart';
import 'models/editMileStoneModel.dart';
import 'models/editProjectModel.dart';
import 'models/editTaskDescriptionModel.dart';
import 'models/editTaskInfoModel.dart';
import 'models/editTransactionModel.dart';
import 'models/enquiryAddModel.dart';
import 'models/enquiryDetailsModel.dart';
import 'models/enquiryEditModel.dart';
import 'models/enquiryInfoModel.dart';
import 'models/enquirytListModel.dart';
import 'models/expenseListModel.dart';
import 'models/homeModel.dart';
import 'models/invoiceDetailsModel.dart';
import 'models/invoiceListModel.dart';
import 'models/loginModel.dart';
import 'models/mileStoneStatusUpdateModel.dart';
import 'models/milestoneInfoModel.dart';
import 'models/pendingExpenseModel.dart';
import 'models/projectDetailsModel.dart';
import 'models/projectListModel.dart';
import 'models/quickAddModel.dart';
import 'models/receiptDetalsModel.dart';
import 'models/receiptListModel.dart';
import 'models/reorderMileStoneModel.dart';
import 'models/subModuleDetailModel.dart';
import 'models/taskDetailsModel.dart';
import 'models/taskInfoModel.dart';
import 'models/taskListModel.dart';
import 'models/transactionListModel.dart';
import 'models/updateAllInTaskModel.dart';
import 'models/updateModel.dart';
import 'models/workDetailsModel.dart';

class HttpService {
  static Dio _dio = Dio();

  //static final baseUrl = "https://login2.co.in/test_crm_new/mobile_app_api/";

  static final baseUrl =
      "https://login2.co.in/work_management_system/mobile_app_api/";

  static Future login(uanemVar, pass, firebaseToken) async {
    var params = {
      "username": uanemVar,
      "password": pass,
      "firebaseId": firebaseToken
    };
    try {
      var result = await _dio.get(baseUrl + "login", queryParameters: params);
      print(params);
      print(result);

      LoginModel model = LoginModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future dashboard(token, fromDate) async {
    var params = {
      "token": token,
      "fromDate": fromDate,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "dashboard", queryParameters: params);

      DashboardModel model = DashboardModel.fromJson(result.data);
      print(result);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future projectList(token, searchKey) async {
    var params = {
      "token": token,
      "search": searchKey,
    };
    try {
      var result =
          await _dio.get(baseUrl + "project_list", queryParameters: params);

      ProjectListModel model = ProjectListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future clientList(token, searchKey) async {
    var params = {
      "token": token,
      "search": searchKey,
    };
    try {
      var result =
          await _dio.get(baseUrl + "client_list", queryParameters: params);

      ClientListModel model = ClientListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future staffList(token) async {
    var params = {
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "staff_list", queryParameters: params);

      StaffListModel model = StaffListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future projectDetails(projectId, token) async {
    var params = {
      "projectId": projectId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "project_details", queryParameters: params);
      print(params);

      ProjectDetailsModel model = ProjectDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future accounts(token, menuId) async {
    var params = {
      "menu_id": menuId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "submenus", queryParameters: params);

      AccountsModel model = AccountsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future clientDetails(clientId, token) async {
    var params = {
      "clientId": clientId,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "client_details", queryParameters: params);
      ClientDetailsModel model = ClientDetailsModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addClientInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "client_add_info",
      );
      AddClientInfoModel model = AddClientInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addClient(
      name,
      countryCode,
      contact1,
      contact2,
      emailId,
      contactPerson,
      designation,
      address,
      description,
      gstNumber,
      careOff,
      remarks,
      sendNotification,
      token) async {
    var params = {
      "token": token,
      "clientName": name,
      "address": address,
      "countryCode": countryCode,
      "contact1": contact1,
      "contact2": contact2,
      "contactPerson": contactPerson,
      "designation": designation,
      "email": emailId,
      "description": description,
      "remarks": remarks,
      "careOf": careOff,
      "gstNo": gstNumber,
      "sendNotification": sendNotification,
    };
    try {
      var result =
          await _dio.get(baseUrl + "add_client", queryParameters: params);
      AddClientModel model = AddClientModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addProjectInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "project_add_info",
      );
      AddProjectInfoModel model = AddProjectInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addProjects(body) async {
    // var params = {
    //   "token": token,
    //   "projectName": projectName,
    //   "gstCheck": isGst,
    //   "gstAmount": totalAmount,
    //   "generateInvoice": isInvoice,
    //   "projectType": projectType,
    //   "client": client,
    //   "cost": cost,
    //   "status": status,
    //   "startDate": estimatedFromDate,
    //   "endDate": estimatedToDate,
    //   "remarks": remarks,
    //   "description": description,
    //   "paidAmount": paidAmount,
    // };

    try {
      var result =
          //await _dio.get(baseUrl + "add_project", queryParameters: params);
          await _dio.post(baseUrl + "add_project", data: jsonEncode(body));
      AddProjectModel model = AddProjectModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addExpenseInfo(token) async {
    var params = {
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "add_expense_details",
          queryParameters: params);
      AddExpenseInfoModel model = AddExpenseInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addExpense(
      fromAccount, expenseType, amount, person, date, remarks, token) async {
    var params = {
      "token": token,
      "fromAccount": fromAccount,
      "type": expenseType,
      "amount": amount,
      "toAccount": person,
      "remark": remarks,
      "expenseDate": date,
    };

    try {
      var result =
          await _dio.get(baseUrl + "add_expense", queryParameters: params);
      AddExpenseModel model = AddExpenseModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future expenseList(token, fromDate, toDate) async {
    var params = {
      "token": token,
      "fromDate": fromDate,
      "toDate": toDate,
    };
    try {
      var result =
          await _dio.get(baseUrl + "expense_list", queryParameters: params);
      print(result);

      ExpenseListModel model = ExpenseListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addQuickInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "quick_add_info",
      );
      AddQuickInfoModel model = AddQuickInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future quickAdd(clientName, countryCode, contactNumber, projectName,
      projectType, projectCost, advance, createdDate, token) async {
    var params = {
      "token": token,
      "client_name": clientName,
      "countryCode": countryCode,
      "contact_number": contactNumber,
      "project_name": projectName,
      "cost": projectCost,
      "cash_received": advance,
      "prj_type": projectType,
      "createdDate": createdDate,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "quick_add", queryParameters: params);
      print(result);

      QuickAddModel model = QuickAddModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future invoiceList(fromDate, toDate, searchKey, token, status) async {
    var params = {
      "token": token,
      "status": status,
      "fromDate": fromDate,
      "toDate": toDate,
      "searchKey": searchKey,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "invoice_list", queryParameters: params);

      InvoiceListModel model = InvoiceListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future receiptList(token, fromdate, todate, searchKey) async {
    var params = {
      "token": token,
      "fromDate": fromdate,
      "toDate": todate,
      "search": searchKey,
    };
    try {
      var result =
          await _dio.get(baseUrl + "receipt_list", queryParameters: params);

      ReceiptListModel model = ReceiptListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addInvoiceInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "invoice_add_info",
      );
      AddInvoiceInfoModel model = AddInvoiceInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future clientProjects(clientId) async {
    var params = {
      "client_id": clientId,
    };
    try {
      var result = await _dio.get(baseUrl + "get_client_projects",
          queryParameters: params);

      ClientProjectsModel model = ClientProjectsModel.fromJson(result.data);
      print(model);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addInvoice(body) async {
    // print(body);
    var params = {
      "data": body,
    };
    try {
      var result =
          await _dio.post(baseUrl + "add_invoice", data: jsonEncode(body));
      print(body);

      AddInvoiceModel model = AddInvoiceModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future AddReceiptInfo(invoiceId) async {
    var params = {
      "invoice_id": invoiceId,
    };
    try {
      var result =
          await _dio.get(baseUrl + "add_receipt_info", queryParameters: params);

      AddReciptInfoModel model = AddReciptInfoModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addReceipt(body) async {
    print(body);
    var params = {
      "data": body,
    };
    try {
      var result =
          await _dio.post(baseUrl + "add_receipt", data: jsonEncode(body));
      print(body);

      AddReceiptModel model = AddReceiptModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future invoiceDetails(invoiceId, token) async {
    var params = {
      "invoiceId": invoiceId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "invoice_details", queryParameters: params);

      InvoiceDetailsModel model = InvoiceDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future receiptDetails(receiptId, token) async {
    var params = {"receiptId": receiptId, "token": token};
    try {
      var result =
          await _dio.get(baseUrl + "reciept_details", queryParameters: params);

      ReceiptDetailsModel model = ReceiptDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future debitCredit(fromDate, toDate, account, token) async {
    var params = {
      "token": token,
      "fromDate": fromDate,
      "toDate": toDate,
      "accountId": account
    };
    try {
      var result =
          await _dio.get(baseUrl + "debit_credit", queryParameters: params);
      print(params);
      print(result);

      DebitCreditModel model = DebitCreditModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future debitCreditInfo() async {
    try {
      var result = await _dio.get(baseUrl + "debit_credit_info");

      DebitCreditInfoModel model = DebitCreditInfoModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addTransactionInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "transaction_add_info",
      );
      AddTransactionInfoModel model =
          AddTransactionInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addTransaction(
      sendBy, amount, sendTo, date, remarks, token) async {
    var params = {
      "token": token,
      "sendBy": sendBy,
      "amount": amount,
      "sendTo": sendTo,
      "remarks": remarks,
      "Transferdate": date,
    };

    try {
      var result =
          await _dio.get(baseUrl + "transaction_add", queryParameters: params);
      AddTransactionModel model = AddTransactionModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future transactionList(token, fromDate, toDate) async {
    var params = {
      "token": token,
      "fromDate": fromDate,
      "toDate": toDate,
    };
    try {
      var result =
          await _dio.get(baseUrl + "transaction_list", queryParameters: params);

      TransactionListModel model = TransactionListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future pendingExpense(account, token) async {
    var params = {
      "token": token,
      "accountId": account,
    };
    try {
      var result = await _dio.get(baseUrl + "pending_expense_report",
          queryParameters: params);

      PendingExpenseModel model = PendingExpenseModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editExpense(fromAccount, expenseType, amount, person, date,
      remarks, token, id) async {
    var params = {
      "token": token,
      "fromAccount": fromAccount,
      "type": expenseType,
      "amount": amount,
      "toAccount": person,
      "remark": remarks,
      "expenseDate": date,
      "expenseId": id,
    };

    try {
      var result =
          await _dio.get(baseUrl + "edit_expense", queryParameters: params);
      EditExpenseModel model = EditExpenseModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteExpense(expenseId, token) async {
    var params = {
      "expenseId": expenseId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "delete_expense", queryParameters: params);

      DeleteExpenseModel model = DeleteExpenseModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteReceipt(receiptId, token) async {
    var params = {
      "receiptId": receiptId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "delete_receipt", queryParameters: params);

      DeleteReceiptModel model = DeleteReceiptModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editTransaction(
      fromAccount, amount, person, date, remarks, token, id) async {
    var params = {
      "token": token,
      "sendBy": fromAccount,
      "amount": amount,
      "sendTo": person,
      "remarks": remarks,
      "Transferdate": date,
      "transactionId": id,
    };

    try {
      var result =
          await _dio.get(baseUrl + "edit_transaction", queryParameters: params);
      EditTransactionModel model = EditTransactionModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteTransaction(transactionId, token) async {
    var params = {
      "transactionId": transactionId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "delete_transaction",
          queryParameters: params);

      DeleteTransactionModel model =
          DeleteTransactionModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editClient(
      name,
      contact1,
      contact2,
      emailId,
      contactPerson,
      designation,
      address,
      description,
      gstNumber,
      careOff,
      remarks,
      token,
      clientId) async {
    var params = {
      "token": token,
      "clientName": name,
      "address": address,
      "contact1": contact1,
      "contact2": contact2,
      "contactPerson": contactPerson,
      "designation": designation,
      "email": emailId,
      "description": description,
      "remarks": remarks,
      "careOf": careOff,
      "gstNo": gstNumber,
      "clientId": clientId,
    };
    try {
      var result =
          await _dio.get(baseUrl + "edit_client", queryParameters: params);
      EditClientModel model = EditClientModel.fromJson(result.data);
      print(params);
      print(result);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteClient(clientId, token) async {
    var params = {
      "clientId": clientId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "delete_client", queryParameters: params);

      DeleteClientModel model = DeleteClientModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future clientInvoice(token, clientId) async {
    var params = {
      "clientId": clientId,
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "get_client_invoices",
          queryParameters: params);
      ClientInvoiceModel model = ClientInvoiceModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future clientReceipt(token, clientId) async {
    var params = {
      "clientId": clientId,
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "get_client_reciept",
          queryParameters: params);
      ClientReceiptModel model = ClientReceiptModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editProject(projectName, client, cost, remarks, projectType,
      status, token, projectId) async {
    var params = {
      "token": token,
      "projectName": projectName,
      "client": client,
      "cost": cost,
      "remarks": remarks,
      "projectType": projectType,
      "status": status,
      "projectId": projectId,
    };
    try {
      var result =
          await _dio.get(baseUrl + "edit_project", queryParameters: params);
      EditProjectModel model = EditProjectModel.fromJson(result.data);
      print(params);
      print(result);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteProject(projectId, token) async {
    var params = {
      "projectId": projectId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "delete_project", queryParameters: params);

      DeleteProjectModel model = DeleteProjectModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future workDetails(staffId, activityId, token) async {
    var params = {
      "userId": staffId,
      "activityId": activityId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "module_details", queryParameters: params);

      WorkDetailsModel model = WorkDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future subModuleDetails(activityId, subModuleId, token) async {
    var params = {
      "subModuleId": subModuleId,
      "activityId": activityId,
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "sub_module_details",
          queryParameters: params);

      SubModuleDetailsModel model = SubModuleDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteInvoice(invoiceId, token) async {
    var params = {
      "invoiceId": invoiceId,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "delete_invoice", queryParameters: params);

      DeleteInvoiceModel model = DeleteInvoiceModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future notificationOnOff(token) async {
    var params = {
      "token": token,
    };
    try {
      var result = await _dio.get(baseUrl + "notificatio_on_off",
          queryParameters: params);

      NotificationOnOffModel model =
          NotificationOnOffModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editInvoiceInfo(invoiceId, token) async {
    var params = {
      "token": token,
      "invoiceId": invoiceId,
    };
    try {
      var result = await _dio.get(baseUrl + "invoice_edit_info",
          queryParameters: params);

      EditInvoiceInfoModel model = EditInvoiceInfoModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addWorkInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "work_assign_info",
      );
      AddWorkInfoModel model = AddWorkInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addWorkAssign(module, staff, description, subModule, hrs, mints,
      date, projectId, token) async {
    var params = {
      "token": token,
      "module": module,
      "description": description,
      "subModule": subModule,
      "staff": staff,
      "hrs": hrs,
      "mints": mints,
      "completionDate": date,
      "projectId": projectId,
    };
    try {
      var result =
          await _dio.get(baseUrl + "work_assign", queryParameters: params);
      print(params);
      print(result);
      AddWorkAssignModel model = AddWorkAssignModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addTaskInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "task_add_info",
      );
      AddTaskInfoModel model = AddTaskInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future taskInfo(token, staffId) async {
    var params = {
      "token": token,
      "selectUserId": staffId,
    };
    try {
      var result =
          await _dio.get(baseUrl + "task_list_info", queryParameters: params);
      TaskInfoModel model = TaskInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addTask(body) async {
    // var params = {
    //   "token": token,
    //   "title": title,
    //   "phone": phone,
    //   "modules": description,
    //   "assignedTo": staff,
    //   "date1": date,
    //   "lastDate": lastDate,
    //   "isProject": isProject,
    //   "projectId": project,
    // };
    // print(params);
    try {
      var result =
          await _dio.post(baseUrl + "add_task", data: jsonEncode(body));
      //await _dio.get(baseUrl + "add_task", queryParameters: params);

      AddTaskModel model = AddTaskModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future listTasks(token, staff, status, allStatus) async {
    var params = {
      "token": token,
      "status": status,
      "staffId": staff,
      "allStatus": allStatus,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "list_tasks", queryParameters: params);

      ListTaskModel model = ListTaskModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editTask(body) async {
    // var params = {
    //   "token": token,
    //   "title": title,
    //   "phone": phone,
    //   "modules": description,
    //   "assignedTo": staff,
    //   "date1": date,
    //   "lastDate": lastDate,
    //   "isProject": isProject,
    //   "projectId": project,
    // };
    // print(params);
    try {
      var result =
          await _dio.post(baseUrl + "edit_task", data: jsonEncode(body));
      //await _dio.get(baseUrl + "add_task", queryParameters: params);

      AddTaskModel model = AddTaskModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteTask(taskId, token) async {
    var params = {
      "token": token,
      "taskId": taskId,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "delete_task", queryParameters: params);
      //print(params);

      DeleteTaskModel model = DeleteTaskModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future taskDetails(token, taskId) async {
    var params = {
      "token": token,
      "taskId": taskId,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "task_submodules", queryParameters: params);
      //print(params);

      TaskDetailsModel model = TaskDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addEnquiry(
      clientName,
      projectName,
      countryCode,
      contact1,
      contactPerson,
      designation,
      projectType,
      projectCost,
      remark,
      token) async {
    var params = {
      "company_name": clientName,
      "countryCode": countryCode,
      "project_name": projectName,
      "contact1": contact1,
      "company_head": contactPerson,
      "designation": designation,
      "type": projectType,
      "estimated_amount": projectCost,
      "remark": remark,
      "token": token,
    };
    try {
      var result =
          await _dio.get(baseUrl + "add_enquiry", queryParameters: params);
      EnquiryAddModel model = EnquiryAddModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future enquiryList(token, status, staff, searchKey) async {
    var params = {
      "token": token,
      "searchKey": searchKey,
      "selectedUser": staff,
      "status": status,
    };
    try {
      var result =
          await _dio.get(baseUrl + "enquiry_list", queryParameters: params);
      print(result);

      EnquirytListModel model = EnquirytListModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editEnquiry(clientName, projectName, contact1, contactPerson,
      designation, projectType, projectCost, remark, token, enquiryId) async {
    var params = {
      "company_name": clientName,
      "project_name": projectName,
      "contact1": contact1,
      "company_head": contactPerson,
      "designation": designation,
      "type": projectType,
      "estimated_amount": projectCost,
      "remark": remark,
      "token": token,
      "enquiryId": enquiryId,
    };
    try {
      var result =
          await _dio.get(baseUrl + "edit_enquiry", queryParameters: params);
      EnquiryEditModel model = EnquiryEditModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteEnquiry(enquiryId, token) async {
    var params = {
      "enquiryId": enquiryId,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "delete_enquiry", queryParameters: params);
      //print(params);

      DeleteEnquiryModel model = DeleteEnquiryModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future enquiryDetails(token, enquiryId) async {
    var params = {
      "enquiryId": enquiryId,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "enquiry_details", queryParameters: params);
      //print(params);

      EnquiryDetailsModel model = EnquiryDetailsModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addFollowupInfo() async {
    try {
      var result = await _dio.get(
        baseUrl + "follow_up_info",
      );
      AddFollowupInfoModel model = AddFollowupInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addFollowup(
      date, nextFollowupDate, status, remarks, token, enquiryId) async {
    var params = {
      "enquiryDate": date,
      "nextDate": nextFollowupDate,
      "status": status,
      "remarks": remarks,
      "enquiryId": enquiryId,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "add_follow_up", queryParameters: params);
      //print(params);

      AddFollowupModel model = AddFollowupModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteEnquiryFollowup(followupId, token) async {
    var params = {
      "followUpId": followupId,
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "delete_enquiry_followup",
          queryParameters: params);
      //print(params);

      DeleteEnquiryFollowupModel model =
          DeleteEnquiryFollowupModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future homePage(token) async {
    var params = {
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "home", queryParameters: params);
      //print(params);

      HomeModel model = HomeModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editFollowup(date, nextFollowupDate, status, remarks, token,
      followupId, enquiryId) async {
    var params = {
      "enquiryDate": date,
      "nextDate": nextFollowupDate,
      "status": status,
      "remarks": remarks,
      "followUpId": followupId,
      "token": token,
      "enquiryId": enquiryId,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "edt_follow_up", queryParameters: params);
      //print(params);

      EditFollowUpModel model = EditFollowUpModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future enquiryInfo(token, selecetdIndex) async {
    var params = {
      "token": token,
      "selectedUser": selecetdIndex,
    };
    try {
      var result = await _dio.get(baseUrl + "enquiry_list_info",
          queryParameters: params);
      EnquiryInfoModel model = EnquiryInfoModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future descriptionStatusUpdate(descriptionId, token, remark) async {
    var params = {
      "token": token,
      "descriptionId": descriptionId,
      "remarks": remark,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "description_status_update",
          queryParameters: params);
      //print(params);

      DescriptionStatusUpdateModel model =
          DescriptionStatusUpdateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future descriptionRemarkUpdate(descriptionId, token, remark) async {
    var params = {
      "token": token,
      "descriptionId": descriptionId,
      "remarks": remark,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "description_task_remark_update",
          queryParameters: params);
      //print(params);

      DescriptionStatusUpdateModel model =
          DescriptionStatusUpdateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future completeTask(taskId, token) async {
    var params = {
      "token": token,
      "taskId": taskId,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "complete_task", queryParameters: params);
      //print(params);

      UpdateAllInTaskModel model = UpdateAllInTaskModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future mileStoneStatusUpdate(mileStoneId, token) async {
    var params = {
      "token": token,
      "milestoneId": mileStoneId,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "update_mile_stone",
          queryParameters: params);
      //print(params);

      MileStoneStatusUpdateModel model =
          MileStoneStatusUpdateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future mileStoneRemarkUpdate(mileStoneId, token, remark) async {
    var params = {
      "token": token,
      "milestoneId": mileStoneId,
      "remark": remark,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "milestone_remark_update",
          queryParameters: params);
      //print(params);

      MileStoneStatusUpdateModel model =
          MileStoneStatusUpdateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future forceUpdate() async {
    try {
      var result = await _dio.get(baseUrl + "force_updation_data");
      print(result);

      UpdateModel model = UpdateModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editTaskInfo(taskId, token) async {
    var params = {
      "taskId": taskId,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "edit_task_info", queryParameters: params);
      //print(params);

      EditTaskInfoModel model = EditTaskInfoModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editTaskDescription(descriptionId, description, token) async {
    var params = {
      "descriptionId": descriptionId,
      "description": description,
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "task_description_edit",
          queryParameters: params);
      //print(params);

      EditTaskDescriptionModel model =
          EditTaskDescriptionModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteTaskDescription(descriptionId, token) async {
    var params = {
      "descriptionId": descriptionId,
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "task_description_delete",
          queryParameters: params);
      //print(params);

      DeleteTaskDescriptionModel model =
          DeleteTaskDescriptionModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future milestoneListData(projectType) async {
    var params = {
      "projectType": projectType,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "get_milestones", queryParameters: params);
      //print(params);

      MilestoneInfoModel model = MilestoneInfoModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editMileStone(mileStoneId, token, text) async {
    var params = {
      "mileStoneId": mileStoneId,
      "mileStone": text,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "edit_milestones", queryParameters: params);
      //print(params);

      EditMileStoneModel model = EditMileStoneModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteMileStone(mileStoneId, token) async {
    var params = {
      "projectMileStoneId": mileStoneId,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "delete_milestone", queryParameters: params);
      //print(params);

      DeleteMileStoneModel model = DeleteMileStoneModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future reorderMileStone(body) async {
    try {
      var result =
          //await _dio.get(baseUrl + "add_project", queryParameters: params);
          await _dio.post(baseUrl + "update_priorities",
              data: jsonEncode(body));
      ReorderMileStoneModel model = ReorderMileStoneModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addMileStoneInfo(projectId, token) async {
    var params = {
      "projectId": projectId,
      "token": token,
    };
    print(params);
    try {
      var result =
          await _dio.get(baseUrl + "milestone_info", queryParameters: params);
      //print(params);

      AddMilieStoneInfoModel model =
          AddMilieStoneInfoModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addMileStone(body) async {
    try {
      var result =
          //await _dio.get(baseUrl + "add_project", queryParameters: params);
          await _dio.post(baseUrl + "add_milestone", data: jsonEncode(body));
      AddMIleStoneModel model = AddMIleStoneModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future editDescription(descriptionId, token, text) async {
    var params = {
      "descriptionId": descriptionId,
      "description": text,
      "token": token,
    };

    try {
      var result = await _dio.get(baseUrl + "edit_project_description",
          queryParameters: params);
      //print(params);

      EditDescriptionModel model = EditDescriptionModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future deleteDescription(descriptionId, token) async {
    var params = {
      "descriptionId": descriptionId,
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "delete_project_description",
          queryParameters: params);
      //print(params);

      DeleteDescriptionModel model =
          DeleteDescriptionModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addProjectDescriptionInfo(projectId, token) async {
    var params = {
      "projectId": projectId,
      "token": token,
    };
    print(params);
    try {
      var result = await _dio.get(baseUrl + "project_description_info",
          queryParameters: params);
      //print(params);

      AddProjectDescriptionInfoModel model =
          AddProjectDescriptionInfoModel.fromJson(result.data);

      return model;
    } catch (Exception) {
      return null;
    }
  }

  static Future addprojectDescription(body) async {
    try {
      var result =
          //await _dio.get(baseUrl + "add_project", queryParameters: params);
          await _dio.post(baseUrl + "add_project_description",
              data: jsonEncode(body));
      AddProjectDescriptionModel model =
          AddProjectDescriptionModel.fromJson(result.data);
      return model;
    } catch (Exception) {
      return null;
    }
  }
}
