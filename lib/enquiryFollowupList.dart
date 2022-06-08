import 'package:crm_admin/editEnquiryFollowup.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'addEnquiryFollowup.dart';
import 'common.dart';
import 'editEnquiry.dart';
import 'enquiryList.dart';
import 'httpService.dart';
import 'models/deleteEnquiryFollowupModel.dart';
import 'models/deleteEnquiryModel.dart';
import 'models/enquiryDetailsModel.dart';

class EnquiryFollowupList extends StatefulWidget {
  String? token;
  String? enquiryId;
  String? userId;

  EnquiryFollowupList(this.token, this.enquiryId,this.userId);

  @override
  _EnquiryFollowupListState createState() => _EnquiryFollowupListState();
}

class _EnquiryFollowupListState extends State<EnquiryFollowupList> {
  EnquiryDetailsModel? enquiryDetails;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.token, widget.enquiryId,false);
  }

  getData(token, enquiryId,status) async {
    enquiryDetails = await HttpService.enquiryDetails(token, enquiryId);
    if (enquiryDetails != null) {
      if (status == true) {
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnquiryList(widget.token,widget.userId)),
        );
        return true;
      },
      child: Scaffold(
        body: enquiryDetails != null
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
                      child: RefreshIndicator(
                        onRefresh: () async {
                          Common.showProgressDialog(context, "Loading..");
                          getData(widget.token,widget.enquiryId,true);
                        },
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
                                            builder: (context) =>
                                                EnquiryList(widget.token,widget.userId)),
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
                                    "Followup List",
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
                                            height: 130.0,
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
                                                            enquiryDetails!
                                                                .data!
                                                                .followUps![index]
                                                                .status
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.red),
                                                            textAlign:
                                                                TextAlign.right),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Expanded(
                                                    child: Text(
                                                      'Remark: ' +
                                                          enquiryDetails!
                                                              .data!
                                                              .followUps![index]
                                                              .followUpRemarks
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Next Followup Date: ' +
                                                          enquiryDetails!
                                                              .data!
                                                              .followUps![index]
                                                              .nextDate
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          child: Row(

                                                            children: [
                                                              InkWell(
                                                                  onTap: (){
                                                                    Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => EditEnquiryFollowup(widget.token,enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .followUpId
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .followUpDateDay
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .followUpDateMonth
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .followUpDateYear
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .nextfollowDay
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .nextfollowMonth
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .nextfollowYear
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .statusId
                                                                              .toString(),enquiryDetails!
                                                                              .data!
                                                                              .followUps![index]
                                                                              .followUpRemarks
                                                                              .toString(),widget.enquiryId,widget.userId)),
                                                                    );
                                                                  },
                                                                  child: Icon(Icons.edit, color: Colors.blue,size: 20,)),
                                                              SizedBox(width: 10,),
                                                              InkWell(
                                                                  onTap: ()=>_dialogueFollowup(context,enquiryDetails!
                                                                      .data!
                                                                      .followUps![index]
                                                                      .followUpId
                                                                      .toString()),



                                                                  child: Icon(Icons.delete, color: Colors.red,size: 20,)),
                                                              SizedBox(width: 10,),

                                                            ],
                                                          ),
                                                        ),
                                                        Container(
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
                                                                    blurRadius: 5,
                                                                    offset:
                                                                        Offset(1,
                                                                            1)),
                                                              ],
                                                              color: Colors.white,
                                                              shape:
                                                                  BoxShape.circle,
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(enquiryDetails!
                                                                      .data!
                                                                      .followUps![
                                                                          index]
                                                                      .userImage
                                                                      .toString())),
                                                              // image: AssetImage(
                                                              //     'assets/images/img.jpeg')),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'on ' +
                                                              enquiryDetails!
                                                                  .data!
                                                                  .followUps![
                                                                      index]
                                                                  .followUpTime
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
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
                                            enquiryDetails!
                                                .data!.followUps![index].followUpDate
                                                .toString(),
                                          )),
                                        ),
                                      )
                                    ],
                                  );
                                },
                                itemCount:
                                    enquiryDetails!.data!.followUps!.length,
                              ),
                              // ListView.builder(
                              //     shrinkWrap: true,
                              //     physics: NeverScrollableScrollPhysics(),
                              //     padding:
                              //     const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                              //     itemCount: enquiryDetails!.data!.followUps!.length,
                              //     itemBuilder: (BuildContext context, int index) {
                              //       return GestureDetector(
                              //         onTap: () => {
                              //           // Navigator.push(
                              //           //   context,
                              //           //   MaterialPageRoute(
                              //           //       builder: (context) => ClientDetails(
                              //           //           clientList!.data!.clientList![index].clientId,
                              //           //           widget.token)),
                              //           // ),
                              //         },
                              //         child: Container(
                              //           margin: const EdgeInsets.only(bottom: 12),
                              //           padding: const EdgeInsets.only(top: 16),
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(5),
                              //             color: Colors.white,
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 color: Colors.grey.withOpacity(0.5),
                              //                 spreadRadius: 4,
                              //                 blurRadius: 6,
                              //                 offset: const Offset(1, 1),
                              //               ),
                              //             ],
                              //           ),
                              //           child: Column(
                              //             crossAxisAlignment: CrossAxisAlignment.start,
                              //             children: [
                              //               Padding(
                              //                 padding: const EdgeInsets.fromLTRB(16, 0, 16, 13),
                              //                 child: Column(
                              //                   crossAxisAlignment: CrossAxisAlignment.start,
                              //                   children: [
                              //                     Row(
                              //                       mainAxisAlignment:
                              //                       MainAxisAlignment.spaceBetween,
                              //                       crossAxisAlignment:
                              //                       CrossAxisAlignment.start,
                              //                       children: [
                              //                         Expanded(
                              //                           flex: 1,
                              //                           child: Column(
                              //                             crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                             children: [
                              //                               label('Date'),
                              //                               info(enquiryDetails!.data!.followUps![index].followUpDate
                              //                                   .toString()),
                              //                             ],
                              //                           ),
                              //                         ),
                              //                         Expanded(
                              //                           flex: 1,
                              //                           child: Column(
                              //                             crossAxisAlignment:
                              //                             CrossAxisAlignment.start,
                              //                             children: [
                              //                               label('Next Followup'),
                              //                               info(enquiryDetails!.data!.followUps![index].nextDate
                              //                                   .toString()),
                              //                             ],
                              //                           ),
                              //                         ),
                              //
                              //                       ],
                              //                     ),
                              //                     Text(enquiryDetails!.data!.followUps![index].followUpRemarks
                              //                         .toString()),
                              //
                              //                   ],
                              //                 ),
                              //               ),
                              //               Container(
                              //                 padding: const EdgeInsets.symmetric(
                              //                     horizontal: 16, vertical: 2),
                              //                 decoration: BoxDecoration(
                              //                   color: const Color(0xffE7E3D0),
                              //                   borderRadius: BorderRadius.only(
                              //                     bottomLeft: Radius.circular(5),
                              //                     bottomRight: Radius.circular(5),
                              //                   ),
                              //                 ),
                              //                 child: Row(
                              //                   mainAxisAlignment:
                              //                   MainAxisAlignment.spaceBetween,
                              //                   children: [
                              //                     Row(
                              //                       children: [
                              //                         label('Status:'),
                              //                         const SizedBox(width: 8),
                              //                         info(enquiryDetails!.data!.followUps![index].status
                              //                             .toString()),
                              //                       ],
                              //                     ),
                              //
                              //                   ],
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       );
                              //     }),
                            ],
                          ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddEnquiryFollowup(widget.token, widget.enquiryId,widget.userId)),
            );
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add_box_outlined),
        ),
      ),
    );
  }

  top() {
    return Padding(
      padding: const EdgeInsets.all(10),
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 200,
                child: Text(
                  enquiryDetails!.data!.projectType.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 20,
                      minWidth: 20,
                      maxHeight: 50,
                      maxWidth: 50,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0),
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
                          image: NetworkImage(enquiryDetails!
                              .data!.projectTypeImage
                              .toString())),
                      // image: AssetImage(
                      //     'assets/images/img.jpeg')),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(enquiryDetails!.data!.companyName.toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                            enquiryDetails!.data!.createdBy.toString() +
                                ' on ' +
                                enquiryDetails!.data!.createdDate.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                            'Project Name: ' +
                                enquiryDetails!.data!.projectName.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                            'Contact Number: ' +
                                enquiryDetails!.data!.contactNumber.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 200,
                        child: Text(enquiryDetails!.data!.remarks.toString(),
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xffE7E3D0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditEnquiry(widget.token,enquiryDetails!.data!.enquiryId.toString(),
                                        enquiryDetails!.data!.companyName.toString(),enquiryDetails!.data!.contactNumber.toString(),
                                        enquiryDetails!.data!.contactPerson.toString(),enquiryDetails!.data!.designation.toString(),
                                        enquiryDetails!.data!.projectTypeId.toString(),enquiryDetails!.data!.cost.toString(),
                                        enquiryDetails!.data!.remarks.toString(),enquiryDetails!.data!.projectName.toString(),widget.userId)),
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
                            onTap: ()=>_dialogue(context,enquiryDetails!.data!.enquiryId
                                .toString()),

                            child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 20,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              String url = 'tel:' +
                                  enquiryDetails!.data!.contactNumber
                                      .toString();
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Icon(
                              Icons.call_sharp,
                              color: Colors.green,
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
                      Text(
                        enquiryDetails!.data!.cost.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
void _dialogue(BuildContext context,enquiryId) {
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

                  DeleteEnquiryModel object =
                  await HttpService.deleteEnquiry(enquiryId,
                      widget.token);
                  if (object.status == true) {
                    Common.toastMessaage(
                        'Added Successfully', Colors.green);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EnquiryList(widget.token,widget.userId)),
                    );
                  } else {
                    Navigator.pop(context);
                    Common.toastMessaage(
                        'Something Went Wrong', Colors.red);
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
  void _dialogueFollowup(BuildContext context,followupId) {
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

                    DeleteEnquiryFollowupModel object =
                    await HttpService.deleteEnquiryFollowup(followupId,
                        widget.token);
                    if (object.status == true) {
                      Common.toastMessaage(
                          'Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EnquiryList(widget.token,widget.userId)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage(
                          'Something Went Wrong', Colors.red);
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
