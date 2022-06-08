import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'dashboard.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'models/debitCreditInfoModel.dart';
import 'models/debitCreditModel.dart';

class DebitCredit extends StatefulWidget {
  String? token;
  String? accountId;
  DebitCredit(this.token,this.accountId);
  @override
  _DebitCreditState createState() => _DebitCreditState();
}

class _DebitCreditState extends State<DebitCredit> {

  String fromdate=DateTime(DateTime.now().year, DateTime.now().month,1).toString();
  String todate=DateTime.now().toString();
  TextEditingController fromDate = new TextEditingController();
  TextEditingController toDate = new TextEditingController();
  bool? search=false;
  var account;
  DebitCreditInfoModel? debitCreditInfo;
  DebitCreditModel? debitCredit;

  void initState() {
    // TODO: implement initState
    super.initState();
    account=widget.accountId;
    getData(fromdate,todate,account);
  }

  getData(fromdate,todate,account) async {
    debitCredit =
    await HttpService.debitCredit(fromdate,todate,account,widget.token);
    if (debitCredit != null) {
      debitCreditInfo =
      await HttpService.debitCreditInfo();
      if(search==true){Navigator.pop(context);}
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: debitCredit != null
          ?Container(
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
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                      widget.token,0)),
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
                        "Debit Credit",
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
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.44,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
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
                                lastDate: DateTime.now().add(Duration(days: 365)),
                                // This will add one year from current date
                                validator: (value) {
                                  return null;
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      fromdate= value;
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
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.44,
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
                                lastDate: DateTime.now().add(Duration(days: 365)),
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

                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [


                          FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.44,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
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
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text('Person'),
                                    ),
                                    value: account,
                                    items:
                                    debitCreditInfo!.data!.map((data) {
                                      return DropdownMenuItem(
                                        value: data.accountId.toString(),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 20),
                                          child:
                                          Text(data.accountName.toString()),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        account = newValue;
                                      });
                                      print(account);
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.44,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
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
                            getData(fromdate,todate,account);
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

                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text("Total Credit Amount :"+debitCredit!.data!.totalCredit.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 15,fontWeight:FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Total Debit Amount :"+debitCredit!.data!.totalDebit.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 15,fontWeight:FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Total "+debitCredit!.data!.balance.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 15,fontWeight:FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(4),
                          1: FlexColumnWidth(10),
                          2: FlexColumnWidth(10),
                          3: FlexColumnWidth(10),
                          4: FlexColumnWidth(5),

                        },
                        border: TableBorder.all(
                            color: Colors.black38,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(
                              decoration: new BoxDecoration(color: Colors.greenAccent),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Center(child: Text("No",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Center(child: Text('Date',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Center(child: Text('Debit',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Center(child: Text('Credit',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Center(child: Text('',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),

                              ]),
                          for (int i = 0;
                          i < debitCredit!.data!.debitCredit!.length;
                          i++)
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7),
                                child: Center(child: debitCredit!.data!.debitCredit![i].slNo==0?Text(''):Text(debitCredit!.data!.debitCredit![i].slNo
                                    .toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 5),
                                child: Text(debitCredit!.data!.debitCredit![i].date
                                    .toString(),textAlign:TextAlign.start,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 5,right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(child: Row(
                                      children: [
                                        if(debitCredit!.data!.debitCredit![i].debitAmount
                                            .toString()!='')
                                          Icon(
                                            Icons.arrow_downward,
                                            color: Colors.red,
                                          ),
                                        Text(debitCredit!.data!.debitCredit![i].debitAmount
                                            .toString(),style: TextStyle(color: Colors.red),),
                                      ],
                                    )),
                                    // InkWell(
                                    //     onTap: (){
                                    //       Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) => DebitCredit(widget.token,pendingExpense!.data!.expenses![i].accountId.toString())),
                                    //       );
                                    //     },
                                    //     child: Icon(Icons.remove_red_eye, color: Colors.blue,size: 20,)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 5,right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(child:  Row(
                                      children: [
                                        if(debitCredit!.data!.debitCredit![i].creditAmount
                                            .toString()!='')
                                          Icon(
                                            Icons.arrow_upward,
                                            color: Colors.green,
                                          ),




                                        Text(debitCredit!.data!.debitCredit![i].creditAmount
                                            .toString(),style: TextStyle(color: Colors.green),),
                                      ],
                                    )),
                                    // InkWell(
                                    //     onTap: (){
                                    //       Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (context) => DebitCredit(widget.token,pendingExpense!.data!.expenses![i].accountId.toString())),
                                    //       );
                                    //     },
                                    //     child: Icon(Icons.remove_red_eye, color: Colors.blue,size: 20,)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 10,right: 10),
                                child: InkWell(
                                    onTap: ()=>_dialogue(context,debitCredit!.data!.debitCredit![i].remark
        .toString(),debitCredit!.data!.debitCredit![i].person
                                        .toString(),debitCredit!.data!.debitCredit![i].createdBy
                                        .toString()),


                                    child: Icon(Icons.remove_red_eye, color: Colors.red,size: 20,)),

                              ),







                            ]),







                        ]),
                  ),
                ],
              ),
            ),




        ],
      ),
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
  void _dialogue(BuildContext context,remark,person,createdBy) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Details'),
            content: Container(
              height: 150,
              // child: Column(
              //   children: [
              //     Text('Remark: '+remark),
              //     SizedBox(height: 10,),
              //     Text('Person: '+person),
              //     SizedBox(height: 10,),
              //     Text('Created by: '+createdBy),
              //   ],
              // ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(10),
                      1: FlexColumnWidth(20),



                    },
                    border: TableBorder.all(
                        color: Colors.black38,
                        style: BorderStyle.solid,
                        width: 1),
                    children: [
                      TableRow(

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Center(child: Text("Person",style: TextStyle(fontSize: 13),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Center(child: Text(person,style: TextStyle(fontSize: 13),)),
                            ),




                          ]),
                      TableRow(

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Center(child: Text("Created By",style: TextStyle(fontSize: 13),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Center(child: Text(createdBy,style: TextStyle(fontSize: 13,),)),
                            ),




                          ]),
                      TableRow(

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Center(child: Text("Remark",style: TextStyle(fontSize: 13,),)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Center(child: Text(remark,style: TextStyle(fontSize: 13,),)),
                            ),




                          ]),








                    ]),
              ),
            ),
            actions: [
              // The "Yes" button

              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        });
  }
}
