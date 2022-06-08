import 'package:crm_admin/accounts.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'common.dart';
import 'httpService.dart';
import 'models/addExpenseInfoModel.dart';
import 'models/addExpenseModel.dart';

class AddExpense extends StatefulWidget {
  String? token;
  String? menuId;
  AddExpense(this.token,this.menuId);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController amount = new TextEditingController();
  TextEditingController remarks = new TextEditingController();
  String? fromAccount;
  var expenseType;
  var person;
  String? date=DateTime.now().toString();
  AddExpenseInfoModel? expenseInfo;
  List<selectBoxClass>? listItems;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    listItems = [];
  }

  getData() async {

    expenseInfo = await HttpService.addExpenseInfo(widget.token);
    fromAccount =expenseInfo!.data!.myAccountId;
    expenseInfo!.data!.expenseType!.forEach((element) {
      listItems!.add(selectBoxClass(element.typeId, element.typeName));
    });

    if (expenseInfo != null) {
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

          body: expenseInfo != null
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
                              "Add Expense",
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
                                        child: Text('From Account'),
                                      ),
                                      value: fromAccount,
                                      items: expenseInfo!.data!.fromAccount!
                                          .map((data) {
                                        return DropdownMenuItem(
                                          value: data.fromId.toString(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.account_balance,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(data.fromStaffName
                                                    .toString()),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          fromAccount = newValue;
                                        });
                                        print(fromAccount);
                                      },
                                    ),
                                  ),
                                );
                              },
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
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.account_balance,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Expense Type'),
                                          ],
                                        ),
                                      ),
                                      value: expenseType,
                                      items: expenseInfo!.data!.expenseType!
                                          .map((data) {
                                        return DropdownMenuItem(
                                          value: data.typeId.toString(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.description,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(data.typeName.toString()),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          expenseType = newValue;
                                        });
                                        print(expenseType);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            textFeildFunction(
                                'Amount',
                                amount,
                                TextInputType.number,
                                Icon(
                                  Icons.monetization_on,
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
                                              Icons.person,
                                              color: Colors.blue,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Person/Company'),
                                          ],
                                        ),
                                      ),
                                      value: person,
                                      items: expenseInfo!.data!.toAccount!
                                          .map((data) {
                                        return DropdownMenuItem(
                                          value: data.toId.toString(),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.blue,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(data.toStaffName.toString()),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          person = newValue;
                                        });
                                        print(person);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
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
                                  decoration: InputDecoration(
                                    icon:  Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                                    border: InputBorder.none,
                                    hintText: 'Date',
                                  ),
                                  initialValue: date,
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
                            textFeildFunction(
                                'Remarks',
                                remarks,
                                TextInputType.text,
                                Icon(
                                  Icons.list,
                                  color: Colors.blue,
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (fromAccount == null) {
                                  Common.toastMessaage(
                                      'Choose From Account', Colors.red);
                                } else if (expenseType == null) {
                                  Common.toastMessaage(
                                      'Choose Expense Type', Colors.red);
                                } else if (amount.text.isEmpty) {
                                  Common.toastMessaage(
                                      'Expense Amount Can not Empty', Colors.red);
                                } else if (person == null) {
                                  Common.toastMessaage(
                                      'Choose Person/Company', Colors.red);
                                } else if (date == null) {
                                  Common.toastMessaage('Choose Date', Colors.red);
                                } else {
                                  Common.showProgressDialog(context, "Loading..");

                                  AddExpenseModel object =
                                  await HttpService.addExpense(
                                      fromAccount,
                                      expenseType,
                                      amount.text,
                                      person,
                                      date,
                                      remarks.text,
                                      widget.token);
                                  if (object.status == true) {
                                    Common.toastMessaage(
                                        'Added Successfully', Colors.green);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddExpense(widget.token,widget.menuId)),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    Common.toastMessaage(
                                        'Something Went Wrong', Colors.red);
                                  }
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
                          ],
                        ),
                      ),
                      // Align(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(0),
                      //     child: Container(
                      //       height: 50,
                      //       width: MediaQuery.of(context).size.width * 7,
                      //       color: Colors.white,
                      //       child: FlatButton(
                      //         color: Colors.green,
                      //         onPressed: () async {
                      //           if (fromAccount == null) {
                      //             Common.toastMessaage(
                      //                 'Choose From Account', Colors.red);
                      //           } else if (expenseType == null) {
                      //             Common.toastMessaage(
                      //                 'Choose Expense Type', Colors.red);
                      //           } else if (amount.text.isEmpty) {
                      //             Common.toastMessaage(
                      //                 'Expense Amount Can not Empty', Colors.red);
                      //           } else if (person == null) {
                      //             Common.toastMessaage(
                      //                 'Choose Person/Company', Colors.red);
                      //           } else if (date == null) {
                      //             Common.toastMessaage('Choose Date', Colors.red);
                      //           } else {
                      //             Common.showProgressDialog(context, "Loading..");
                      //
                      //             AddExpenseModel object =
                      //                 await HttpService.addExpense(
                      //                     fromAccount,
                      //                     expenseType,
                      //                     amount.text,
                      //                     person,
                      //                     date,
                      //                     remarks.text,
                      //                     widget.token);
                      //             if (object.status == true) {
                      //               Common.toastMessaage(
                      //                   'Added Successfully', Colors.green);
                      //               Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (context) =>
                      //                         AddExpense(widget.token,widget.menuId)),
                      //               );
                      //             } else {
                      //               Navigator.pop(context);
                      //               Common.toastMessaage(
                      //                   'Something Went Wrong', Colors.red);
                      //             }
                      //           }
                      //         },
                      //         child: Text(
                      //           'Submit',
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 20),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   alignment: Alignment.bottomCenter,
                      // ),
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
                )),
    );
  }

  textFeildFunction(hintName, controller, keyboardType, icon) {
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
                      hintText: hintName,
                      border: InputBorder.none,
                    )),
              ),
            ),
          ],
        ));
  }
}
class selectBoxClass {
  selectBoxClass(this.id, this.title);

  int? id;
  String? title;

  gettitle() {
    return title;
  }


}