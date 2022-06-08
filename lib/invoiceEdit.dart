import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'models/addInvoiceInfoModel.dart';
import 'models/addInvoiceModel.dart';
import 'models/clientProjectsModel.dart';
import 'models/editInvoiceInfoModel.dart';

class InvoiceEdit extends StatefulWidget {
  String? invoiceId;
  String? token;

  InvoiceEdit(this.invoiceId, this.token);

  @override
  _InvoiceEditState createState() => _InvoiceEditState();
}

class _InvoiceEditState extends State<InvoiceEdit> {
  TextEditingController remarks = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  List<TextEditingController> _controllers = [];
  int? totalPrice = 0;

  EditInvoiceInfoModel? editinvoiceInfo;

  //

  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }

  getData() async {
    editinvoiceInfo =
        await HttpService.editInvoiceInfo(widget.invoiceId, widget.token);

    if (editinvoiceInfo != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Edit Invoice',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: editinvoiceInfo != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Invoice Number : ' +
                          editinvoiceInfo!.data!.invoiceNo.toString()),
                      Text('Client Name : ' +
                          editinvoiceInfo!.data!.clientName.toString()),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(20),
                              1: FlexColumnWidth(10),
                            },
                            border: TableBorder.all(
                                color: Colors.black38,
                                style: BorderStyle.solid,
                                width: 1),
                            children: [
                              TableRow(
                                  decoration: new BoxDecoration(
                                      color: Colors.greenAccent),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Center(
                                          child: Text(
                                        "Project",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Center(
                                          child: Text(
                                        'Amount',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ]),
                              for (int i = 0;
                                  i < editinvoiceInfo!.data!.projects!.length;
                                  i++)
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 7, bottom: 7),
                                    child: Center(
                                        child: Text(
                                      editinvoiceInfo!
                                          .data!.projects![i].projectName
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 7, bottom: 7, left: 10, right: 10),
                                    child: TextFormField(
                                      initialValue: '100',
                                      onChanged: (value) {
                                        setState(() {
                                         totalPrice=int.parse(value);
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                              TableRow(
                                  decoration: new BoxDecoration(),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Center(
                                          child: Text(
                                        "Total",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Center(
                                          child: Text(
                                            totalPrice.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ]),
                            ]),
                      ),

                      textFeildFunction(
                          'Remarks',
                          remarks,
                          TextInputType.text,
                          Icon(
                            Icons.note,
                            color: Colors.blue,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      // Text('Total Amount :' + totalPrice.toString(),
                      //     style: TextStyle(
                      //         fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 90,
                      )
                    ],
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 7,
                      color: Colors.white,
                      child: FlatButton(
                        color: Colors.green,
                        onPressed: () async {
                          // if (totalPrice==0) {
                          //   Common.toastMessaage(
                          //       'Amount Can not be emty', Colors.red);
                          // }  else {
                          //   Map<String, dynamic> body = {
                          //     "token": widget.token,
                          //     "clientId": client,
                          //     "projectIds":
                          //     checkedItems.map((e) => e.ids).toList(),
                          //     "totalAmount": totalAmount.text,
                          //     "remark": remarks.text,
                          //   };
                          //   AddInvoiceModel object =
                          //   await HttpService.addInvoice(body);
                          //   if (object.status == true) {
                          //     Common.toastMessaage(
                          //         'Added Successfully', Colors.green);
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) =>
                          //               AddInvoice(widget.token)),
                          //     );
                          //   } else {
                          //     Navigator.pop(context);
                          //     Common.toastMessaage(
                          //         'Something Went Wrong', Colors.red);
                          //   }
                          //   print(body);
                          // }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ],
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

  textFeildFunction(hintname, controller, keyboardType, icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                labelText: hintname,
                prefixIcon: icon,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 1.0,
                  ),
                ),
              )),
        ),
      ),
    );
  }


}
