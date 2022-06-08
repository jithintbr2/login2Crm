import 'package:crm_admin/addExpense.dart';
import 'package:crm_admin/editExpense.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'common.dart';
import 'dashboard.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'models/deleteExpenseModel.dart';
import 'models/expenseListModel.dart';

class ExpenseList extends StatefulWidget {
  String? token;
  String? menuId;

  ExpenseList(this.token, this.menuId);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  ExpenseListModel? expenseList;
  String fromdate =
      DateTime(DateTime.now().year, DateTime.now().month, 1).toString();
  String todate = DateTime.now().toString();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  bool? search = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(fromdate, todate);
  }

  getData(fromdate, todate) async {
    expenseList = await HttpService.expenseList(widget.token, fromdate, todate);
    if (expenseList != null) {
      if (search == true) {
        Navigator.pop(context);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: expenseList != null
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
                          height: 50,
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
                                        builder: (context) =>
                                            HomePage(widget.token, 0)),
                                    (Route<dynamic> route) => false);
                              },
                              child: Image.asset(
                                  "assets/images/back_button.jpg",
                                  width: 40),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "Expense List",
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
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 13),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.38,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 10),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
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
                                                borderRadius:
                                                    const BorderRadius.all(
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.38,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 10),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
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
                                                borderRadius:
                                                    const BorderRadius.all(
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
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
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
                                              color: Color(0xffE7E3D0),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: FlatButton(
                                            onPressed: () async {
                                              search = true;
                                              Common.showProgressDialog(
                                                  context, "Loading..");
                                              getData(fromdate, todate);
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
                                      ),
                                      Divider(
                                        color: Colors.black,
                                        thickness: 0.2,
                                      ),
                                      Center(
                                        child: Container(
                                            child: Column(
                                          children: [
                                            label('Total'),
                                            info1('₹ ' +
                                                expenseList!.data!.totalExpense
                                                    .toString()),
                                          ],
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 24),
                            itemCount: expenseList!.data!.expense!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => {},
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 200,
                                          child: Text(
                                            expenseList!
                                                .data!.expense![index].date
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              constraints: const BoxConstraints(
                                                minHeight: 20,
                                                minWidth: 20,
                                                maxHeight: 50,
                                                maxWidth: 50,
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
                                                    image: NetworkImage(
                                                        expenseList!
                                                            .data!
                                                            .expense![index]
                                                            .expenseImage
                                                            .toString())),
                                                // image: AssetImage(
                                                //     'assets/images/img.jpeg')),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    expenseList!
                                                        .data!
                                                        .expense![index]
                                                        .expenseHead
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.deepOrange)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Text(
                                                      'From ' +
                                                          expenseList!
                                                              .data!
                                                              .expense![index]
                                                              .fromAccount
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black)),
                                                ),
                                                Container(
                                                  width: 200,
                                                  child: Text(
                                                      expenseList!
                                                          .data!
                                                          .expense![index]
                                                          .remarks
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => EditExpense(
                                                                  widget.token,
                                                                  widget.menuId,
                                                                  expenseList!.data!.expense![index].id.toString(),
                                                                  expenseList!.data!.expense![index].fromAccountId
                                                                      .toString(),
                                                                  expenseList!.data!.expense![index].expenseTypeId
                                                                      .toString(),
                                                                  expenseList!
                                                                      .data!
                                                                      .expense![
                                                                          index]
                                                                      .amount
                                                                      .toString(),
                                                                  expenseList!.data!.expense![index].toAccountId
                                                                      .toString(),
                                                                  expenseList!
                                                                      .data!
                                                                      .expense![
                                                                          index]
                                                                      .date
                                                                      .toString(),
                                                                  expenseList!
                                                                      .data!
                                                                      .expense![
                                                                          index]
                                                                      .remarks
                                                                      .toString(),
                                                                  expenseList!
                                                                      .data!
                                                                      .expense![
                                                                          index]
                                                                      .day
                                                                      .toString(),
                                                                  expenseList!
                                                                      .data!
                                                                      .expense![
                                                                          index]
                                                                      .month
                                                                      .toString(),
                                                                  expenseList!
                                                                      .data!
                                                                      .expense![
                                                                          index]
                                                                      .year
                                                                      .toString())),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: Colors.blue,
                                                        size: 20,
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: () => _dialogue(
                                                          context,
                                                          expenseList!
                                                              .data!
                                                              .expense![index]
                                                              .id
                                                              .toString()),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size: 20,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.monetization_on,
                                                    color: Colors.orange,
                                                    size: 20),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  expenseList!.data!
                                                      .expense![index].amount
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
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
                  builder: (context) => AddExpense(widget.token, widget.menuId)),
            );
          },
          backgroundColor: const Color(0xFF2a52be),
          child: const Icon(Icons.add_box_outlined,size: 35,),
        ),
      ),
    );
  }

  void _dialogue(BuildContext context, expenseId) {
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
                    DeleteExpenseModel object = await HttpService.deleteExpense(
                        expenseId, widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ExpenseList(widget.token, widget.menuId)),
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
    overflow: TextOverflow.ellipsis,
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
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget info1(String infoText, {Color color = Colors.blueAccent}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Text(
      infoText,
      style: TextStyle(
        color: color,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
