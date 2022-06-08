import 'package:crm_admin/receiptDetails.dart';
import 'package:crm_admin/receiptList.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'models/clientReceiptModel.dart';
import 'models/deleteReceiptModel.dart';

class ClientReceipt extends StatefulWidget {
  String? token;
  String? clientId;

  ClientReceipt(this.token, this.clientId);

  @override
  _ClientReceiptState createState() => _ClientReceiptState();
}

class _ClientReceiptState extends State<ClientReceipt> {
  ClientReceiptModel? clientReceipt;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    clientReceipt =
        await HttpService.clientReceipt(widget.token, widget.clientId);
    if (clientReceipt != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: clientReceipt != null
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
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
                                  Navigator.of(context).pop();
                                },
                                child: Image.asset(
                                    "assets/images/back_button.jpg",
                                    width: 40),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Receipt",
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
                          Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                'Total Amount : ' +
                                    clientReceipt!.data!.totalAmount.toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )),

                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 24),
                              itemCount: clientReceipt!.data!.recieptList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReceiptDetails(
                                              widget.token,
                                              clientReceipt!
                                                  .data!.recieptList![index].recieptId
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
                                                          clientReceipt!
                                                              .data!.clientName
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
                                                              clientReceipt!
                                                                  .data!
                                                                  .recieptList![
                                                              index]
                                                                  .recieptAmount
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
                                                              clientReceipt!
                                                                  .data!
                                                                  .recieptList![index]
                                                                  .recieptDate
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
                                                        clientReceipt!
                                                            .data!
                                                            .recieptList![index]
                                                            .recieptId
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
                                                clientReceipt!
                                                    .data!
                                                    .recieptList![index]
                                                    .recieptNo
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
                      Common.toastMessaage('Delete Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClientReceipt(widget.token,widget.clientId)),
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
