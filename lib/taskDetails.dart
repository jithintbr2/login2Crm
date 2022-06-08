import 'package:crm_admin/editTask.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'listTask.dart';
import 'models/deleteTaskModel.dart';
import 'models/descriptionStatusUpdateModel.dart';
import 'models/taskDetailsModel.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'models/updateAllInTaskModel.dart';

class TaskDetails extends StatefulWidget {
  String? taskId;
  String? token;
  String? userId;
  bool? allStatus;
  TaskDetails(this.taskId, this.token,this.userId,this.allStatus);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  TaskDetailsModel? taskDetails;
  TextEditingController remarks = new TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    taskDetails = await HttpService.taskDetails(widget.token, widget.taskId);
    if (taskDetails != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ListTask(widget.token,widget.userId,widget.allStatus)),
        );
        return true;
      },
      child: Scaffold(

        body: taskDetails != null
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
                    SingleChildScrollView(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ListTask(widget.token,widget.userId,widget.allStatus)),
                                  );
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
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
                                                taskDetails!
                                                    .data!.title
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
                                                taskDetails!
                                                    .data!.dateTime
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
                                                        image: NetworkImage(taskDetails!
                                                            .data!
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
                                                        image: NetworkImage(taskDetails!
                                                            .data!
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
                                                    taskDetails!.data!.status
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize:
                                                        13,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        color: taskDetails!.data!.status.toString() ==
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
                                                        builder: (context) => EditTask(widget.token,widget.userId,widget.taskId,widget.allStatus)),
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
                                                    widget.taskId),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 20,
                                                )),
                                          ],
                                        ),
                                        // InkWell(
                                        //     onTap: () => _dialogue(
                                        //         context,
                                        //         taskList!
                                        //             .data![index]
                                        //             .taskId
                                        //             .toString()),
                                        //     child: Icon(
                                        //       Icons.delete,
                                        //       color: Colors.red,
                                        //       size: 20,
                                        //     )),
                                        Text(
                                          taskDetails!
                                              .data!.project
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors
                                                  .deepOrange),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 24),
                              itemCount: taskDetails!.data!.descriptions!.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () => {

                                  },
                                  child: Container(
                                    margin:
                                    const EdgeInsets.only(bottom: 10),
                                    padding:
                                    const EdgeInsets.only(top: 10),
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
                                              width: 70,
                                              height: 70,
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
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 190,
                                                      child: Text(
                                                          taskDetails!
                                                              .data!.descriptions![index]
                                                              .descriptions
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              color: Colors
                                                                  .black)),
                                                    ),
                                                    Column(
                                                      children: [
                                                        taskDetails!.data!.descriptions![index].isCompleted==false &&
                                                            taskDetails!.data!.assignUserId==widget.userId?
                                                        Container(
                                                          child: FlutterSwitch(
                                                            width: 50.0,
                                                            height: 25.0,
                                                            valueFontSize: 20.0,
                                                            toggleSize: 20.0,
                                                            value: taskDetails!.data!.descriptions![index].isCompleted,
                                                            borderRadius: 30.0,
                                                            inactiveColor:Colors.red,
                                                            activeColor: Colors.green,
                                                            onToggle: (val) {
                                                              setState(() async {
                                                                 //status = val;
                                                                DescriptionStatusUpdateModel object =
                                                                    await HttpService.descriptionStatusUpdate(taskDetails!.data!.descriptions![index].discriptionId,
                                                                        widget.token,remarks.text);
                                                                if (object.status == true) {
                                                                  Common.showProgressDialog(context, "Loading..");
                                                                  Common.toastMessaage('Added Successfully', Colors.green);
                                                                  Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            TaskDetails(widget.taskId,widget.token,widget.userId,widget.allStatus)),
                                                                  );
                                                                } else {
                                                                  Navigator.pop(context);
                                                                  Common.toastMessaage('Something Went Wrong', Colors.red);
                                                                }

                                                              });
                                                            },
                                                          ),
                                                        ):Container(),
                                                        SizedBox(height: 5,),
                                                        Text(taskDetails!.data!.descriptions![index].status.toString(),
                                                          style: TextStyle(color: taskDetails!.data!.descriptions![index].isCompleted==true?
                                                          Colors.green:Colors.red,fontWeight: FontWeight.bold),),
                                                        SizedBox(height: 5,),

                                                      ],
                                                    ),

                                                  ],

                                                ),
                                                SizedBox(height: 5,),
                                                Row(
                                                  children: [
                                                    Container(
                                                        width:190,child: Text(taskDetails!.data!.descriptions![index].remarks.toString())),
                                                    InkWell(
                                                        onTap: ()=>_changeSubTaskStatus(
                                                            context,taskDetails!.data!.descriptions![index].discriptionId)
                                                        ,
                                                        child: Text('Add Remark',style: TextStyle(fontSize: 12,color: Colors.lightBlueAccent),))
                                                  ],
                                                )




                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              _updateAllTask(
                                  context,
                                  widget.taskId);
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.greenAccent,
                                shadowColor: Colors.blueAccent,
                                elevation: 5,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Colors.greenAccent,
                                    Colors.blueAccent
                                  ]),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                width: 200,
                                height: 50,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Update All',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),


                        ],
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
      ),
    );
  }
  void _changeSubTaskStatus(BuildContext context,descriptionId) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Add Remark',style: TextStyle(fontSize: 15),),
            content: Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 5, offset: Offset(1, 1)),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                            maxLines: 5,
                            controller: remarks,
                            decoration: InputDecoration(
                              hintText: 'Remark',
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                )),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {


                    DescriptionStatusUpdateModel object =
                    await HttpService.descriptionRemarkUpdate(descriptionId, widget.token,remarks.text);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TaskDetails(widget.taskId,widget.token,widget.userId,widget.allStatus)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage('Something Went Wrong', Colors.red);
                    }
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TaskDetails(widget.taskId,widget.token,widget.userId,widget.allStatus)),
                    );
                  },
                  child: Text('No'))
            ],
          );
        });
  }
  void _updateAllTask(BuildContext context, taskId) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Complete?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    // print('task id :'+taskId);
                    Common.showProgressDialog(context, "Loading..");
                    UpdateAllInTaskModel object =
                    await HttpService.completeTask(taskId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Successfully', Colors.green);
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
