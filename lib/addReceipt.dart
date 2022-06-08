import 'package:crm_admin/invoiceDetails.dart';
import 'package:crm_admin/receiptList.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'common.dart';
import 'httpService.dart';
import 'models/addReceiptInfoModel.dart';
import 'models/addReceiptModel.dart';

class AddReceipt extends StatefulWidget {
  String? token;
  String? invoiceId;

  AddReceipt(this.token, this.invoiceId);

  @override
  _AddReceiptState createState() => _AddReceiptState();
}

class _AddReceiptState extends State<AddReceipt> {
  TextEditingController invoiceNumber = new TextEditingController();
  TextEditingController remarks = new TextEditingController();
  TextEditingController totalAmount = new TextEditingController(text: '0');
  TextEditingController client = new TextEditingController();
  String? date=DateTime.now().toString();
  var collectedBy;

  AddReciptInfoModel? receiptInfo;

  bool val = false;
  List<checkBoxClass>? listItems;
  List<checkBoxClass> checkedItems = [];
  List<TextEditingController> _controllers = [];
  Map checkedAmount = Map();

  //
  int? totalPrice = 0;
  List<checkBoxClass>? ids;
  bool clientVal = false;

  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
    listItems = [];
  }

  getData() async {
    receiptInfo = await HttpService.AddReceiptInfo(widget.invoiceId);
    invoiceNumber = new TextEditingController(
        text: receiptInfo!.data!.invoiceNo.toString());
    client = new TextEditingController(
        text: receiptInfo!.data!.clientName.toString());

    if (receiptInfo != null) {
      receiptInfo!.data!.particulars!.forEach((element) {
        listItems!.add(checkBoxClass(element.particularAmount,
            element.particularName.toString(), element.particularId));
      });

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: receiptInfo != null
          ? Container(
        width: double.infinity,
        height: size.height,
            child: Stack(
              alignment: Alignment.center,
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
                              "Receipt Add",
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
                        textFeildFunction(
                            'Invoice Number', invoiceNumber, TextInputType.text),
                        textFeildFunction(
                            'Client Name', client, TextInputType.text),
                        Container(
                          width: double.infinity,
                          height: 60,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
                              initialValue: date,

                              // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                              type: DateTimePickerType.date,
                              dateHintText: 'From Date',
                              //controller: fromDate,
                              firstDate: DateTime(1995),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              // This will add one year from current date
                              validator: (value) {
                                return null;
                              },
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    date = value;
                                  });
                                }
                              },
                              // We can also use onSaved
                              onSaved: (value) {
                                if (value!.isNotEmpty) {
                                  date = value;
                                }
                              },
                            ),
                          ),
                        ),
                        FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return Container(
                              width: double.infinity,
                              height: 60,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
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
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Text('Collected By'),
                                  ),
                                  value: collectedBy,
                                  items: receiptInfo!.data!.collectedByList!
                                      .map((data) {
                                    return DropdownMenuItem(
                                      value: data.id.toString(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(data.name.toString()),
                                      ),
                                      // onTap: (){
                                      //   setState(() {
                                      //     data.projects!.forEach((element) {
                                      //       listItems!.add(checkBoxClass(
                                      //           element.projectAmount,
                                      //           element.projectName.toString(),
                                      //           element.projectId));
                                      //     });
                                      //   });
                                      // },
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      collectedBy = newValue;

                                      clientVal = true;
                                    });
                                    print(collectedBy);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, bottom: 20),
                          child: mainItems(),
                        ),
                        Text('Total Amount :' + totalPrice.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (invoiceNumber.text.isEmpty) {
                              Common.toastMessaage(
                                  'Invoice Number Can not Empty', Colors.red);
                            } else if (client.text.isEmpty) {
                              Common.toastMessaage(
                                  'Client Name Cannot Empty', Colors.red);
                            } else if (date == null) {
                              Common.toastMessaage('Choose Date', Colors.red);
                            } else if (checkedItems.length == 0) {
                              Common.toastMessaage(
                                  'choose At least One Project', Colors.red);
                            } else if (collectedBy == null) {
                              Common.toastMessaage(
                                  'Choose Collected By', Colors.red);
                            } else {
                              Map<String, dynamic> body = {
                                "token": widget.token,
                                "invoiceId": widget.invoiceId,
                                "exDate": date,
                                "collectedBy": collectedBy,
                                "particularIds": checkedItems
                                    .map((e) => {
                                  "id": e.ids,
                                  "amount":
                                  _controllers[checkedAmount[e]].text,
                                })
                                    .toList(),
                                "totalAmount": totalPrice,
                              };
                              AddReceiptModel object =
                              await HttpService.addReceipt(body);
                              if (object.status == true) {
                                Common.toastMessaage(
                                    'Added Successfully', Colors.green);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ReceiptList(widget.token,'5')),
                                );
                              } else {
                                Navigator.pop(context);
                                Common.toastMessaage(
                                    'Something Went Wrong', Colors.red);
                              }
                              //print(body);

                            }
                          },
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.greenAccent,
                              shadowColor: Colors.blueAccent,
                              elevation: 5,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.greenAccent,
                                  Colors.blueAccent
                                ]),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 200,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
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

  textFeildFunction(hintname, controller, keyboardType) {
    return Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 5, offset: Offset(1, 1)),
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
                    controller: controller,
                    keyboardType: keyboardType,
                    decoration: InputDecoration(
                      hintText: hintname,
                      border: InputBorder.none,
                    )),
              ),
            ),
          ],
        ));
  }

  mainItems() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return chekBox(listItems![index], index);
      },
      itemCount: listItems!.length,
    );
  }

  chekBox(checkBoxClass obj, index) {
    _controllers.add(new TextEditingController(
        text: receiptInfo!.data!.particulars![index].particularAmount
            .toString()));
    checkedAmount[obj] = index;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CheckboxListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      obj.title.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    child: TextFormField(
                      controller: _controllers[index],
                      onChanged: (value) {
                        setState(() {
                          checkedItems.forEach((element) {
                            String? deductAmount = element.price;
                            totalPrice = int.parse(value);
                          });
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Amount',
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
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              value: checkedItems.contains(obj) ? true : false,
              onChanged: (bool? value) {
                if (value == true) {
                  setState(() {
                    totalPrice = 0;
                    checkedItems.add(obj);

                    checkedItems.forEach((element) {
                      totalPrice = (int.parse(element.price) + totalPrice!);
                    });
                  });
                } else {
                  setState(() {
                    totalPrice = 0;
                    checkedItems.remove(obj);
                    checkedItems.forEach((element) {
                      totalPrice = (int.parse(element.price) + totalPrice!);
                    });
                  });
                }
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          )
        ],
      ),
    );
  }
}

class checkBoxClass {
  checkBoxClass(this.price, this.title, this.ids, {this.chheckval: false});

  String? ids;
  bool? chheckval;
  String? title;
  var price;

  getChlk() {
    return chheckval;
  }

  gettitle() {
    return title;
  }

  getPrice() {
    return price;
  }

  updateChk(val) {
    chheckval = val;
  }
}
