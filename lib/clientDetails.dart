import 'package:crm_admin/projectDetails.dart';
import 'package:flutter/material.dart';
import 'addProject.dart';
import 'clientEdit.dart';
import 'clientInvoice.dart';
import 'clientList.dart';
import 'clientReceipt.dart';
import 'common.dart';
import 'dashboard.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'models/clientDetailsModel.dart';
import 'models/deleteClientModel.dart';

class ClientDetails extends StatefulWidget {
  String? clientId;
  String? token;
  String? clientImage;

  ClientDetails(this.clientId, this.token,this.clientImage);

  @override
  _ClientDetailsState createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  ClientDetailsModel? clientDetails;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    clientDetails =
        await HttpService.clientDetails(widget.clientId, widget.token);
    if (clientDetails != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: clientDetails != null
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
                                        builder: (context) => HomePage(
                                            widget.token,0)),
                                        (Route<dynamic> route) => false);
                              },
                              child: Image.asset(
                                  "assets/images/back_button.jpg",
                                  width: 40),
                            ),


                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
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

                                  children: [

                                    Container(
                                      width:100,height:100,
                                      child: Image.network(widget.clientImage.toString()),

                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Container(
                                          width:220,
                                          child: Text(clientDetails!
                                              .data!
                                              .clientName
                                              .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Text(clientDetails!
                                              .data!
                                              .createdBy
                                              .toString()+' on '+clientDetails!
                                              .data!
                                              .createdDate
                                              .toString(),style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.brown)),
                                        ),
                                        SizedBox(height: 10,),

                                        Row(
                                          children: [
                                            Text(clientDetails!
                                            .data!.projectCount
                                            .toString(),style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                            SizedBox(width: 5,),
                                            Text('Projects')
                                          ],
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  height: 40 ,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE7E3D0),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              Icons.phone_android,
                                              color: Colors.green,
                                              size: 20
                                          ),
                                          SizedBox(width: 5,),
                                          Text(clientDetails!
                                              .data!
                                              .contact1
                                              .toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),




                                        ],
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                            InkWell(
                                                onTap: (){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ClientEdit(widget.token,
                                                            clientDetails!.data!.clientId.toString(),
                                                            clientDetails!.data!.clientName.toString(),
                                                            clientDetails!.data!.contact1.toString(),
                                                            clientDetails!.data!.contact2.toString(),
                                                            clientDetails!.data!.email.toString(),
                                                            clientDetails!.data!.contactPerson.toString(),
                                                            clientDetails!.data!.designation.toString(),
                                                            clientDetails!.data!.address1.toString(),
                                                            clientDetails!.data!.description.toString(),
                                                            clientDetails!.data!.remarks.toString(),
                                                            clientDetails!.data!.gstNo.toString(),
                                                            clientDetails!.data!.careOff.toString(),widget.clientImage


                                                        )),
                                                  );
                                                },
                                                child: Icon(Icons.edit, color: Colors.blue,size: 20,)),
                                            SizedBox(width: 10,),
                                            InkWell(
                                                onTap: ()=>_dialogue(context,clientDetails!.data!.clientId.toString()),


                                                child: Icon(Icons.delete, color: Colors.red,size: 20,)),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                              Icons.monetization_on,
                                              color: Colors.orange,
                                              size: 20
                                          ),
                                          SizedBox(width: 5,),
                          clientDetails!
                              .data!
                              .dueAmount
                              .toString()=='0'?
                                          Text('Completed',
                                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),):
                                          Text('Due: '+clientDetails!
                                              .data!
                                              .dueAmount
                                              .toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                                        ],
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),

                          ),
                        ),
                        // Center(
                        //     child: Text(
                        //   clientDetails!.data!.clientName.toString(),
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.black),
                        // )),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Center(
                        //     child: Text(
                        //   clientDetails!.data!.contactPerson.toString() +
                        //       '( ' +
                        //       clientDetails!.data!.designation.toString() +
                        //       ' )',
                        //   style: TextStyle(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.black),
                        // )),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Center(
                        //     child: Text(
                        //   clientDetails!.data!.contact1.toString(),
                        //   style: TextStyle(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.black),
                        // )),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Center(
                        //     child: Text(
                        //   clientDetails!.data!.email.toString(),
                        //   style: TextStyle(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.black),
                        // )),
                        SizedBox(
                          height: 20,
                        ),


                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Project Information",
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
                              // ListView.builder(
                              //     physics: NeverScrollableScrollPhysics(),
                              //     shrinkWrap: true,
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 12, vertical: 24),
                              //     itemCount: clientDetails!.data!.projects!.length,
                              //     itemBuilder: (BuildContext context, int index) {
                              //       return GestureDetector(
                              //         onTap: () => {
                              //           Navigator.push(
                              //             context,
                              //             MaterialPageRoute(builder: (context) => ProjectDetails(clientDetails!.data!.projects![index].projectId.toString(),widget.token,0)),
                              //           ),
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
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               Padding(
                              //                 padding: const EdgeInsets.fromLTRB(
                              //                     16, 0, 16, 13),
                              //                 child: Column(
                              //                   crossAxisAlignment:
                              //                       CrossAxisAlignment.start,
                              //                   children: [
                              //                     Padding(
                              //                       padding: const EdgeInsets.only(
                              //                           bottom: 16.0),
                              //                       child: Text(
                              //                         clientDetails!
                              //                             .data!
                              //                             .projects![index]
                              //                             .projectName
                              //                             .toString(),
                              //                         style: const TextStyle(
                              //                             fontSize: 18,
                              //                             fontWeight:
                              //                                 FontWeight.bold),
                              //                       ),
                              //                     ),
                              //                     Row(
                              //                       mainAxisAlignment:
                              //                           MainAxisAlignment
                              //                               .spaceBetween,
                              //                       crossAxisAlignment:
                              //                           CrossAxisAlignment.start,
                              //                       children: [
                              //                         Expanded(
                              //                           flex: 1,
                              //                           child: Column(
                              //                             crossAxisAlignment:
                              //                                 CrossAxisAlignment
                              //                                     .start,
                              //                             children: [
                              //                               label('Start Date'),
                              //                               info(
                              //                                 clientDetails!
                              //                                     .data!
                              //                                     .projects![index]
                              //                                     .startDate
                              //                                     .toString(),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                         ),
                              //                         Expanded(
                              //                           flex: 1,
                              //                           child: Column(
                              //                             crossAxisAlignment:
                              //                                 CrossAxisAlignment
                              //                                     .start,
                              //                             children: [
                              //                               label('End Date'),
                              //                               info(
                              //                                 clientDetails!
                              //                                     .data!
                              //                                     .projects![index]
                              //                                     .completedDate
                              //                                     .toString(),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                         ),
                              //                         Expanded(
                              //                           flex: 1,
                              //                           child: Column(
                              //                             crossAxisAlignment:
                              //                                 CrossAxisAlignment
                              //                                     .start,
                              //                             children: [
                              //                               label('Time Left'),
                              //                               label(
                              //                                 clientDetails!
                              //                                     .data!
                              //                                     .projects![index]
                              //                                     .timeLeft
                              //                                     .toString(),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                         ),
                              //                       ],
                              //                     ),
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
                              //                       MainAxisAlignment.spaceBetween,
                              //                   children: [
                              //                     Row(
                              //                       children: [
                              //                         label('Status'),
                              //                         const SizedBox(width: 8),
                              //                         info(
                              //                           clientDetails!
                              //                               .data!
                              //                               .projects![index]
                              //                               .statusName
                              //                               .toString(),
                              //                         ),
                              //                       ],
                              //                     ),
                              //                   ],
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       );
                              //     }),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 24),
                                  itemCount:
                                  clientDetails!.data!.projects!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProjectDetails(
                                                      clientDetails!
                                                          .data!
                                                          .projects![index]
                                                          .projectId
                                                          .toString(),
                                                      widget.token,
                                                      0)),
                                        ),
                                      },
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
                                        // child: Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Padding(
                                        //       padding: const EdgeInsets.fromLTRB(
                                        //           16, 0, 16, 13),
                                        //       child: Column(
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.start,
                                        //         children: [
                                        //
                                        //           Padding(
                                        //             padding:
                                        //                 const EdgeInsets.only(
                                        //                     bottom: 16.0),
                                        //             child: Text(
                                        //               projectList!
                                        //                   .data!
                                        //                   .projectList![index]
                                        //                   .projectName
                                        //                   .toString(),
                                        //               style: const TextStyle(
                                        //                   fontSize: 18,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             ),
                                        //           ),
                                        //           Row(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment
                                        //                     .spaceBetween,
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment.start,
                                        //             children: [
                                        //               Expanded(
                                        //                 flex: 1,
                                        //                 child: Column(
                                        //                   crossAxisAlignment:
                                        //                       CrossAxisAlignment
                                        //                           .start,
                                        //                   children: [
                                        //                     label('Start Date'),
                                        //                     info(
                                        //                       projectList!
                                        //                           .data!
                                        //                           .projectList![
                                        //                               index]
                                        //                           .startDate
                                        //                           .toString(),
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //               Expanded(
                                        //                 flex: 1,
                                        //                 child: Column(
                                        //                   crossAxisAlignment:
                                        //                       CrossAxisAlignment
                                        //                           .start,
                                        //                   children: [
                                        //                     label('End Date'),
                                        //                     info(
                                        //                       projectList!
                                        //                           .data!
                                        //                           .projectList![
                                        //                               index]
                                        //                           .completedDate
                                        //                           .toString(),
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //               Expanded(
                                        //                 flex: 1,
                                        //                 child: Column(
                                        //                   crossAxisAlignment:
                                        //                       CrossAxisAlignment
                                        //                           .start,
                                        //                   children: [
                                        //                     label('Time Left'),
                                        //                     label(
                                        //                       projectList!
                                        //                           .data!
                                        //                           .projectList![
                                        //                               index]
                                        //                           .timeLeft
                                        //                           .toString(),
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     Container(
                                        //       padding: const EdgeInsets.symmetric(
                                        //           horizontal: 16, vertical: 2),
                                        //       decoration: BoxDecoration(
                                        //         color: const Color(0xffE7E3D0),
                                        //         borderRadius: BorderRadius.only(
                                        //           bottomLeft: Radius.circular(5),
                                        //           bottomRight: Radius.circular(5),
                                        //         ),
                                        //       ),
                                        //       child: Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .spaceBetween,
                                        //         children: [
                                        //           Row(
                                        //             children: [
                                        //               label('Status'),
                                        //               const SizedBox(width: 8),
                                        //               info(
                                        //                 projectList!
                                        //                     .data!
                                        //                     .projectList![index]
                                        //                     .statusName
                                        //                     .toString(),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           info(
                                        //             projectList!
                                        //                 .data!
                                        //                 .projectList![index]
                                        //                 .clientName
                                        //                 .toString(),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     )
                                        //   ],
                                        // ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20),
                                                  child: Container(
                                                    width: 200,
                                                    child: Text(clientDetails!
                                                        .data!
                                                        .projects![index]
                                                        .clientName
                                                        .toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.purple),),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 20),
                                                  child: Text(clientDetails!
                                                      .data!
                                                      .projects![index]
                                                      .statusName
                                                      .toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:
                                                  clientDetails!
                                                      .data!
                                                      .projects![index]
                                                      .statusName
                                                      .toString()=='Completed'?Colors.green:Colors.red),),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Text(clientDetails!
                                                  .data!
                                                  .projects![index]
                                                  .projectName
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

                                                        image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(clientDetails!.data!.projects![index].projectTypeIcon.toString())),
                                                        borderRadius: const BorderRadius.all(
                                                            Radius.circular(18))
                                                    ),

                                                    width: 70,
                                                    height: 70,

                                                  ),
                                                  SizedBox(width: 20,),

                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,

                                                    children: [

                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 10),
                                                        child: Text(clientDetails!
                                                            .data!
                                                            .projects![index]
                                                            .createdBy
                                                            .toString()+' on '+clientDetails!
                                                            .data!
                                                            .projects![index]
                                                            .createdDate
                                                            .toString(),style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black)),
                                                      ),
                                                      clientDetails!.data!.projects![index].staffs!.length>0?
                                                      SizedBox(
                                                        height: 80,
                                                        child: ListView.builder(
                                                            scrollDirection: Axis.horizontal,
                                                            shrinkWrap: true,
                                                            padding: const EdgeInsets.symmetric(
                                                                horizontal: 5, vertical: 15),
                                                            itemCount:clientDetails!.data!.projects![index].staffs!.length,
                                                            itemBuilder:
                                                                (BuildContext context, int childIndex) {
                                                              return GestureDetector(
                                                                onTap: () async {

                                                                },
                                                                child: Container(
                                                                  constraints: const BoxConstraints(
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
                                                                          image: NetworkImage(clientDetails!.data!.projects![index].staffs![childIndex].image.toString())),
                                                                      // image: AssetImage(
                                                                      //     'assets/images/img.jpeg')),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      ):SizedBox(height: 80,child: Container(
                                                        constraints: const BoxConstraints(
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
                                                                    image: AssetImage('assets/images/avathar.jpg')),
                                                                // image: AssetImage(
                                                                //     'assets/images/img.jpeg')),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10,),
                                                            Text('Not Assigned',style: TextStyle(color: Colors.red),)
                                                          ],
                                                        ),
                                                      ),),
                                                      Text('Working Staff : '+clientDetails!.data!.projects![index].staffs!.length.toString(),style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black)),
                                                    ],
                                                  ),


                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              height: 40 ,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE7E3D0),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(5),
                                                  bottomRight: Radius.circular(5),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                          Icons.task,
                                                          color: Colors.grey,
                                                          size: 20
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(clientDetails!.data!.projects![index].taskCount.toString(),
                                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                                      SizedBox(width: 15,),
                                                      Icon(
                                                          Icons.comment,
                                                          color: Colors.grey,
                                                          size: 20
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(clientDetails!.data!.projects![index].taskCount.toString(),
                                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),

                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                          Icons.monetization_on,
                                                          color: Colors.orange,
                                                          size: 20
                                                      ),
                                                      SizedBox(width: 5,),
                                                      clientDetails!.data!.projects![index].balanceDue.toString()=='0'?
                                                      Text('Completed',
                                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),):
                                                      Text('Due: '+clientDetails!.data!.projects![index].balanceDue.toString(),
                                                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProject(widget.token,0)),
              );
            },
            backgroundColor: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add_box_rounded),
                Text('Project',style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          SizedBox(width: 10,),
          if(clientDetails != null && clientDetails!.data!.isInvoice==true)
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientInvoice(widget.token,clientDetails!.data!.clientId.toString())),
              );
            },
            backgroundColor: Colors.brown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.list_alt),
                Text('Invoice',style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          SizedBox(width: 10,),
          if(clientDetails != null && clientDetails!.data!.isReciept==true)
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientReceipt(widget.token,clientDetails!.data!.clientId.toString())),
              );
            },
            backgroundColor: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.book),
                Text('Receipt',style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _dialogue(BuildContext context,clientId) {
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

                    DeleteClientModel object =
                    await HttpService.deleteClient(clientId,
                        widget.token);
                    if (object.status == true) {
                      Common.toastMessaage(
                          'Delete Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ClientList(widget.token)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage(
                          object.message, Colors.red);
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
  return Center(
    child: Text(
      labelName,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget info(String infoText, {Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Center(
      child: Text(
        infoText,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget info1(String infoText, {Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Center(
      child: Text(
        infoText,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
