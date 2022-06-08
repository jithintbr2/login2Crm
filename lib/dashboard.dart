import 'package:crm_admin/accounts.dart';
import 'package:crm_admin/clientList.dart';
import 'package:crm_admin/httpService.dart';
import 'package:crm_admin/pendingExpense.dart';
import 'package:crm_admin/projectList.dart';
import 'package:crm_admin/quickAdd.dart';
import 'package:crm_admin/receiptList.dart';
import 'package:crm_admin/staffList.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'addEnquiry.dart';
import 'addTask.dart';
import 'common.dart';
import 'debitCredit.dart';
import 'enquiryList.dart';
import 'expenseList.dart';
import 'listTask.dart';
import 'login.dart';
import 'models/dashboardModel.dart';
import 'models/notificationOnOffModel.dart';
import 'workDetails.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  String? token;
  int? selectedIndex;

  Dashboard(this.token,this.selectedIndex);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  DashboardModel? dashboardDetails;
  bool status = false;
  String fromdate = DateTime.now().toString();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');


  TextEditingController fromDate = new TextEditingController();
  bool? isToggled;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(status, fromdate);
  }

  getData(status, fromdate) async {
    dashboardDetails = await HttpService.dashboard(widget.token, fromdate);
    isToggled = dashboardDetails!.data!.isNotificationActive;
    if (dashboardDetails != null) {
      if (status == true) {
        Navigator.pop(context);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: dashboardDetails != null
          ? Container(
              width: double.infinity,
              height: size.height,
              child: RefreshIndicator(
                onRefresh: () async {
                  Common.showProgressDialog(context, "Loading..");
                  getData(true, fromdate);
                },

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset("assets/images/dashbord_top.png",
                              width: size.width),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(height: 50,),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'LOGIN2',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                              Colors.white,
                                              radius: 15,
                                              child: Icon(
                                                Icons
                                                    .notification_important,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => ListTask(widget.token,dashboardDetails!.data!.loginUserId,false)),
                                                );
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                Colors.white,
                                                radius: 15,
                                                child: Icon(Icons.task,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hello, ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        dashboardDetails!.data!.loginUser
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15),
                            itemCount:
                            dashboardDetails!.data!.menus!.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () async {
                                  if (dashboardDetails!
                                      .data!.menus![index].activePg
                                      .toString() ==
                                      'projects') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProjectList(widget.token,widget.selectedIndex)),
                                    );
                                  } else if (dashboardDetails!
                                      .data!.menus![index].activePg
                                      .toString() ==
                                      'staffs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StaffList(widget.token)),
                                    );
                                  } else if (dashboardDetails!
                                      .data!.menus![index].activePg
                                      .toString() ==
                                      'clients') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ClientList(widget.token)),
                                    );
                                  } else if (dashboardDetails!
                                      .data!.menus![index].activePg
                                      .toString() ==
                                      'accounts') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Accounts(
                                              widget.token,
                                              dashboardDetails!.data!
                                                  .menus![index].id,widget.selectedIndex)),
                                    );
                                  } else if (dashboardDetails!
                                      .data!.menus![index].activePg
                                      .toString() ==
                                      'quick_insert') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuickAdd(widget.token)),
                                    );
                                  } else if (dashboardDetails!
                                      .data!.menus![index].activePg
                                      .toString() ==
                                      'tasks') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListTask(widget.token,dashboardDetails!
                                                  .data!.loginUserId,false)),
                                    );
                                  } else if (dashboardDetails!
                                      .data!.menus![index].activePg
                                      .toString() ==
                                      'enquiry') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EnquiryList(widget.token,dashboardDetails!
                                                  .data!.loginUserId)),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: 81,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          constraints:
                                          const BoxConstraints(
                                            minHeight: 60,
                                            minWidth: 60,
                                            maxHeight: 70,
                                            maxWidth: 70,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 0),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5,
                                                  offset: Offset(1, 1)),
                                            ],
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(dashboardDetails!.data!.menus![index].iconImage.toString() )),
                                            // image: AssetImage(
                                            //     'assets/images/img.jpeg')),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            dashboardDetails!.data!
                                                .menus![index].menuTitle
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF2a52be),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18))),
                              width: 100,
                              height: 140,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Receipt',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'This Month',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '₹ ' +
                                        dashboardDetails!
                                            .data!.totalReciept
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReceiptList(
                                                    widget.token, '5')),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(18))),
                                      width: 70,
                                      height: 20,
                                      child:
                                      Center(child: Text('View All')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF2a52be),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18))),
                              width: 100,
                              height: 140,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Expense',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'This Month',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '₹ ' +
                                        dashboardDetails!
                                            .data!.totalExpense
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ExpenseList(
                                                    widget.token, '5')),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(18))),
                                      width: 70,
                                      height: 20,
                                      child:
                                      Center(child: Text('View All')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF2a52be),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(18))),
                              width: 100,
                              height: 140,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Pending ',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Expense',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'This Month',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '₹ ' +
                                        dashboardDetails!
                                            .data!.totalPendingExpense
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PendingExpense(
                                                    widget.token)),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(18))),
                                      width: 70,
                                      height: 20,
                                      child:
                                      Center(child: Text('view All')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DebitCredit(widget.token,dashboardDetails!.data!.accountId)),
                          );
                        },
                        child: Container(
                          width: 400,
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white, width: 0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(1, 1)),
                              ],
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10))),
                          child: Row(
                            children: [
                              Image.asset("assets/images/graph.png",
                                  width: 40),
                              SizedBox(
                                width: 2,
                              ),
                              Row(
                                children: [
                                  Text(' My Accounts ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                                  Text(dashboardDetails!.data!.account.toString(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: dashboardDetails!.data!.isCredit==true?Colors.red:Colors.green)),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListTask(widget.token,dashboardDetails!.data!.loginUserId,false)),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18))),
                                width: 105,
                                height: 90,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'My Task',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,fontWeight: FontWeight.bold),
                                    ),


                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 20
                                        ),
                                        Icon(
                                          Icons.task,
                                          color: Colors.green,
                                          size: 25,
                                        ),
                                        SizedBox(
                                            width: 10
                                        ),
                                        Text(

                                          dashboardDetails!
                                              .data!.myTasks
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListTask(widget.token,dashboardDetails!.data!.loginUserId,true)),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18))),
                                width: 105,
                                height: 90,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [

                                    Text(
                                      'Pending Task',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height: 5
                                    ),


                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 20
                                        ),
                                        Icon(
                                          Icons.lock_clock,
                                          color: Colors.orange,
                                          size: 25,
                                        ),
                                        SizedBox(
                                            width: 10
                                        ),
                                        Text(
                                          dashboardDetails!
                                              .data!.pendingAssignedTask
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTask(widget.token,dashboardDetails!.data!.loginUserId)),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18))),
                                width: 105,
                                height: 90,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Icon(
                                      Icons.add,
                                      color: Colors.purple,
                                      size: 50,
                                    ),


                                    SizedBox(
                                      height: 10,
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Work Reports',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),

                            Container(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: DateTimePicker(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  initialValue: fromdate,

                                  // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                                  type: DateTimePickerType.date,
                                  //icon: Icon(Icons.calendar_today),
                                  //dateHintText: 'From Date',
                                  //controller: fromDate,
                                  firstDate: DateTime(1995),
                                  lastDate: DateTime.now()
                                      .add(Duration(days: 365)),
                                  // This will add one year from current date
                                  validator: (value) {
                                    return null;
                                  },
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        fromdate = value;
                                        status = true;
                                        Common.showProgressDialog(
                                            context, "Loading..");
                                        getData(status, fromdate);
                                      });
                                    }
                                  },
                                  // We can also use onSaved
                                  onSaved: (value) {
                                    if (value!.isNotEmpty) {
                                      fromdate = value;
                                    }
                                  },
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 10, left: 10),
                            //   child: Container(
                            //     height:
                            //         MediaQuery.of(context).size.height *
                            //             0.045,
                            //     width: MediaQuery.of(context).size.width *
                            //         0.3,
                            //     decoration: BoxDecoration(
                            //       color: Colors.grey,
                            //       borderRadius: BorderRadius.circular(16),
                            //     ),
                            //     child: FlatButton(
                            //       onPressed: () async {
                            //         status = true;
                            //         Common.showProgressDialog(
                            //             context, "Loading..");
                            //         getData(status, fromdate);
                            //       },
                            //       child: Text(
                            //         'Search',
                            //         style: TextStyle(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 15),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                          dashboardDetails!.data!.staff!.length,
                          itemBuilder:
                              (context, index) => Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets
                                        .symmetric(
                                        horizontal: 12,
                                        vertical: 8),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                          NetworkImage(
                                            dashboardDetails!
                                                .data!
                                                .staff![index]
                                                .staffImage
                                                .toString(),
                                          ),
                                          radius: 25,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                            dashboardDetails!
                                                .data!
                                                .staff![index]
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
                                            )),
                                      ],
                                    )),
                                dashboardDetails!
                                    .data!
                                    .staff![index]
                                    .active ==
                                    true
                                    ? SizedBox(
                                    height: 170,
                                    child: ListView.builder(
                                        itemBuilder: (_,
                                            int childIndex) {
                                          return Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                                left: 3),
                                            child: Container(
                                              height: 150,
                                              width: 300,
                                              child: Card(
                                                //color: Color.fromARGB(70, 22, 44, 33),
                                                child:
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      top: 20,
                                                      left:
                                                      20),
                                                  child:
                                                  GestureDetector(
                                                    onTap:
                                                        () {
                                                      Navigator
                                                          .push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => WorkDetails(widget.token, dashboardDetails!.data!.staff![index].staffUserId.toString(), dashboardDetails!.data!.staff![index].timeline![childIndex].activityId.toString())),
                                                      );
                                                    },
                                                    child:
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(bottom: 16),
                                                      child:
                                                      Container(
                                                        color:
                                                        Colors.transparent,
                                                        height:
                                                        100,
                                                        width:
                                                        MediaQuery.of(context).size.width - 32,
                                                        child:
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.stretch,
                                                          children: [
                                                            Flexible(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Project: ' + dashboardDetails!.data!.staff![index].timeline![childIndex].project.toString(),
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Module :' + dashboardDetails!.data!.staff![index].timeline![childIndex].activity.toString(),
                                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Sub Module :' + dashboardDetails!.data!.staff![index].timeline![childIndex].subTask.toString(),
                                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      'Remarks : ' + dashboardDetails!.data!.staff![index].timeline![childIndex].remarks.toString(),
                                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      dashboardDetails!.data!.staff![index].timeline![childIndex].timeString.toString(),
                                                                      overflow: TextOverflow.ellipsis,
                                                                      maxLines: 1,
                                                                      style: TextStyle(color: dashboardDetails!.data!.staff![index].timeline![childIndex].isActive.toString() == 'N' ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Container(
                                                                      width: 100,
                                                                      decoration: dashboardDetails!.data!.staff![index].timeline![childIndex].status.toString() == 'Ongoing'
                                                                          ? BoxDecoration(
                                                                        color: Colors.red,
                                                                        borderRadius: BorderRadius.circular(5),
                                                                      )
                                                                          : BoxDecoration(
                                                                        color: Colors.green,
                                                                        borderRadius: BorderRadius.circular(5),
                                                                      ),
                                                                      child: Center(
                                                                        child: Text(
                                                                          dashboardDetails!.data!.staff![index].timeline![childIndex].status.toString(),
                                                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                          overflow: TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount:
                                        dashboardDetails!
                                            .data!
                                            .staff![index]
                                            .timeline!
                                            .length,
                                        scrollDirection:
                                        Axis.horizontal,
                                        shrinkWrap: true,
                                        padding: EdgeInsets
                                            .symmetric(
                                            horizontal:
                                            10)))
                                    : SizedBox(
                                  height: 60,
                                  child: Center(
                                      child: Text(
                                        'Didnt Start Work Till Yet..',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                )
                              ]),
                          separatorBuilder: (_, __) =>
                              SizedBox(height: 0))

                    ],
                  ),
                ),
              ),
            )
          : AlertDialog(
              content: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Flexible(
                      flex: 8,
                      child: Text(
                        'Wait..',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
      floatingActionButton: Container(
        height: 60.0,
        width: 60.0,
        child: FloatingActionButton(

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuickAdd(widget.token)),
            );
          },
          backgroundColor: const Color(0xFF2a52be),
          child: const Icon(Icons.add_box_outlined,size: 35,),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home),
      //           label: 'Home',
      //           backgroundColor: Colors.blueAccent),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.search),
      //           label: 'Projects',
      //           backgroundColor: Colors.blueAccent),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.person),
      //           label: 'Accounts',
      //           backgroundColor: Colors.blueAccent),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.person),
      //           label: 'Me',
      //           backgroundColor: Colors.blueAccent),
      //     ],
      //     type: BottomNavigationBarType.shifting,
      //     currentIndex: _selectedIndex,
      //     selectedItemColor: Colors.black,
      //     iconSize: 20,
      //     onTap: _onItemTapped,
      //     elevation: 5),
    );
  }

  void _dialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Logout?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Common.saveSharedPref("Logout", "success");
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }
}
