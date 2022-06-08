import 'package:flutter/material.dart';
import 'accounts.dart';
import 'common.dart';
import 'httpService.dart';
import 'models/addInvoiceInfoModel.dart';
import 'models/addInvoiceModel.dart';
import 'models/clientProjectsModel.dart';

class AddInvoice extends StatefulWidget {
  String? token;
  String? menuId;

  AddInvoice(this.token,this.menuId);

  @override
  _AddInvoiceState createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  TextEditingController invoiceNumber = new TextEditingController();
  TextEditingController remarks = new TextEditingController();
  TextEditingController totalAmount = new TextEditingController(text: '0');
  var client;
  AddInvoiceInfoModel? invoiceInfo;
  ClientProjectsModel? clientProjects;
  bool val = false;
  List<checkBoxClass>? listItems;
  List<checkBoxClass> checkedItems = [];

  //
  int? totalPrice=0;
  List<checkBoxClass>? ids;
  bool clientVal = false;

  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
    listItems = [];
  }

  getData() async {
    invoiceInfo = await HttpService.addInvoiceInfo();
    invoiceNumber = new TextEditingController(
        text: invoiceInfo!.data!.invoiceId.toString());

    if (invoiceInfo != null) {
      setState(() {});
    }
  }

  getClientProjects(clientId) async {
    clientProjects = await HttpService.clientProjects(clientId);
    print(clientProjects);

    if (clientProjects != null) {

      clientProjects!.data!.forEach((element) {
        listItems!.add(checkBoxClass(element.projectAmount,
            element.projectName.toString(), element.projectId));
      });

      setState(() {
        print(listItems!.length);
      });
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

        body: invoiceInfo != null
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
                    Positioned(
                      top: 50,
                      left: 20,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Accounts(widget.token,widget.menuId,0)),
                          );
                        },
                        child: Image.asset("assets/images/back_button.jpg",
                            width: 40),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Add invoice",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 1,
                                fontFamily: "Lobster"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          textFeildFunction(
                              'Invoice Number', invoiceNumber, TextInputType.text,Icon(
                            Icons.post_add_rounded,
                            color: Colors.blue,
                          )),
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
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.person_pin_outlined,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Client Name'),
                                        ],
                                      ),
                                    ),
                                    value: client,
                                    items: invoiceInfo!.data!.clientList!
                                        .map((data) {
                                      return DropdownMenuItem(
                                        value: data.clientId.toString(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person_pin_outlined,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.clientName.toString()),
                                            ],
                                          ),
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
                                        client = newValue;
                                        listItems = [];
                                        getClientProjects(client);
                                        clientVal = true;
                                      });
                                      print(client);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),

                          if (listItems!.length > 0)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10),
                              child: mainItems(),
                            ),
                          textFeildFunction('Remarks', remarks, TextInputType.text,Icon(
                            Icons.note,
                            color: Colors.blue,
                          )),
                          SizedBox(
                            height: 30,
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
                              } else if (client == null) {
                                Common.toastMessaage(
                                    'Choose Client Name', Colors.red);
                              } else if (checkedItems.length == 0) {
                                Common.toastMessaage(
                                    'choose Atleast One Project', Colors.red);
                              }  else {
                                Map<String, dynamic> body = {
                                  "token": widget.token,
                                  "clientId": client,
                                  "projectIds":
                                  checkedItems.map((e) => e.ids).toList(),
                                  "totalAmount": totalAmount.text,
                                  "remark": remarks.text,
                                };
                                AddInvoiceModel object =
                                await HttpService.addInvoice(body);
                                if (object.status == true) {
                                  Common.toastMessaage(
                                      'Added Successfully', Colors.green);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddInvoice(widget.token,widget.menuId)),
                                  );
                                } else {
                                  Navigator.pop(context);
                                  Common.toastMessaage(
                                      'Something Went Wrong', Colors.red);
                                }
                                print(body);
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
                          ),
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
      ),
    );
  }

  textFeildFunction(hintname, controller, keyboardType,icon) {
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
            icon,
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
        return chekBox(listItems![index]);
      },
      itemCount: listItems!.length,
    );
  }

  chekBox(checkBoxClass obj) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CheckboxListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    obj.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    obj.price.toString() + '/-',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
              value: checkedItems.contains(obj) ? true : false,
              onChanged: (bool? value) {
                if (value == true) {
                  setState(() {
                    totalPrice = 0;
                    checkedItems.add(obj);
                    checkedItems.forEach((element) {
                      totalPrice = element.price! + totalPrice!;

                    });
                  });
                } else {
                  setState(() {
                    totalPrice = 0;
                    checkedItems.remove(obj);
                    checkedItems.forEach((element) {
                      totalPrice = element.price! + totalPrice!;

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

  int? ids;
  bool? chheckval;
  String? title;
  int? price;

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
