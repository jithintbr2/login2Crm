
import 'package:crm_admin/transactionList.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'models/addTransactionInfoModel.dart';
import 'models/editTransactionModel.dart';

class TransactionEdit extends StatefulWidget {
  String? token;
  String? menuId;
  String? id;
  String? fromAccountId;
  String? amount;
  String? toAccountId;
  String? date;
  String? remarks;
  String? day;
  String? month;
  String? year;

  TransactionEdit(this.token,this.menuId,this.id,this.fromAccountId,this.amount,this.toAccountId,this.date,this.remarks,this
      .day,this.month,this.year);


  @override
  _TransactionEditState createState() => _TransactionEditState();
}

class _TransactionEditState extends State<TransactionEdit> {
  TextEditingController amount = new TextEditingController();
  TextEditingController remarks = new TextEditingController();
  String? sendBy;
  var sendTo;
  String? date;
  AddTransactionInfoModel? transactionInfo;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {

    transactionInfo = await HttpService.addTransactionInfo();
    sendBy =widget.fromAccountId;
    amount.text =widget.amount.toString();
    sendTo=widget.toAccountId;
    remarks.text=widget.remarks.toString();
    date=DateTime(int.parse(widget.year.toString()), int.parse(widget.month.toString()),int.parse(widget.day.toString())).toString();;


    if (transactionInfo != null) {
      setState(() {});
    }
  }
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: transactionInfo != null
            ?Container(
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
                onTap: () =>Navigator.of(context).pop(),
                child: Image.asset("assets/images/back_button.jpg",
                    width: 40),
              ),
            ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Transaction Edit",
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
                                child: Text('Send By'),
                              ),
                              value: sendBy,
                              items: transactionInfo!.data!.fromAccounts!
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.fromAccountId.toString(),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.account_balance,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(data.fromAccountName
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  sendBy = newValue;
                                });
                                print(sendBy);
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
                                    Text('Send to'),
                                  ],
                                ),
                              ),
                              value: sendTo,
                              items: transactionInfo!.data!.toAccounts!
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.toAccountId.toString(),
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
                                        Text(data.toAccountName.toString()),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  sendTo = newValue;
                                });
                                print(sendTo);
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
                          initialValue: date,
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.blue,
                            ),
                          ),

                          type: DateTimePickerType.date,
                          dateHintText: ' Date',
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
                        if (sendBy == null) {
                          Common.toastMessaage(
                              'Choose From Account', Colors.red);
                        } else if (amount.text.isEmpty) {
                          Common.toastMessaage(
                              'Expense Amount Can not Empty', Colors.red);
                        } else if (sendTo == null) {
                          Common.toastMessaage(
                              'Choose To Account', Colors.red);
                        } else if (date == null) {
                          Common.toastMessaage('Choose Date', Colors.red);
                        } else {
                          Common.showProgressDialog(context, "Loading..");

                          EditTransactionModel object =
                          await HttpService.editTransaction(
                              sendBy,
                              amount.text,
                              sendTo,
                              date,
                              remarks.text,
                              widget.token,widget.id);
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

          ],
        ),
            ):
        AlertDialog(
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
        )
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
