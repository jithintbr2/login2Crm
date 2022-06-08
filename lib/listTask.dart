import 'package:flutter/material.dart';

import 'addTask.dart';
import 'common.dart';
import 'dashboard.dart';
import 'editEnquiry.dart';
import 'editTask.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'models/deleteTaskModel.dart';
import 'models/taskInfoModel.dart';
import 'models/taskListModel.dart';
import 'taskDetails.dart';

class ListTask extends StatefulWidget {
  String? token;
  String? userId;
  bool? allStatus;

  ListTask(this.token, this.userId,this.allStatus);

  @override
  _ListTaskState createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  String? selectIndex = 'All';

  ListTaskModel? taskList;
  TaskInfoModel? taskInfo;
  TextEditingController search = new TextEditingController();
  var staff;
  bool? searchSts = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    staff = widget.userId;
    getData(widget.token, staff, 'All',widget.allStatus);
    //tabController = TabController(length: 2, vsync: this);
  }

  getData(token, staffId, status,allStatus) async {
    taskInfo = await HttpService.taskInfo(token, staff);
    if (taskInfo != null) {
      taskList = await HttpService.listTasks(token, staffId, status,allStatus);
      if (searchSts == true) {
        Navigator.pop(context);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage(widget.token, 0)),
            (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(
        body: taskList != null
            ? Container(
                width: double.infinity,
                height: size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset("assets/images/top1.png",
                          width: size.width),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset("assets/images/top2.png",
                          width: size.width),
                    ),
                    SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(widget.token, 0)),
                                        (Route<dynamic> route) => false);
                                  },
                                  child: Image.asset(
                                      "assets/images/back_button.jpg",
                                      width: 40),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "Task List",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      letterSpacing: 1,
                                      fontFamily: "Lobster"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            top(),
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  itemCount: taskInfo!.data!.status!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () async {
                                        searchSts = true;
                                        Common.showProgressDialog(
                                            context, "Loading..");
                                        getData(
                                            widget.token,
                                            staff,
                                            taskInfo!
                                                .data!.status![index].status,false);
                                        setState(() {
                                          selectIndex = taskInfo!
                                              .data!.status![index].status;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Container(
                                          width: 130,
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
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
                                              color: selectIndex ==
                                                      taskInfo!.data!
                                                          .status![index].status
                                                  ? Colors.lightBlueAccent
                                                  : Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  taskInfo!.data!.status![index]
                                                      .status
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),

                                                CircleAvatar(
                                                  backgroundColor: Colors.green,
                                                  radius: 12,
                                                  child: Text(
                                                    taskInfo!.data!
                                                        .status![index].count
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
                                      ),
                                    );
                                  }),
                            ),
                            taskList!.data!.length > 0
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 24),
                                    itemCount: taskList!.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TaskDetails(
                                                        taskList!
                                                            .data![index].taskId
                                                            .toString(),
                                                        widget.token,widget.userId,widget.allStatus)),
                                          ),
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 12),
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 4,
                                                blurRadius: 6,
                                                offset: const Offset(1, 1),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 100,
                                                    child: Image.asset(
                                                        'assets/images/task.png'),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 220,
                                                        child: Text(
                                                            taskList!
                                                                .data![index]
                                                                .title
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: Text(
                                                            taskList!
                                                                .data![index]
                                                                .dateTime
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .brown)),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxHeight: 50,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                minHeight: 20,
                                                                minWidth: 20,
                                                                maxHeight: 40,
                                                                maxWidth: 40,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      blurRadius:
                                                                          5,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              1)),
                                                                ],
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: NetworkImage(taskList!
                                                                        .data![
                                                                            index]
                                                                        .assignedByImage
                                                                        .toString())),
                                                                // image: AssetImage(
                                                                //     'assets/images/img.jpeg')),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text('To'),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                minHeight: 20,
                                                                minWidth: 20,
                                                                maxHeight: 40,
                                                                maxWidth: 40,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      blurRadius:
                                                                          5,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              1)),
                                                                ],
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: NetworkImage(taskList!
                                                                        .data![
                                                                            index]
                                                                        .assignedstaffImage
                                                                        .toString())),
                                                                // image: AssetImage(
                                                                //     'assets/images/img.jpeg')),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 40,
                                                            ),
                                                            Text(
                                                                taskList!.data![index].status
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: taskList!.data![index].status.toString() ==
                                                                            'completed'
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .red))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 40,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE7E3D0),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => EditTask(widget.token,widget.userId,taskList!
                                                                        .data![index]
                                                                        .taskId
                                                                        .toString(),widget.allStatus)),
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.edit,
                                                              color: Colors.blue,
                                                              size: 20,
                                                            )),
                                                        SizedBox(width: 10,),
                                                        InkWell(
                                                            onTap: () => _dialogue(
                                                                context,
                                                                taskList!
                                                                    .data![index]
                                                                    .taskId
                                                                    .toString()),
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                              size: 20,
                                                            )),
                                                      ],
                                                    ),
                                                    Text(
                                                      taskList!
                                                          .data![index].completedSubTask
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors
                                                              .green),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      child: Text(
                                                        taskList!
                                                            .data![index].project
                                                            .toString(),
                                                        style: TextStyle(

                                                            fontSize: 15,
                                                            color: Colors
                                                                .deepOrange),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 200,
                                        child: Image.asset(
                                            'assets/images/task.png'),
                                      ),
                                      Text(
                                        'No Task Found',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      )
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
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
                    builder: (context) => AddTask(widget.token, widget.userId)),
              );
            },
            backgroundColor: const Color(0xFF2a52be),
            child: const Icon(Icons.add_box_outlined,size: 35,),
          ),
        ),
      ),
    );
  }

  top() {
    return Row(
      children: [
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(1, 1)),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Staff'),
                  ),
                  value: staff,
                  items: taskInfo!.data!.staffList!.map((data) {
                    return DropdownMenuItem(
                      value: data.userId.toString(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(data.staffName.toString()),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      staff = newValue;
                    });
                    print(staff);
                  },
                ),
              ),
            );
          },
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: Color(0xffE7E3D0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: FlatButton(
            onPressed: () async {
              selectIndex = 'All';
              searchSts = true;
              Common.showProgressDialog(context, "Loading..");
              getData(widget.token, staff, 'All',false);
            },
            child: Text(
              'Search',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  void _dialogue(BuildContext context, taskId) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Delete?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    // print('task id :'+taskId);

                    DeleteTaskModel object =
                        await HttpService.deleteTask(taskId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ListTask(widget.token, widget.userId,widget.allStatus)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage('Something Went Wrong', Colors.red);
                    }
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

Widget label(String labelName, {Color color = const Color(0xff757575)}) {
  return Text(
    labelName,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget info(String infoText, {Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Text(
      infoText,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
