import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

import 'common.dart';
import 'dashboard.dart';
import 'httpService.dart';
import 'listTask.dart';
import 'models/addTaskInfo.dart';
import 'models/addTaskModel.dart';

class AddTask extends StatefulWidget {
  String? token;
  String? userId;

  AddTask(this.token,this.userId);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController title = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController description = new TextEditingController();
  List<String>?descriptions;
  String? date=DateTime.now().toString();
  String? lastDate=DateTime.now().toString();
  var staff;
  var projects;
  bool isProject = false;
  AddTaskInfoModel? taskInfo;
  var countyCode='+91';
  bool phoneNumberCheck=false;
  String ?errorText='';


  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    descriptions=List<String>.empty(growable: true);
    descriptions!.add("");

  }

  getData() async {
    taskInfo = await HttpService.addTaskInfo();

    if (taskInfo != null) {
      setState(() {});
    }
  }
  GlobalKey <FormState> globalKey=GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {

    List<Widget> friendsTextFields = [];
    return Scaffold(

        body: uiWidget(),);
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
  Widget decriptionUi(index)
  {
    void addDescripionController(){
      setState(() {
        descriptions!.add("");
      });
    }
    void removeDescripionController(index){
      setState(() {
        if(descriptions!.length>0){
          descriptions!.removeAt(index);
        }

      });
    }
    return Row(
      children: [
        Container(
            width: 250,
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
                Icon(
                  Icons.description_outlined,
                  color: Colors.blue,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                        onSaved: (val) {
                          print(val);
                          descriptions![index]=val!;
                        },
                      //controller: description,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'description',
                          border: InputBorder.none,
                        )),
                  ),
                ),
              ],
            )),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: Icon(Icons.add_circle,color: Colors.green,), onPressed: () { addDescripionController(); },
            ),
          ),
          visible:index==descriptions!.length-1,

        ),
        // textFeildFunction(
        //     'description',
        //     description,
        //     TextInputType.text,
        //     Icon(
        //       Icons.description_outlined,
        //       color: Colors.blue,
        //     )),

        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: Icon(Icons.remove_circle,color: Colors.red,), onPressed: () { removeDescripionController(index); },
            ),
          ),
          visible: index>0,
        )

      ],
    );
  }
  Widget uiWidget()
  {
    Size size = MediaQuery.of(context).size;
    return new Form(
      key: globalKey,
      child: taskInfo != null
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
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListTask(
                                    widget.token,widget.userId,false
                                )),
                          );
                        },
                        child: Image.asset("assets/images/back_button.jpg",
                            width: 40),
                      ),
                      SizedBox(width: 50,),
                      Text(
                        "Add Task",
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
                      'Title',
                      title,
                      TextInputType.text,
                      Icon(
                        Icons.list_alt,
                        color: Colors.blue,
                      )),
                  Row(
                    children: [
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return Container(
                            width: 90,
                            height: 60,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
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
                                      Expanded(child: Text('c')),
                                    ],
                                  ),
                                ),
                                value: countyCode,
                                items: taskInfo!.data!.countryCodes!
                                    .map((data) {
                                  return DropdownMenuItem(
                                    value: data.code.toString(),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [

                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(data.code.toString()),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    countyCode = newValue!;
                                  });
                                  print(countyCode);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                          width: 180,
                          height: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                                      controller: phoneNumber,
                                      keyboardType:  TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'Contact Number ',
                                        border: InputBorder.none,
                                      ),onChanged: (text) => setState((){
                                    print('a');
                                    if(text.length>10){
                                      phoneNumberCheck=true;
                                      errorText='Phone Number Not Valid Please Remove country Code';
                                    }
                                    else
                                    {
                                      phoneNumberCheck=false;
                                      errorText='';
                                    }

                                  }),),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: () async {
                          final PhoneContact contact =
                          await FlutterContactPicker.pickPhoneContact();
                          if(contact != null){
                            String numbr = contact.phoneNumber!.number.toString();
                            phoneNumber.text = numbr.replaceAll(' ', '');

                            setState(() {
                              if(contact.phoneNumber!.number.toString().length>10)
                              {
                                phoneNumberCheck=true;
                                errorText='Phone Number Not Valid Please Remove country Code';
                              }
                              else
                              {
                                phoneNumberCheck=false;
                                errorText='';
                              }

                            });
                          }

                        },
                        child: Icon(
                          Icons.contact_phone,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  phoneNumberCheck==true?
                  Container(
                      width: double.infinity,
                      height: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(errorText.toString(),
                        style: TextStyle(color: Colors.red),)):Container(),

                  ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context,index)
                      {
                        return Column(
                          children: [
                            decriptionUi(index),
                          ],
                        );
                      },
                      separatorBuilder: (context,index)=>const Divider(),
                      itemCount: descriptions!.length
                  ),
                  //decriptionUi(0),
                  // Row(
                  //   children: [
                  //     Container(
                  //         width: 250,
                  //         height: 60,
                  //         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: Colors.white, width: 0),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                   color: Colors.grey, blurRadius: 5, offset: Offset(1, 1)),
                  //             ],
                  //             color: Colors.white,
                  //             borderRadius: const BorderRadius.all(Radius.circular(10))),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //             Icon(
                  //               Icons.description_outlined,
                  //               color: Colors.blue,
                  //             ),
                  //             Expanded(
                  //               child: Container(
                  //                 margin: const EdgeInsets.only(left: 10),
                  //                 child: TextFormField(
                  //                     controller: description,
                  //                     keyboardType: TextInputType.text,
                  //                     decoration: InputDecoration(
                  //                       hintText: 'description',
                  //                       border: InputBorder.none,
                  //                     )),
                  //               ),
                  //             ),
                  //           ],
                  //         )),
                  //     Visibility(
                  //       child: SizedBox(
                  //         width: 35,
                  //         child: IconButton(
                  //           icon: Icon(Icons.add_circle,color: Colors.green,), onPressed: () {  },
                  //         ),
                  //       ),
                  //
                  //     ),
                  //     // textFeildFunction(
                  //     //     'description',
                  //     //     description,
                  //     //     TextInputType.text,
                  //     //     Icon(
                  //     //       Icons.description_outlined,
                  //     //       color: Colors.blue,
                  //     //     )),
                  //
                  //     SizedBox(
                  //       width: 35,
                  //       child: IconButton(
                  //         icon: Icon(Icons.remove_circle,color: Colors.red,), onPressed: () {  },
                  //       ),
                  //     )
                  //
                  //   ],
                  // ),




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
                              padding:
                              const EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Staff Name'),
                                ],
                              ),
                            ),
                            value: staff,
                            items:
                            taskInfo!.data!.staffs!.map((data) {
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
                  CheckboxListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'is Project Based',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    value: isProject,
                    onChanged: (bool? value) {
                      if (value == true) {
                        setState(() {
                          isProject = true;
                        });
                      } else {
                        setState(() {
                          isProject = false;
                        });
                      }
                      print(isProject);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (isProject == true)
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
                                padding:
                                const EdgeInsets.only(left: 0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.description_sharp,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Project Name'),
                                  ],
                                ),
                              ),
                              value: projects,
                              items: taskInfo!.data!.projects!
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.projectId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20),
                                    child: Text(
                                        data.projectName.toString()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  projects = newValue;
                                });
                                print(projects);
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
                        border:
                        Border.all(color: Colors.white, width: 0),
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
                  Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.white, width: 0),
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
                          hintText: 'Last Date',
                        ),
                        initialValue: lastDate,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 0),

                        ),

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
                              lastDate = value;
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
                      if (title.text.isEmpty) {
                        Common.toastMessaage(
                            'Title cannot be empty', Colors.red);
                      }
                      else if (staff == null) {
                        Common.toastMessaage(
                            'Choose Staff Name', Colors.red);
                      }
                      else if (globalKey.currentState!.validate()) {
                        globalKey.currentState!.save();
                        Common.showProgressDialog(context, "Loading..");
                        Map<String, dynamic> body = {
                          "title": title.text,
                          "phone": phoneNumber.text,
                          "modules":descriptions,
                          "assignedTo": staff,
                          "isProject": isProject,
                          "projectId": projects,
                      "date1": date,
                      "lastDate": lastDate,
                      "token": widget.token,
                        };
                        print(body);
                        AddTaskModel object = await HttpService.addTask(body);
                        if (object.status == true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListTask(widget.token,widget.userId,false)),
                          );
                        } else {
                          Navigator.pop(context);
                          Common.toastMessaage(
                              'Something Went Wrong', Colors.red);
                        }
                        print(body);
                      }


                    //   if (title.text.isEmpty) {
                    //     Common.toastMessaage(
                    //         'Title cannot be empty', Colors.red);
                    //   }  else if (description.text.isEmpty) {
                    //     Common.toastMessaage(
                    //         'Description cannot be empty', Colors.red);
                    //   } else if (staff == null) {
                    //     Common.toastMessaage(
                    //         'Choose Staff Name', Colors.red);
                    //   } else if (date == null) {
                    //     Common.toastMessaage('choose Date', Colors.red);
                    //   } else if (lastDate == null) {
                    //     Common.toastMessaage(
                    //         'Choose Last Date', Colors.red);
                    //   } else {
                    //     Common.showProgressDialog(context, "Loading..");
                    //
                    //     AddTaskModel object = await HttpService.addTask(
                    //         title.text,
                    //         phoneNumber.text,
                    //         description.text,
                    //         staff,
                    //         isProject,
                    //         projects,
                    //         date,
                    //         lastDate,
                    //         widget.token);
                    //     if (object.status == true) {
                    //       Common.toastMessaage(
                    //           'Added Successfully', Colors.green);
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 ListTask(widget.token,widget.userId)),
                    //       );
                    //     } else {
                    //       Navigator.pop(context);
                    //       Common.toastMessaage(
                    //           'Something Went Wrong', Colors.red);
                    //     }
                    //   }
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
    );


  }

}

