import 'package:flutter/material.dart';

import 'httpService.dart';
import 'models/receiptDetalsModel.dart';

class ReceiptDetails extends StatefulWidget {
  String? token;
  String? receiptId;

  ReceiptDetails(this.token, this.receiptId);

  @override
  _ReceiptDetailsState createState() => _ReceiptDetailsState();
}

class _ReceiptDetailsState extends State<ReceiptDetails> {
  ReceiptDetailsModel? receiptDetails;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    receiptDetails =
    await HttpService.receiptDetails(widget.receiptId, widget.token);
    if (receiptDetails != null) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          'Receipt Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: receiptDetails != null
          ? Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 9,
                    height: 100,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new AssetImage("assets/images/reciept_header.jpg"),
                      fit: BoxFit.fill,
                    ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Bill To:'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(receiptDetails!.data!.clientName.toString()),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(receiptDetails!.data!.clientAddress.toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 5),
                      child: Container(
                        child: Column(
                          children: [
                            Text('Invoice : '+receiptDetails!.data!.invoiceNo.toString()),
                            Text('Receipt : '+receiptDetails!.data!.receiptNo.toString()),
                            Text('Date : '+receiptDetails!.data!.receiptDate.toString()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(10),
                      1: FlexColumnWidth(20),
                      2: FlexColumnWidth(20),
                      3: FlexColumnWidth(20),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child:
                                  Text('No', style: TextStyle(fontSize: 15.0))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text('Project',
                                  style: TextStyle(fontSize: 15.0))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text('Description',
                                  style: TextStyle(fontSize: 15.0))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                              child: Text('Amount',
                                  style: TextStyle(fontSize: 15.0))),
                        ),
                      ]),
                      for (int i = 0;
                      i < receiptDetails!.data!.projects!.length;
                      i++)
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                receiptDetails!.data!.projects![i].sNo
                                    .toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                receiptDetails!
                                    .data!.projects![i].projectName
                                    .toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                receiptDetails!
                                    .data!.projects![i].remark
                                    .toString(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                receiptDetails!
                                    .data!.projects![i].amount
                                    .toString(),
                              ),
                            ),
                          ),
                        ]),


                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          width: 200,
                          child: Text('In Words : ' +
                              receiptDetails!.data!.amountInWords
                                  .toString())),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Total : ' +
                            receiptDetails!.data!.totalAmount.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // Center(
                //     child: Row(
                //       children: [
                //         Text(
                //           'Add Receipt',
                //           style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white),
                //         ),
                //         IconButton(
                //           icon: Icon(Icons.add_box_outlined, color: Colors.black),
                //           onPressed: () => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => AddReceipt(widget.token,widget.invoiceId
                //                 )),
                //           ),
                //         )
                //       ],
                //     )),
              ],
            ),
          ),
        ],
      ):AlertDialog(
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
