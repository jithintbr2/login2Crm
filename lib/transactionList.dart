import 'package:crm_admin/addExpense.dart';
import 'package:crm_admin/transactionEdit.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'accounts.dart';
import 'addTransaction.dart';
import 'common.dart';
import 'dashboard.dart';
import 'httpService.dart';
import 'models/deleteTransactionModel.dart';
import 'models/expenseListModel.dart';
import 'models/transactionListModel.dart';

class TransactionList extends StatefulWidget {
  String? token;
  String? menuId;

  TransactionList(this.token,this.menuId);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  TransactionListModel? transactionList;
  String fromdate=DateTime(DateTime.now().year, DateTime.now().month,1).toString();
  String todate=DateTime.now().toString();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  bool? search=false;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(fromdate,todate);
  }

  getData(fromdate,todate) async {
    transactionList = await HttpService.transactionList(widget.token,fromdate,todate);
    if (transactionList != null) {
      if(search==true){Navigator.pop(context);}
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

        body: transactionList != null
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
                      height: 60,
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
                          "Transaction List",
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
                      height: 30,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width * 0.38,
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
                                        width: MediaQuery.of(context).size.width * 0.38,
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
                                            dateHintText: 'To Date',
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
                                      width: MediaQuery.of(context).size.width * 0.35,
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
                                          search=true;
                                          Common.showProgressDialog(context, "Loading..");
                                          getData(fromdate,todate);
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
                                                transactionList!.data!.totalAmount
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 24),
                        itemCount: transactionList!.data!.transactions!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => ProjectDetails(projectList!.data!.projectList![index].projectId,widget.token)),
                              // ),
                            },
                            // child: Container(
                            //   margin: const EdgeInsets.only(bottom: 12),
                            //   padding: const EdgeInsets.only(top: 16),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(5),
                            //     color: Colors.white,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.5),
                            //         spreadRadius: 4,
                            //         blurRadius: 6,
                            //         offset: const Offset(1, 1),
                            //       ),
                            //     ],
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(bottom: 15),
                            //     child: Row(
                            //       mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Padding(
                            //           padding:
                            //           const EdgeInsets.only(left: 10),
                            //           child: Container(
                            //             width: MediaQuery.of(context)
                            //                 .size
                            //                 .width *
                            //                 0.1,
                            //             child: CircleAvatar(
                            //               backgroundImage: AssetImage(
                            //                 'assets/images/expense_arrow_icon.png',
                            //               ),
                            //               radius: 15,
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //           width:
                            //           MediaQuery.of(context).size.width *
                            //               0.6,
                            //           child: Padding(
                            //             padding:
                            //             const EdgeInsets.only(left: 10),
                            //             child: Column(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //               crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //               children: [
                            //                 label(
                            //                   transactionList!
                            //                       .data!.transactions![index].date
                            //                       .toString(),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 5,
                            //                 ),
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(
                            //                       bottom: 5.0),
                            //                   child: Text('To '+
                            //                     transactionList!
                            //                         .data!
                            //                         .transactions![index]
                            //                         .toPerson
                            //                         .toString(),
                            //                     style: const TextStyle(
                            //                         fontSize: 14,
                            //                         fontWeight:
                            //                         FontWeight.bold),
                            //                   ),
                            //                 ),
                            //                 label(
                            //                   'From ' +
                            //                       transactionList!
                            //                           .data!
                            //                           .transactions![index]
                            //                           .fromPerson
                            //                           .toString()
                            //                 ),
                            //                 Row(
                            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                   children: [
                            //                     Expanded(
                            //                       child: Text(transactionList!.data!
                            //                           .transactions![index].remark
                            //                           .toString(),),
                            //                     ),
                            //                     Container(
                            //                       child: Row(
                            //
                            //                         children: [
                            //                           InkWell(
                            //                               onTap: (){
                            //                                 Navigator.push(
                            //                                   context,
                            //                                   MaterialPageRoute(
                            //                                       builder: (context) => TransactionEdit(widget.token,widget.menuId,
                            //                                           transactionList!.data!
                            //                                           .transactions![index].transactionId
                            //                                           .toString(),transactionList!.data!
                            //                                           .transactions![index].fromAccluntId
                            //                                           .toString(),transactionList!.data!
                            //                                           .transactions![index].amount
                            //                                           .toString(),transactionList!.data!
                            //                                           .transactions![index].toAccountId
                            //                                           .toString(),transactionList!.data!
                            //                                           .transactions![index].date
                            //                                           .toString(),transactionList!.data!
                            //                                           .transactions![index].remark
                            //                                           .toString(),transactionList!.data!
                            //                                           .transactions![index].day.toString(),transactionList!.data!
                            //                                           .transactions![index].month.toString(),transactionList!.data!
                            //                                           .transactions![index].year.toString())),
                            //                                 );
                            //                               },
                            //                               child: Icon(Icons.edit, color: Colors.blue,size: 20,)),
                            //                           SizedBox(width: 10,),
                            //                           InkWell(
                            //                               onTap: ()=>_dialogue(context,transactionList!.data!
                            //                                   .transactions![index].transactionId
                            //                                   .toString()),
                            //
                            //
                            //                               child: Icon(Icons.delete, color: Colors.red,size: 20,)),
                            //                         ],
                            //                       ),
                            //                     )
                            //
                            //
                            //                   ],
                            //                 )
                            //
                            //
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(
                            //               bottom: 5.0, right: 10),
                            //           child: Text(
                            //             '₹ ' +
                            //                 transactionList!
                            //                     .data!.transactions![index].amount
                            //                     .toString(),
                            //             style: const TextStyle(
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.bold,
                            //                 color: Colors.red),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
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
                                        transactionList!
                                            .data!.transactions![index].date
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
                                                    transactionList!
                                                        .data!
                                                        .transactions![index]
                                                        .toStaffImage
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
                                                'To '+transactionList!
                                                    .data!
                                                    .transactions![index]
                                                    .toPerson
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
                                                      transactionList!
                                                          .data!
                                                          .transactions![index]
                                                          .fromPerson
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
                                                  transactionList!
                                                      .data!
                                                      .transactions![index]
                                                      .remark
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
                                              onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TransactionEdit(widget.token,widget.menuId,
                                              transactionList!.data!
                                              .transactions![index].transactionId
                                              .toString(),transactionList!.data!
                                              .transactions![index].fromAccluntId
                                              .toString(),transactionList!.data!
                                              .transactions![index].amount
                                              .toString(),transactionList!.data!
                                              .transactions![index].toAccountId
                                              .toString(),transactionList!.data!
                                              .transactions![index].date
                                              .toString(),transactionList!.data!
                                              .transactions![index].remark
                                              .toString(),transactionList!.data!
                                              .transactions![index].day.toString(),transactionList!.data!
                                              .transactions![index].month.toString(),transactionList!.data!
                                              .transactions![index].year.toString())),
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
                                                      transactionList!
                                                          .data!
                                                          .transactions![index]
                                                          .transactionId
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
                                              transactionList!.data!
                                                  .transactions![index].amount
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
                    builder: (context) => AddTransaction(widget.token)),
              );
            },
            backgroundColor: const Color(0xFF2a52be),
            child: const Icon(Icons.add_box_outlined,size: 35,),
          ),
        ),
      ),
    );
  }
  void _dialogue(BuildContext context,transactionId) {
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

                    DeleteTransactionModel object =
                    await HttpService.deleteTransaction(transactionId,
                        widget.token);
                    if (object.status == true) {
                      Common.toastMessaage(
                          'Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TransactionList(widget.token,widget.menuId)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage(
                          'Something Went Wrong', Colors.red);
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
