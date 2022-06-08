import 'package:flutter/material.dart';

import 'common.dart';
import 'dashboard.dart';
import 'debitCredit.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'models/debitCreditInfoModel.dart';
import 'models/pendingExpenseModel.dart';

class PendingExpense extends StatefulWidget {
  String? token;
  PendingExpense(this.token);
  @override
  _PendingExpenseState createState() => _PendingExpenseState();
}

class _PendingExpenseState extends State<PendingExpense> {
  var account;
  bool search=false;
  DebitCreditInfoModel? accountInfo;
  PendingExpenseModel? pendingExpense;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(account);
  }
  getData(account) async {
    pendingExpense =
    await HttpService.pendingExpense(account,widget.token);
    if (pendingExpense != null) {
      accountInfo =
      await HttpService.debitCreditInfo();
      if(search==true){Navigator.pop(context);}
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) =>
                    HomePage(widget.token, 0)),
                (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(

        body: accountInfo != null
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
                      height: 70,
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
                                        HomePage(widget.token,0)),
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
                          "Pending Expense",
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
                        FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.6,
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
                                  accountInfo!.data!.map((data) {
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

                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.3,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 5),
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
                              getData(account);
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
                    SizedBox(height: 20,) ,
                    Container(width: MediaQuery.of(context).size.width * 0.9,child: Text('Total Amount : '
                        +pendingExpense!.data!.totalAmount.toString(),textAlign: TextAlign.end,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red),)),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(5),
                            1: FlexColumnWidth(20),
                            2: FlexColumnWidth(10),

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
                                child: Center(child: Text("Sl No",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                child: Center(child: Text('Accounts',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                child: Center(child: Text('Amount',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                              ),

                            ]),
                            for (int i = 0;
                            i < pendingExpense!.data!.expenses!.length;
                            i++)
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7),
                                child: Center(child: Text(pendingExpense!.data!.expenses![i].sNo.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 20),
                                child: Text(pendingExpense!.data!.expenses![i].person.toString(),textAlign:TextAlign.start,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 10,right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(child: Text(pendingExpense!.data!.expenses![i].amount.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                                    InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => DebitCredit(widget.token,pendingExpense!.data!.expenses![i].accountId.toString())),
                                          );
                                        },
                                        child: Icon(Icons.remove_red_eye, color: Colors.blue,size: 20,)),
                                  ],
                                ),
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

      ),
    );
  }
}
