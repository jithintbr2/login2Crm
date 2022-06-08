import 'package:flutter/material.dart';
import 'addReceipt.dart';
import 'httpService.dart';
import 'models/invoiceDetailsModel.dart';

class InvoiceDetails extends StatefulWidget {
  String? token;
  String? invoiceId;


  InvoiceDetails(this.token, this.invoiceId);

  @override
  _InvoiceDetailsState createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  InvoiceDetailsModel? invoiceDetails;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    invoiceDetails =
        await HttpService.invoiceDetails(widget.invoiceId, widget.token);
    if (invoiceDetails != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,

      body: invoiceDetails != null
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
                              onTap: () =>Navigator.of(context).pop(),
                              child: Image.asset(
                                  "assets/images/back_button.jpg",
                                  width: 40),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "Invoice Detials",
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
                            width: MediaQuery.of(context).size.width * 9,
                            height: 100,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                              image: new AssetImage(
                                  "assets/images/invoice_header.jpg"),
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
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(invoiceDetails!
                                              .data!.clientName
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Text(invoiceDetails!
                                          .data!.clientAddress
                                          .toString()),
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
                                    Text('Number : ' +
                                        invoiceDetails!.data!.invoiceNo
                                            .toString()),
                                    Text('Date : ' +
                                        invoiceDetails!.data!.invoiceDate
                                            .toString()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Table(
                              columnWidths: {
                                0: FlexColumnWidth(10),
                                1: FlexColumnWidth(20),
                                2: FlexColumnWidth(20),
                                3: FlexColumnWidth(20),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              border: TableBorder.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1),
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                        child: Text('No',
                                            style: TextStyle(fontSize: 15.0))),
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
                                    i < invoiceDetails!.data!.projects!.length;
                                    i++)
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                          invoiceDetails!.data!.projects![i].sNo
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                          invoiceDetails!
                                              .data!.projects![i].projectName
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                          invoiceDetails!
                                              .data!.projects![i].remark
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                          invoiceDetails!
                                              .data!.projects![i].amount
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ]),
                              ],
                            ),
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
                                      invoiceDetails!.data!.amountInWords
                                          .toString())),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Total : ' +
                                    invoiceDetails!.data!.totalAmount.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 40,
                            width: 150,
                            color: Colors.white,
                            child: FlatButton(
                              color: Colors.green,
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddReceipt(
                                          widget.token, widget.invoiceId)),
                                );
                              },
                              child: Text(
                                'Add Receipt',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 40,
                            width: 150,
                            color: Colors.white,
                            child: FlatButton(
                              color: Colors.green,
                              onPressed: () async {},
                              child: Text(
                                'Download',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
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
    );
  }
}
