import 'package:crm_admin/httpService.dart';
import 'package:crm_admin/projectEdit.dart';
import 'package:crm_admin/projectList.dart';
import 'package:crm_admin/workDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'addNewMileStone.dart';
import 'addNewProjectDescription.dart';
import 'addWork.dart';
import 'common.dart';
import 'models/deleteDescriptionModel.dart';
import 'models/deleteMileStoneModel.dart';
import 'models/deleteProjectModel.dart';
import 'models/editDescriptionModel.dart';
import 'models/editMileStoneModel.dart';
import 'models/mileStoneStatusUpdateModel.dart';
import 'models/projectDetailsModel.dart';
import 'models/reorderMileStoneModel.dart';

class ProjectDetails extends StatefulWidget {
  String? projectId;
  String? token;
  int? selectedIndex;

  ProjectDetails(this.projectId, this.token, this.selectedIndex);

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  TextEditingController remarks = new TextEditingController();
  ProjectDetailsModel? projectDetails;
  TextEditingController mileStoneText = new TextEditingController();
  TextEditingController descriptionText = new TextEditingController();
  bool reorderStatus = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    projectDetails =
        await HttpService.projectDetails(widget.projectId, widget.token);
    if (projectDetails != null) {
      setState(() {});
    }
  }

  reorderData(int oldindex, int newindex) {
    setState(() {
      reorderStatus = true;
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = projectDetails!.data!.mileStones!.removeAt(oldindex);
      projectDetails!.data!.mileStones!.insert(newindex, items);
    });
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
                  ProjectList(widget.token, widget.selectedIndex)),
        );
        return true;
      },
      child: Scaffold(
        body: projectDetails != null
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProjectList(
                                            widget.token,
                                            widget.selectedIndex)),
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
                                "Project Details",
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
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.only(top: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 4,
                                    blurRadius: 6,
                                    offset: const Offset(1, 1),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 200,
                                          child: Text(
                                            projectDetails!.data!.clientName
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          projectDetails!.data!.status
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: projectDetails!
                                                          .data!.status
                                                          .toString() ==
                                                      'Completed'
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                        projectDetails!.data!.projectName
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        Container(
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
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      projectDetails!
                                                          .data!.typeImage
                                                          .toString())),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(18))),
                                          width: 70,
                                          height: 70,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                  projectDetails!
                                                          .data!.createdBy
                                                          .toString() +
                                                      ' on ' +
                                                      projectDetails!
                                                          .data!.createdDate
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                            ),
                                            projectDetails!.data!.assignments!
                                                        .length >
                                                    0
                                                ? SizedBox(
                                                    height: 80,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        shrinkWrap: true,
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5,
                                                                vertical: 15),
                                                        itemCount:
                                                            projectDetails!
                                                                .data!
                                                                .assignments!
                                                                .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int childIndex) {
                                                          return GestureDetector(
                                                            onTap: () async {},
                                                            child: Container(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                maxHeight: 50,
                                                              ),
                                                              child: Container(
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
                                                                        offset: Offset(
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
                                                                      image: NetworkImage(projectDetails!
                                                                          .data!
                                                                          .assignments![
                                                                              childIndex]
                                                                          .staffImage
                                                                          .toString())),
                                                                  // image: AssetImage(
                                                                  //     'assets/images/img.jpeg')),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  )
                                                : SizedBox(
                                                    height: 80,
                                                    child: Container(
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
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle,
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'assets/images/avathar.jpg')),
                                                              // image: AssetImage(
                                                              //     'assets/images/img.jpeg')),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Not Assigned',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                            Text(
                                                'Working Staff : ' +
                                                    projectDetails!.data!
                                                        .assignments!.length
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 2),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 4,
                                          blurRadius: 6,
                                          offset: const Offset(1, 1),
                                        ),
                                      ],
                                      color: const Color(0xffE7E3D0),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.task,
                                                color: Colors.grey, size: 20),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              projectDetails!.data!.taskCount
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(Icons.comment,
                                                color: Colors.grey, size: 20),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              projectDetails!
                                                  .data!.documentCount
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ProjectEdit(
                                                              widget.token,
                                                              projectDetails!
                                                                  .data!
                                                                  .projectId
                                                                  .toString(),
                                                              projectDetails!
                                                                  .data!
                                                                  .clientId
                                                                  .toString(),
                                                              projectDetails!
                                                                  .data!
                                                                  .projectName
                                                                  .toString(),
                                                              projectDetails!
                                                                  .data!
                                                                  .projectTypeId
                                                                  .toString(),
                                                              projectDetails!
                                                                  .data!
                                                                  .statusId
                                                                  .toString(),
                                                              projectDetails!
                                                                  .data!
                                                                  .projectCost
                                                                  .toString(),
                                                              projectDetails!
                                                                  .data!.remarks
                                                                  .toString())),
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                    size: 20,
                                                  )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                  onTap: () => _dialogue(
                                                      context,
                                                      projectDetails!
                                                          .data!.projectId
                                                          .toString()),
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 20,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.monetization_on,
                                                color: Colors.orange, size: 20),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            projectDetails!.data!.balanceAmount
                                                        .toString() ==
                                                    '0'
                                                ? Text(
                                                    'Completed',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green),
                                                  )
                                                : Text(
                                                    'Due: ' +
                                                        projectDetails!
                                                            .data!.balanceAmount
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red),
                                                  ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              projectDetails!.data!.projectCost
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Amount',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              projectDetails!.data!.amountPaid
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Amount Paid',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: InkWell(
                                      onTap: () async {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              projectDetails!
                                                  .data!.balanceAmount
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Balance',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 20),
                                        child: Text(
                                          "Project Descriptions",
                                          style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, right: 20),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddNewProjectDescription(
                                                          widget.projectId,
                                                          widget.token,
                                                          widget
                                                              .selectedIndex)),
                                            );
                                          },
                                          child: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 30, right: 20),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.center,
                                  //     children: [
                                  //       Expanded(
                                  //         flex: 1,
                                  //         child: Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             label('Start Date'),
                                  //             info(
                                  //               projectDetails!.data!.estStart
                                  //                   .toString(),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Expanded(
                                  //         flex: 1,
                                  //         child: Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             label(
                                  //               'End date',
                                  //             ),
                                  //             info(projectDetails!.data!.estEnd
                                  //                 .toString()),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Expanded(
                                  //         flex: 1,
                                  //         child: Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             label('Time Left'),
                                  //             info(projectDetails!
                                  //                 .data!.timeLeft
                                  //                 .toString()),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  projectDetails!.data!.descriptions!.length > 0
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Table(
                                              columnWidths: {
                                                0: FlexColumnWidth(4),
                                                1: FlexColumnWidth(10),
                                                2: FlexColumnWidth(5),
                                              },
                                              border: TableBorder.all(
                                                  color: Colors.black38,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                              children: [
                                                TableRow(
                                                    decoration:
                                                        new BoxDecoration(
                                                            color: Colors
                                                                .greenAccent),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                bottom: 10),
                                                        child: Center(
                                                            child: Text(
                                                          "No",
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                bottom: 10),
                                                        child: Center(
                                                            child: Text(
                                                          'Description',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                bottom: 10),
                                                        child: Center(
                                                            child: Text(
                                                          'Action',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                    ]),
                                                for (int i = 0;
                                                    i <
                                                        projectDetails!
                                                            .data!
                                                            .descriptions!
                                                            .length;
                                                    i++)
                                                  TableRow(children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7,
                                                              bottom: 7),
                                                      child: Center(
                                                          child: Text(
                                                        projectDetails!
                                                            .data!
                                                            .descriptions![i]
                                                            .slNo
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7,
                                                              bottom: 7,
                                                              left: 5),
                                                      child: Text(
                                                        projectDetails!
                                                            .data!
                                                            .descriptions![i]
                                                            .description
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7,
                                                              bottom: 7,
                                                              left: 5),
                                                      child: Row(
                                                        children: [
                                                          InkWell(
                                                              onTap: () => descriptionEdit(
                                                                  context,
                                                                  projectDetails!
                                                                      .data!
                                                                      .descriptions![
                                                                          i]
                                                                      .descriptionId,
                                                                  projectDetails!
                                                                      .data!
                                                                      .descriptions![
                                                                          i]
                                                                      .description
                                                                      .toString()),
                                                              child: Icon(
                                                                Icons.edit,
                                                                color:
                                                                    Colors.blue,
                                                                size: 20,
                                                              )),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          InkWell(
                                                              onTap: () =>
                                                                  descriptionDelete(
                                                                    context,
                                                                    projectDetails!
                                                                        .data!
                                                                        .descriptions![
                                                                            i]
                                                                        .descriptionId,
                                                                  ),
                                                              child: Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red,
                                                                size: 20,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                              ]),
                                        )
                                      : Text('No Description Found'),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 30),
                                        child: Text(
                                          "Mile Stones",
                                          style: TextStyle(
                                              letterSpacing: 1.0,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, right: 20),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddNewMileStone(
                                                          widget.projectId,
                                                          widget.token,
                                                          widget
                                                              .selectedIndex)),
                                            );
                                          },
                                          child: Icon(
                                            Icons.add_box_outlined,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),

                                  ReorderableListView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: <Widget>[
                                      for (final items
                                          in projectDetails!.data!.mileStones!)
                                        Card(
                                          key: ValueKey(items),
                                          elevation: 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
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
                                                            width: 230,
                                                            child: Text(
                                                                items.milestone
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                          Column(
                                                            children: [
                                                              items.isCompleted ==
                                                                      false
                                                                  ? Container(
                                                                      child:
                                                                          FlutterSwitch(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            20.0,
                                                                        valueFontSize:
                                                                            20.0,
                                                                        toggleSize:
                                                                            20.0,
                                                                        value: items
                                                                            .isCompleted,
                                                                        borderRadius:
                                                                            30.0,
                                                                        inactiveColor:
                                                                            Colors.red,
                                                                        activeColor:
                                                                            Colors.green,
                                                                        onToggle:
                                                                            (val) {
                                                                          setState(
                                                                              () async {
                                                                            //status = val;
                                                                            MileStoneStatusUpdateModel
                                                                                object =
                                                                                await HttpService.mileStoneStatusUpdate(
                                                                              items.milestoneId,
                                                                              widget.token,
                                                                            );
                                                                            if (object.status ==
                                                                                true) {
                                                                              Common.showProgressDialog(context, "Loading..");
                                                                              Common.toastMessaage('Added Successfully', Colors.green);
                                                                              Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(builder: (context) => ProjectDetails(widget.projectId, widget.token, widget.selectedIndex)),
                                                                              );
                                                                            } else {
                                                                              Navigator.pop(context);
                                                                              Common.toastMessaage('Something Went Wrong', Colors.red);
                                                                            }
                                                                          });
                                                                        },
                                                                      ),
                                                                    )
                                                                  : Container(),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                items.isCompleted ==
                                                                        true
                                                                    ? 'Completed'
                                                                    : 'Pending',
                                                                style: TextStyle(
                                                                    color: items.isCompleted ==
                                                                            true
                                                                        ? Colors
                                                                            .green
                                                                        : Colors
                                                                            .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      items.isCompleted == true
                                                          ? Container(
                                                              width: 250,
                                                              child: Text('Completed By ' +
                                                                  items
                                                                      .completedBy
                                                                      .toString() +
                                                                  ' on ' +
                                                                  items
                                                                      .completedDate
                                                                      .toString()),
                                                            )
                                                          : SizedBox(
                                                              height: 1,
                                                            ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                              width: 180,
                                                              child: Text(items
                                                                  .completionRemark
                                                                  .toString())),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                        onTap: () =>
                                                            mileStoneEdit(
                                                                context,
                                                                items
                                                                    .milestoneId,
                                                                items.milestone
                                                                    .toString()),
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: Colors.blue,
                                                          size: 20,
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                        onTap: () =>
                                                            mileStoneDelete(
                                                              context,
                                                              items.milestoneId,
                                                            ),
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                          size: 20,
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                        onTap: () => _addRemark(
                                                            context,
                                                            items.milestoneId,
                                                            items
                                                                .completionRemark
                                                                .toString()),
                                                        child: Text(
                                                          'Add Remark',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .lightBlueAccent),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                    onReorder: reorderData,
                                  ),

                                  // ListView.builder(
                                  //     shrinkWrap: true,
                                  //     physics: NeverScrollableScrollPhysics(),
                                  //     padding: const EdgeInsets.symmetric(
                                  //         horizontal: 12, vertical: 24),
                                  //     itemCount: projectDetails!.data!.mileStones!.length,
                                  //     itemBuilder:
                                  //         (BuildContext context, int index) {
                                  //       return GestureDetector(
                                  //         onTap: () => {
                                  //
                                  //         },
                                  //         child: Container(
                                  //           margin:
                                  //           const EdgeInsets.only(bottom: 10),
                                  //           padding:
                                  //           const EdgeInsets.only(top: 10),
                                  //           decoration: BoxDecoration(
                                  //             borderRadius:
                                  //             BorderRadius.circular(5),
                                  //             color: Colors.white,
                                  //             boxShadow: [
                                  //               BoxShadow(
                                  //                 color: Colors.grey
                                  //                     .withOpacity(0.5),
                                  //                 spreadRadius: 4,
                                  //                 blurRadius: 6,
                                  //                 offset: const Offset(1, 1),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           child: Column(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.start,
                                  //             crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //             children: [
                                  //               Row(
                                  //                 children: [
                                  //                   SizedBox(width: 10,),
                                  //                   CircleAvatar(
                                  //                       backgroundColor:
                                  //                       Colors.grey,
                                  //                       radius: 20,
                                  //                       child: Text(projectDetails!.data!.mileStones![index].sNo.toString())
                                  //                   ),
                                  //                   SizedBox(width: 10,),
                                  //                   Column(
                                  //                     mainAxisAlignment:
                                  //                     MainAxisAlignment.start,
                                  //                     crossAxisAlignment:
                                  //                     CrossAxisAlignment
                                  //                         .start,
                                  //                     children: [
                                  //                       Row(
                                  //                         children: [
                                  //                           Container(
                                  //                             width: 180,
                                  //                             child: Text(
                                  //                                 projectDetails!
                                  //                                     .data!.mileStones![index]
                                  //                                     .milestone
                                  //                                     .toString(),
                                  //                                 style: TextStyle(
                                  //                                     fontSize: 15,
                                  //                                     fontWeight:
                                  //                                     FontWeight
                                  //                                         .bold,
                                  //                                     color: Colors
                                  //                                         .black)),
                                  //                           ),
                                  //                           Column(
                                  //                             children: [
                                  //                               projectDetails!.data!.mileStones![index].isCompleted==false ?
                                  //                               Container(
                                  //                                 child: FlutterSwitch(
                                  //                                   width: 50.0,
                                  //                                   height: 25.0,
                                  //                                   valueFontSize: 20.0,
                                  //                                   toggleSize: 20.0,
                                  //                                   value: projectDetails!.data!.mileStones![index].isCompleted,
                                  //                                   borderRadius: 30.0,
                                  //                                   inactiveColor:Colors.red,
                                  //                                   activeColor: Colors.green,
                                  //                                   onToggle: (val) {
                                  //                                     setState(() async {
                                  //                                       //status = val;
                                  //                                       MileStoneStatusUpdateModel object =
                                  //                                       await HttpService.mileStoneStatusUpdate(projectDetails!.data!.mileStones![index].milestoneId,
                                  //                                         widget.token,);
                                  //                                       if (object.status == true) {
                                  //                                         Common.showProgressDialog(context, "Loading..");
                                  //                                         Common.toastMessaage('Added Successfully', Colors.green);
                                  //                                         Navigator.push(
                                  //                                           context,
                                  //                                           MaterialPageRoute(
                                  //                                               builder: (context) =>
                                  //                                                   ProjectDetails(widget.projectId,widget.token,widget.selectedIndex)),
                                  //                                         );
                                  //                                       } else {
                                  //                                         Navigator.pop(context);
                                  //                                         Common.toastMessaage('Something Went Wrong', Colors.red);
                                  //                                       }
                                  //
                                  //                                     });
                                  //                                   },
                                  //                                 ),
                                  //                               ):Container(),
                                  //                               SizedBox(height: 5,),
                                  //                               Text(projectDetails!.data!.mileStones![index].isCompleted==true?'Completed':'Pending',
                                  //                                 style: TextStyle(color: projectDetails!.data!.mileStones![index].isCompleted==true?
                                  //                                 Colors.green:Colors.red,fontWeight: FontWeight.bold),),
                                  //                               SizedBox(height: 5,),
                                  //
                                  //                             ],
                                  //                           ),
                                  //
                                  //                         ],
                                  //
                                  //                       ),
                                  //                       SizedBox(height: 5,),
                                  //                       projectDetails!.data!.mileStones![index].isCompleted==true?
                                  //                       Container(
                                  //                         width:180,
                                  //                         child: Text('Completed By '+projectDetails!.data!.mileStones![index].completedBy.toString()
                                  //                             +' on '+projectDetails!.data!.mileStones![index].completedDate.toString()),
                                  //                       ):Container(),
                                  //                       SizedBox(height: 5,),
                                  //                       Row(
                                  //                         children: [
                                  //                           Container(
                                  //                               width:180,child: Text(projectDetails!.data!.mileStones![index].completionRemark.toString())),
                                  //                           InkWell(
                                  //                               onTap: ()=>_addRemark(
                                  //                                   context,projectDetails!.data!.mileStones![index].milestoneId,projectDetails!.data!.mileStones![index].completionRemark.toString())
                                  //                               ,
                                  //                               child: Text('Add Remark',style: TextStyle(fontSize: 12,color: Colors.lightBlueAccent),))
                                  //                         ],
                                  //                       )
                                  //
                                  //
                                  //
                                  //
                                  //                     ],
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //
                                  //               Padding(
                                  //                 padding: const EdgeInsets.only(left: 20),
                                  //                 child: Row(
                                  //                   mainAxisAlignment: MainAxisAlignment.start,
                                  //
                                  //                   children: [
                                  //                     InkWell(
                                  //                         onTap: ()=>mileStoneEdit(context,projectDetails!.data!.mileStones![index].milestoneId,projectDetails!.data!.mileStones![index].milestone.toString()),
                                  //
                                  //                         child: Icon(Icons.edit, color: Colors.blue,size: 20,)),
                                  //                     SizedBox(width: 10,),
                                  //                     InkWell(
                                  //                         onTap: ()=>mileStoneDelete(context,projectDetails!.data!.projectId.toString()),
                                  //
                                  //
                                  //                         child: Icon(Icons.delete, color: Colors.red,size: 20,)),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: 10,
                                  //               ),
                                  //
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       );
                                  //     }),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Work Assignments",
                                      style: TextStyle(
                                          letterSpacing: 1.0,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return new Stack(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          WorkDetails(
                                                              widget.token,
                                                              projectDetails!
                                                                  .data!
                                                                  .assignments![
                                                                      index]
                                                                  .staffUserId,
                                                              projectDetails!
                                                                  .data!
                                                                  .assignments![
                                                                      index]
                                                                  .activityId
                                                                  .toString())),
                                                );
                                              },
                                              child: new Card(
                                                margin:
                                                    new EdgeInsets.all(20.0),
                                                child: new Container(
                                                  width: double.infinity,
                                                  height: 150.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 4,
                                                        blurRadius: 6,
                                                        offset:
                                                            const Offset(1, 1),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 10),
                                                      Expanded(
                                                          child: Text(
                                                              projectDetails!
                                                                  .data!
                                                                  .assignments![
                                                                      index]
                                                                  .staffName
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ))),
                                                      Expanded(
                                                        child: Text(
                                                          'Activity: ' +
                                                              projectDetails!
                                                                  .data!
                                                                  .assignments![
                                                                      index]
                                                                  .activity
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Estimate Time: ' +
                                                              projectDetails!
                                                                  .data!
                                                                  .assignments![
                                                                      index]
                                                                  .estimatedTime
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Completed Time: ' +
                                                              projectDetails!
                                                                  .data!
                                                                  .assignments![
                                                                      index]
                                                                  .completedTime
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          'Time Varience: ' +
                                                              projectDetails!
                                                                  .data!
                                                                  .assignments![
                                                                      index]
                                                                  .timeVarience
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          new Positioned(
                                            top: 0.0,
                                            bottom: 0.0,
                                            left: 35.0,
                                            child: new Container(
                                              height: double.infinity,
                                              width: 1.0,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          new Positioned(
                                            top: 30.0,
                                            left: 15.0,
                                            child: new Container(
                                              height: 60.0,
                                              width: 60.0,
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    projectDetails!
                                                        .data!
                                                        .assignments![index]
                                                        .staffImage
                                                        .toString()),
                                                radius: 20,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    itemCount: projectDetails!
                                        .data!.assignments!.length,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
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
        floatingActionButton: reorderStatus == true
            ? Container(
                height: 60.0,
                width: 60.0,
                child: FloatingActionButton(
                  onPressed: () async {
                    Map<String, dynamic> body = {
                      "token": widget.token,
                      "mileStoneIds": projectDetails!.data!.mileStones!
                          .map((e) => e.milestoneId)
                          .toList(),
                    };
                    //print(body);
                    Common.showProgressDialog(context, "Loading..");

                    ReorderMileStoneModel object1 =
                        await HttpService.reorderMileStone(body);

                    if (object1.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                                widget.projectId,
                                widget.token,
                                widget.selectedIndex)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage('Something Went Wrong', Colors.red);
                    }
                  },
                  backgroundColor: const Color(0xFF2a52be),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.check),
                    ],
                  ),
                ),
              )
            : Container(
                height: 60.0,
                width: 60.0,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddWork(widget.token, widget.projectId)),
                    );
                  },
                  backgroundColor: const Color(0xFF2a52be),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_box_rounded),
                      Text(
                        'Work',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void _dialogue(BuildContext context, clientId) {
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
                    DeleteProjectModel object =
                        await HttpService.deleteProject(clientId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Delete Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectList(
                                widget.token, widget.selectedIndex)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage(object.message, Colors.red);
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

  void _addRemark(BuildContext context, mileStoneId, remark) {
    remarks.text = remark;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              'Add Remark',
              style: TextStyle(fontSize: 15),
            ),
            content: Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                    MileStoneStatusUpdateModel object =
                        await HttpService.mileStoneRemarkUpdate(
                            mileStoneId, widget.token, remarks.text);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                                widget.projectId,
                                widget.token,
                                widget.selectedIndex)),
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
                          builder: (context) => ProjectDetails(widget.projectId,
                              widget.token, widget.selectedIndex)),
                    );
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  void mileStoneEdit(BuildContext context, mileStoneId, mileStone) {
    mileStoneText.text = mileStone;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              'Edit Mile Stone',
              style: TextStyle(fontSize: 15),
            ),
            content: Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                            maxLines: 2,
                            controller: mileStoneText,
                            decoration: InputDecoration(
                              hintText: 'Mile Stone',
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
                    EditMileStoneModel object = await HttpService.editMileStone(
                        mileStoneId, widget.token, mileStoneText.text);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                                widget.projectId,
                                widget.token,
                                widget.selectedIndex)),
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
                          builder: (context) => ProjectDetails(widget.projectId,
                              widget.token, widget.selectedIndex)),
                    );
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  void mileStoneDelete(BuildContext context, mileStoneId) {
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
                    DeleteMileStoneModel object =
                        await HttpService.deleteMileStone(
                            mileStoneId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Delete Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                                widget.projectId,
                                widget.token,
                                widget.selectedIndex)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage(object.message, Colors.red);
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

  void descriptionEdit(BuildContext context, descriptionId, description) {
    descriptionText.text = description;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
              'Edit Description',
              style: TextStyle(fontSize: 15),
            ),
            content: Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                            maxLines: 2,
                            controller: descriptionText,
                            decoration: InputDecoration(
                              hintText: 'Description',
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
                    EditDescriptionModel object1 =
                        await HttpService.editDescription(
                            descriptionId, widget.token, descriptionText.text);
                    if (object1.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                                widget.projectId,
                                widget.token,
                                widget.selectedIndex)),
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
                          builder: (context) => ProjectDetails(widget.projectId,
                              widget.token, widget.selectedIndex)),
                    );
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  void descriptionDelete(BuildContext context, descriptionId) {
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
                    DeleteDescriptionModel object =
                        await HttpService.deleteDescription(
                            descriptionId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Delete Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                                widget.projectId,
                                widget.token,
                                widget.selectedIndex)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage(object.message, Colors.red);
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
