import 'package:crm_admin/receiptEdit.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'accounts.dart';
import 'common.dart';
import 'dashboard.dart';
import 'httpService.dart';
import 'models/deleteReceiptModel.dart';
import 'models/receiptListModel.dart';
import 'receiptDetails.dart';

class ReceiptList extends StatefulWidget {
  String? token;
  String? menuId;

  ReceiptList(this.token,this.menuId);

  @override
  _ReceiptListState createState() => _ReceiptListState();
}

class _ReceiptListState extends State<ReceiptList> {
  ReceiptListModel? receiptList;
  String fromdate =
      DateTime(DateTime.now().year, DateTime.now().month, 1).toString();
  String todate = DateTime.now().toString();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  bool? searchSts = false;
  TextEditingController search = new TextEditingController();
  String? searchKey;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(fromdate,todate,searchKey);
  }

  getData(fromdate,todate,searchKey) async {
    receiptList = await HttpService.receiptList(widget.token,fromdate,todate,searchKey);
    if (receiptList != null) {
      if(searchSts==true){Navigator.pop(context);}
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
              builder: (context) => Accounts(widget.token,widget.menuId,0)),
        );
        return true;
      },
      child: Scaffold(

        body: receiptList != null
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
                                        builder: (context) => Accounts(widget.token,widget.menuId,0)),
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
                                "Receipt List",
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
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.44,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
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
                                child: Center(
                                  child: DateTimePicker(
                                    decoration: InputDecoration(
                                      icon:  Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'From Date',
                                    ),
                                    initialValue: fromdate,

                                    // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                                    type: DateTimePickerType.date,

                                    //controller: fromDate,
                                    firstDate: DateTime(1995),
                                    lastDate:
                                        DateTime.now().add(Duration(days: 365)),
                                    // This will add one year from current date
                                    validator: (value) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          fromdate = value;
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

                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.44,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
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
                                child: Center(
                                  child: DateTimePicker(
                                    decoration: InputDecoration(
                                      icon:  Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'To Date',
                                    ),
                                    initialValue: todate,
                                    // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                                    type: DateTimePickerType.date,


                                    //controller: toDate,
                                    firstDate: DateTime(1995),
                                    lastDate:
                                        DateTime.now().add(Duration(days: 365)),
                                    // This will add one year from current date
                                    validator: (value) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          todate = value;
                                        });
                                      }
                                    },
                                    // We can also use onSaved
                                    onSaved: (value) {
                                      if (value!.isNotEmpty) {
                                        todate = value;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.44,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                            controller: search,
                                            decoration: InputDecoration(
                                              hintText: 'Search By Client ',
                                              border: InputBorder.none,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.44,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
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
                                    color: Color(0xffE7E3D0),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: FlatButton(
                                  onPressed: () async {
                                    searchSts = true;
                                    Common.showProgressDialog(
                                        context, "Loading..");
                                    getData(fromdate,todate,search.text);
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
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 24),
                              itemCount: receiptList!.data!.receipt!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReceiptDetails(
                                              widget.token,
                                              receiptList!
                                                  .data!.receipt![index].receiptId
                                                  .toString())),
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
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 0, 16, 13),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.spaceBetween,
                                              //   children: [
                                              //     Padding(
                                              //       padding: const EdgeInsets.only(
                                              //           bottom: 16.0),
                                              //       child: Text(
                                              //         receiptList!.data!
                                              //             .receipt![index].receiptNo
                                              //             .toString(),
                                              //         style: const TextStyle(
                                              //             fontSize: 18,
                                              //             fontWeight:
                                              //                 FontWeight.bold),
                                              //       ),
                                              //     ),
                                              //     Padding(
                                              //       padding: const EdgeInsets.only(
                                              //           bottom: 16.0),
                                              //       child: Text(
                                              //         receiptList!.data!
                                              //             .receipt![index].invoiceNo
                                              //             .toString(),
                                              //         style: const TextStyle(
                                              //             fontSize: 15,
                                              //             fontWeight:
                                              //                 FontWeight.bold),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.spaceBetween,
                                              //   children: [
                                              //     Expanded(
                                              //       flex: 1,
                                              //       child: Column(
                                              //         crossAxisAlignment:
                                              //             CrossAxisAlignment.start,
                                              //         children: [
                                              //           info(
                                              //             receiptList!
                                              //                 .data!
                                              //                 .receipt![index]
                                              //                 .client
                                              //                 .toString(),
                                              //           ),
                                              //           info(
                                              //             receiptList!
                                              //                 .data!
                                              //                 .receipt![index]
                                              //                 .dateOfReceipt
                                              //                 .toString(),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //     Expanded(
                                              //       flex: 1,
                                              //       child: Column(
                                              //         crossAxisAlignment:
                                              //             CrossAxisAlignment.start,
                                              //         children: [
                                              //           Text(
                                              //             '₹ ' +
                                              //                 receiptList!
                                              //                     .data!
                                              //                     .receipt![index]
                                              //                     .paidAmount
                                              //                     .toString(),
                                              //             style: const TextStyle(
                                              //                 fontSize: 18,
                                              //                 fontWeight:
                                              //                     FontWeight.bold,
                                              //                 color: Colors.green),
                                              //           ),
                                              //           info(
                                              //             'collected By : ' +
                                              //                 receiptList!
                                              //                     .data!
                                              //                     .receipt![index]
                                              //                     .collectedBy
                                              //                     .toString(),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              // Container(
                                              //   child: Row(
                                              //     children: [
                                              //       InkWell(
                                              //           onTap: () {},
                                              //           child: Icon(
                                              //             Icons.edit,
                                              //             color: Colors.blue,
                                              //             size: 20,
                                              //           )),
                                              //       SizedBox(
                                              //         width: 10,
                                              //       ),
                                              //       InkWell(
                                              //           onTap: () => _dialogue(
                                              //                 context,
                                              //                 receiptList!
                                              //                     .data!
                                              //                     .receipt![index]
                                              //                     .receiptId
                                              //                     .toString(),
                                              //               ),
                                              //           child: Icon(
                                              //             Icons.delete,
                                              //             color: Colors.red,
                                              //             size: 20,
                                              //           )),
                                              //     ],
                                              //   ),
                                              // )
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 170,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          'RECEIPT FOR',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff757575),
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          receiptList!
                                                              .data!
                                                              .receipt![
                                                          index]
                                                              .client
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              fontSize: 17),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '43 State Lane,San Fransisco, California, United State',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff757575),
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 130,
                                                    height: 100,
                                                    margin:
                                                    const EdgeInsets.only(
                                                        bottom: 12),
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 16),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(10),
                                                      color:
                                                      Color(0xffeeeeee),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'AMOUNT',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff757575),
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                          ),
                                                        ),
                                                        SizedBox(height: 12,),
                                                        Text(
                                                          "₹ " +
                                                              receiptList!
                                                                  .data!
                                                                  .receipt![
                                                              index]
                                                                  .paidAmount
                                                                  .toString(),
                                                          style: TextStyle(
                                                            color:
                                                            Colors.black,
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 8,),
                                                        Row(
                                                          children: [
                                                            SizedBox(width: 10,),
                                                            Icon(Icons.calendar_today_outlined, color: Colors.deepOrange,size: 20,),
                                                            SizedBox(width: 10,),

                                                            Text(
                                                              receiptList!
                                                                  .data!
                                                                  .receipt![index]
                                                                  .dateOfReceipt
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w800
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
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
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => ReceiptEdit(receiptList!.data!.receipt![index].receiptId.toString())),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: Colors.blue,
                                                        size: 20,
                                                      )),
                                                  InkWell(
                                                      onTap: () => _dialogue(
                                                        context,
                                                        receiptList!
                                                            .data!
                                                            .receipt![index]
                                                            .receiptId
                                                            .toString(),
                                                      ),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size: 20,
                                                      )),


                                                ],
                                              ),
                                              info(
                                                receiptList!
                                                    .data!
                                                    .receipt![index]
                                                    .receiptNo
                                                    .toString(),
                                              ),
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
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 7,
                          color: Colors.blueGrey,
                          child: Center(
                              child: Text(
                            'Total Amount :  ₹ ' +
                                receiptList!.data!.totalAmount.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
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

  void _dialogue(BuildContext context, receiptId) {
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
                    DeleteReceiptModel object = await HttpService.deleteReceipt(
                        receiptId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReceiptList(widget.token,widget.menuId)),
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
