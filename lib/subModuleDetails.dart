import 'package:flutter/material.dart';

import 'httpService.dart';
import 'models/subModuleDetailModel.dart';
import 'workDetails.dart';

class SubModuleDetails extends StatefulWidget {
  String? token;
  String? staffId;
  String? activityId;
  String? subModuleId;

  SubModuleDetails(this.token, this.staffId, this.activityId, this.subModuleId);

  @override
  _SubModuleDetailsState createState() => _SubModuleDetailsState();
}

class _SubModuleDetailsState extends State<SubModuleDetails> {
  SubModuleDetailsModel? subModuleDetails;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    subModuleDetails = await HttpService.subModuleDetails(
        widget.activityId, widget.subModuleId, widget.token);
    if (subModuleDetails != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: subModuleDetails != null
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
                                      builder: (context) => WorkDetails(
                                          widget.token,
                                          widget.staffId,
                                          widget.activityId)),
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
                              "Sub Module Details",
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
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.only(top: 0),
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
                                    //SizedBox(height: 15,),
                                    Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 0),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(1, 1)),
                                          ],
                                          color: subModuleDetails!
                                                      .data!.statusName
                                                      .toString() ==
                                                  'Completed'
                                              ? Colors.green
                                              : Colors.red,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                            subModuleDetails!.data!.statusName
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                                subModuleDetails!
                                                    .data!.subTask
                                                    .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: double.infinity,
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          child: Center(
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                '',
                                              ),
                                              radius: 25,
                                            ),
                                          )),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Center(
                                        child: Text('Staff Name',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: Center(
                                              child: Text(
                                                  subModuleDetails!
                                                      .data!.clientName
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: Center(
                                              child: Text(
                                                  subModuleDetails!
                                                      .data!.projectName
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                            'Module : ' +
                                                subModuleDetails!
                                                    .data!.activity
                                                    .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 140,
                                          height: 60,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0),
                                              color: const Color(0xffCCE698),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Column(
                                            children: [
                                              Text('Estimated Time ',
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.punch_clock,
                                                      color: Colors.grey,
                                                      size: 20),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                      subModuleDetails!
                                                          .data!.estimatedTime
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          height: 60,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0),
                                              color: const Color(0xffCCE698),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('Completed Time ',
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.punch_clock,
                                                      color: Colors.grey,
                                                      size: 20),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                      subModuleDetails!
                                                          .data!.completedTime
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE7E3D0),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text('Created Date : ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  color: Colors.deepOrange))),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return new Stack(
                              children: <Widget>[
                                new Padding(
                                  padding:
                                  const EdgeInsets.only(left: 50.0),
                                  child: new Card(
                                    margin: new EdgeInsets.all(20.0),
                                    child: new Container(
                                      width: double.infinity,
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
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 40),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(''),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 20),
                                                  child: Text(
                                                      subModuleDetails!
                                                          .data!
                                                          .subModuleDetails![index]
                                                          .status
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color:
                                                          subModuleDetails!
                                                              .data!
                                                              .subModuleDetails![index]
                                                              .status=='Completed'?Colors.green:Colors.red),
                                                      textAlign:
                                                      TextAlign.right),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Time : ' +
                                                  subModuleDetails!
                                                      .data!
                                                      .subModuleDetails![
                                                  index]
                                                      .fromTime.toString()+'-'+subModuleDetails!
                                                  .data!
                                                  .subModuleDetails![
                                              index]
                                                  .toTime.toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              'Remark: ' +
                                                  subModuleDetails!
                                                      .data!
                                                      .subModuleDetails![index]
                                                      .remarks
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              'Date: ' +
                                                  subModuleDetails!
                                                      .data!
                                                      .subModuleDetails![index]
                                                      .date
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),


                                            SizedBox(height: 10),
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
                                    height: 30.0,
                                    width: 80.0,
                                    decoration: new BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                            offset: Offset(1, 1)),
                                      ],
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: Text(
                                          subModuleDetails!
                                              .data!
                                              .subModuleDetails![
                                          index]
                                              .completedTime
                                              .toString(),style: TextStyle(fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                )
                              ],
                            );
                          },
                          itemCount:
                          subModuleDetails!
                              .data!.subModuleDetails!.length,
                        ),
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
    );
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
