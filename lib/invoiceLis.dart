import 'package:crm_admin/addInvoice.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'accounts.dart';
import 'common.dart';
import 'dashboard.dart';
import 'httpService.dart';
import 'invoiceDetails.dart';
import 'invoiceEdit.dart';
import 'models/deleteInvoiceModel.dart';
import 'models/invoiceListModel.dart';

class InvoiceList extends StatefulWidget {
  String? token;
  String? menuId;
  String? status;
  String? fromDate1;

  InvoiceList(this.token, this.menuId, this.status, this.fromDate1);

  @override
  _InvoiceListState createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  InvoiceListModel? invoiceList;

  String fromdate =
      DateTime(DateTime.now().year, DateTime.now().month, 1).toString();
  String todate = DateTime.now().toString();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  bool? searchSts = false;
  TextEditingController search = new TextEditingController();
  String? searchKey;

  void initState() {
    fromdate = widget.fromDate1.toString();

    // TODO: implement initState
    super.initState();
    getData(widget.fromDate1, todate, searchKey);
  }

  getData(fromdate, todate, searchKey) async {
    invoiceList = await HttpService.invoiceList(
        fromdate, todate, searchKey, widget.token, widget.status);
    if (invoiceList != null) {
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
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Accounts(widget.token, widget.menuId, 0)),
        );
        return true;
      },
      child: Scaffold(
        body: invoiceList != null
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
                                          builder: (context) => Accounts(
                                              widget.token, widget.menuId, 0)),
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
                                  "Invoice List",
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
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
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 365)),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
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
                                          margin:
                                              const EdgeInsets.only(left: 10),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
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
                                      getData(fromdate, todate, search.text);
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Invoice Amount :',
                                  style: TextStyle(
                                      color: const Color(0xFF2a52be),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "₹ " +
                                      invoiceList!.data!.totalAmount.toString(),
                                  style: TextStyle(
                                      color: const Color(0xFF2a52be),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Paid Amount :',
                                  style: TextStyle(
                                      color: const Color(0xFF2a52be),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "₹ " +
                                      invoiceList!.data!.totalPaid.toString(),
                                  style: TextStyle(
                                      color: const Color(0xFF2a52be),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Balance Amount :',
                                  style: TextStyle(
                                      color: const Color(0xFF2a52be),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "₹ " +
                                      invoiceList!.data!.totalBalance
                                          .toString(),
                                  style: TextStyle(
                                      color: const Color(0xFF2a52be),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 24),
                                itemCount:
                                    invoiceList!.data!.invoiceList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InvoiceDetails(
                                                    widget.token,
                                                    invoiceList!
                                                        .data!
                                                        .invoiceList![index]
                                                        .id)),
                                      ),
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => ProjectDetails(projectList!.data!.projectList![index].projectId,widget.token)),
                                      // ),
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.only(top: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                16, 0, 16, 13),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Padding(
                                                //   padding: const EdgeInsets.only(
                                                //       bottom: 16.0),
                                                //   child: Text(
                                                //     invoiceList!.data!
                                                //         .invoiceList![index].client
                                                //         .toString(),
                                                //     style: const TextStyle(
                                                //         fontSize: 18,
                                                //         fontWeight: FontWeight.bold),
                                                //   ),
                                                // ),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.spaceBetween,
                                                //   crossAxisAlignment:
                                                //       CrossAxisAlignment.start,
                                                //   children: [
                                                //     Expanded(
                                                //       flex: 1,
                                                //       child: Column(
                                                //         crossAxisAlignment:
                                                //             CrossAxisAlignment.start,
                                                //         children: [
                                                //           label('Invoice Amount '),
                                                //           info(
                                                //             "₹ " +
                                                //                 invoiceList!
                                                //                     .data!
                                                //                     .invoiceList![index]
                                                //                     .invoiceAmount
                                                //                     .toString(),
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
                                                //           label('Paid Amount'),
                                                //           info(
                                                //             "₹ " +
                                                //                 invoiceList!
                                                //                     .data!
                                                //                     .invoiceList![index]
                                                //                     .amountPaid
                                                //                     .toString(),
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
                                                //           label('Balance'),
                                                //           info(
                                                //             "₹ " +
                                                //                 invoiceList!
                                                //                     .data!
                                                //                     .invoiceList![index]
                                                //                     .balanceAmount
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
                                                //       // InkWell(
                                                //       //     onTap: () {
                                                //       //       Navigator.push(
                                                //       //         context,
                                                //       //         MaterialPageRoute(
                                                //       //             builder: (context) => InvoiceEdit(invoiceList!
                                                //       //                 .data!
                                                //       //                 .invoiceList![index]
                                                //        //                 .id
                                                //       //                 .toString(),widget.token)),
                                                //       //       );
                                                //       //     },
                                                //       //     child: Icon(
                                                //       //       Icons.edit,
                                                //       //       color: Colors.blue,
                                                //       //       size: 20,
                                                //       //     )),
                                                //       SizedBox(
                                                //         width: 10,
                                                //       ),
                                                //       InkWell(
                                                //           onTap: () => _dialogue(
                                                //             context,
                                                //             invoiceList!
                                                //                 .data!
                                                //                 .invoiceList![index]
                                                //                 .id
                                                //                 .toString(),
                                                //           ),
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
                                                            'INVOICE FOR',
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
                                                            invoiceList!
                                                                .data!
                                                                .invoiceList![
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
                                                                invoiceList!
                                                                    .data!
                                                                    .invoiceList![
                                                                        index]
                                                                    .invoiceAmount
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
                                                                invoiceList!
                                                                    .data!
                                                                    .invoiceList![index]
                                                                    .date
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
                                                        onTap: () => _dialogue(
                                                          context,
                                                          invoiceList!
                                                              .data!
                                                              .invoiceList![index]
                                                              .id
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
                                                  invoiceList!
                                                      .data!
                                                      .invoiceList![index]
                                                      .invoiceNo
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
                    builder: (context) =>
                        AddInvoice(widget.token, widget.menuId)),
              );
            },
            backgroundColor: const Color(0xFF2a52be),
            child: const Icon(Icons.add_box_outlined,size: 35,),
          ),
        ),
      ),
    );
  }

  void _dialogue(BuildContext context, InvoiceId) {
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
                    DeleteInvoiceModel object = await HttpService.deleteInvoice(
                        InvoiceId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage(
                          'Deleted Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvoiceList(
                                widget.token,
                                widget.menuId,
                                widget.status,
                                widget.fromDate1)),
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
