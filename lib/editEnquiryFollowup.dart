
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'enquiryFollowupList.dart';
import 'httpService.dart';
import 'models/addFollowupInfoModel.dart';
import 'models/addFollowupModel.dart';
import 'models/editFollowupModel.dart';

class EditEnquiryFollowup extends StatefulWidget {
  String? token;
  String? followupId;
  String?followupDay;
  String?followupMonth;
  String?followupYear;
  String?nextFollowupDay;
  String?nextFollowupMonth;
  String?nextFollowupYear;
  String?status;
  String?remark;
  String?enquiryId;
  String?userId;
  EditEnquiryFollowup(this.token,this.followupId,this.followupDay,this.followupMonth,this.followupYear,
      this.nextFollowupDay,this.nextFollowupMonth,this.nextFollowupYear,this.status,this.remark,this.enquiryId,this.userId);

  @override
  _EditEnquiryFollowupState createState() => _EditEnquiryFollowupState();
}

class _EditEnquiryFollowupState extends State<EditEnquiryFollowup> {
  String? date;
  String ? nextFollowupDate;
  var status;
  TextEditingController remarks = new TextEditingController();
  AddFollowupInfoModel? followupInfo;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }

  getData() async {

    followupInfo = await HttpService.addFollowupInfo();
    status =widget.status;
    remarks.text=widget.remark.toString();
    date=DateTime(int.parse(widget.followupYear.toString()), int.parse(widget.followupMonth.toString()),int.parse(widget.followupDay.toString())).toString();;
    nextFollowupDate=DateTime(int.parse(widget.nextFollowupYear.toString()), int.parse(widget.nextFollowupMonth.toString()),int.parse(widget.nextFollowupDay.toString())).toString();;

    if (followupInfo != null) {
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
              builder: (context) => EnquiryFollowupList(widget.token,widget.enquiryId,widget.userId)),
        );
        return true;
      },
      child: Scaffold(

          body:  followupInfo != null
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnquiryFollowupList(widget.token,widget.enquiryId,widget.userId)),
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
                        "Followup Edit",
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
                            dateHintText: 'Date',
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
                            initialValue: nextFollowupDate,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.blue,
                              ),
                            ),

                            type: DateTimePickerType.date,
                            dateHintText: 'Next Follow up Date',
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
                                  nextFollowupDate = value;
                                });
                              }
                            },
                            // We can also use onSaved
                            onSaved: (value) {
                              if (value!.isNotEmpty) {
                                nextFollowupDate = value;
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
                                hint: Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Status'),
                                  ],
                                ),
                                value: status,
                                items: followupInfo!.data!
                                    .map((data) {
                                  return DropdownMenuItem(
                                    value: data.stsId.toString(),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.stacked_bar_chart,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(data.stsName
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    status = newValue;
                                  });
                                  print(status);
                                },
                              ),
                            ),
                          );
                        },
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
                          if (date == null) {
                            Common.toastMessaage(
                                'Choose Date', Colors.red);
                          } else if (nextFollowupDate == null) {
                            Common.toastMessaage(
                                'Choose next followup date', Colors.red);
                          }
                          else if (status == null) {
                            Common.toastMessaage(
                                'Choose Status', Colors.red);
                          } else {
                            Common.showProgressDialog(context, "Loading..");

                            EditFollowUpModel object =
                            await HttpService.editFollowup(
                                date,
                                nextFollowupDate,
                                status,
                                remarks.text,
                                widget.token,widget.followupId,widget.enquiryId);
                            if (object.status == true) {
                              Common.toastMessaage(
                                  'Added Successfully', Colors.green);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EnquiryFollowupList(widget.token,widget.enquiryId,widget.userId)),
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
          )
      ),
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
