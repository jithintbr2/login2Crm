
import 'package:crm_admin/projectDetails.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'models/addWorkAssignModel.dart';
import 'models/addWorkInfoModel.dart';

class AddWork extends StatefulWidget {
  String? token;
  String? projectId;
  AddWork(this.token,this.projectId);


  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  TextEditingController module = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController subModule = new TextEditingController();
  TextEditingController hrs = new TextEditingController(text: '0');
  TextEditingController mints = new TextEditingController(text: '0');
  var staff;
  String? date=DateTime.now().toString();
  AddWorkInfoModel? workInfo;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    workInfo = await HttpService.addWorkInfo();

    if (workInfo != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body:  workInfo != null
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
                          onTap: () =>Navigator.of(context).pop(),
                          child: Image.asset(
                              "assets/images/back_button.jpg",
                              width: 40),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Add Work",
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
                    textFeildFunction('Module', module,
                        TextInputType.text, true,Icon(
                          Icons.list,
                          color: Colors.blue,
                        )),


                    textFeildFunction('Description', description,
                        TextInputType.text, true,Icon(
                          Icons.description_outlined,
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
                              hint: Row(

                                children: [
                                  Icon(
                                    Icons.web,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Staff Name'),
                                ],
                              ),
                              value:  staff,
                              items:
                              workInfo!.data!.map((data) {
                                return DropdownMenuItem(
                                  value: data.userId.toString(),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 20),
                                    child:
                                    Text(data.staffName.toString()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  staff = newValue;
                                });
                                print(staff);
                              },
                            ),
                          ),
                        );
                      },
                    ),

                    textFeildFunction(
                        'Sub Module', subModule, TextInputType.text, true,Icon(
                      Icons.details,
                      color: Colors.blue,
                    )),


                      textFeildFunction('Hrs', hrs,
                          TextInputType.number, true,Icon(
                            Icons.timer,
                            color: Colors.blue,
                          )),
                    textFeildFunction(
                        'Minuts', mints, TextInputType.text, true,Icon(
                      Icons.timer,
                      color: Colors.blue,
                    )),
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
                          dateHintText: 'From Date',
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




                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (module.text.isEmpty) {
                          Common.toastMessaage(
                              'Module Name cannot be empty', Colors.red);
                        } else if (staff == null) {
                          Common.toastMessaage('Choose Staff Name', Colors.red);
                        }   else if (subModule.text.isEmpty) {
                          Common.toastMessaage(
                              'Sub Module cannot be empty', Colors.red);
                        }
                        else if (hrs.text.isEmpty) {
                          Common.toastMessaage(
                              'Hrs cannot be empty', Colors.red);
                        }
                        else if (date==null) {
                          Common.toastMessaage(
                              'Choose Date', Colors.red);
                        }else {
                          Common.showProgressDialog(context, "Loading..");

                          AddWorkAssignModel object =
                          await HttpService.addWorkAssign(
                              module.text,
                              staff,
                              description.text,
                              subModule.text,
                              hrs.text,
                              mints.text,
                              date,widget.projectId,
                              widget.token);
                          if (object.status == true) {
                            Common.toastMessaage(
                                'Added Successfully', Colors.green);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProjectDetails(widget.projectId,widget.token,0)),
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
                    SizedBox(
                      height: 30,
                    )
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
            );
  }

  textFeildFunction(hintname, controller, keyboardType, enable,icon) {
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

}