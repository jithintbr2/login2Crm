import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'dashboard.dart';
import 'httpService.dart';
import 'listTask.dart';
import 'models/addTaskInfo.dart';
import 'models/addTaskModel.dart';
import 'models/deleteTaskDescriptionModel.dart';
import 'models/editTaskDescriptionModel.dart';
import 'models/editTaskInfoModel.dart';

class EditTask extends StatefulWidget {
  String? token;
  String? userId;
  String? taskId;
  bool ? allStatus;

  EditTask(this.token,this.userId,this.taskId,this.allStatus);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController title = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController descriptionEdit = new TextEditingController();
  List<String>?descriptions;
  String? date=DateTime.now().toString();
  String? lastDate=DateTime.now().toString();
  var staff;
  var projects;
  bool isProject = false;
  EditTaskInfoModel? taskInfo;


  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    descriptions=List<String>.empty(growable: true);
    descriptions!.add("");

  }

  getData() async {
    taskInfo = await HttpService.editTaskInfo(widget.taskId,widget.token);
    title.text=taskInfo!.data!.title.toString();
    phoneNumber.text=taskInfo!.data!.phoneNo.toString();
    staff=taskInfo!.data!.staffId;
    isProject=taskInfo!.data!.isProject!;
    projects=taskInfo!.data!.ptojectId;

    date=DateTime(int.parse(taskInfo!.data!.dateDay.toString()), int.parse(taskInfo!.data!.dateMonth.toString()),int.parse(taskInfo!.data!.dateYear.toString())).toString();;
    lastDate=DateTime(int.parse(taskInfo!.data!.lastDateDay.toString()), int.parse(taskInfo!.data!.lastDateMonth.toString()),int.parse(taskInfo!.data!.lastDateYear.toString())).toString();;


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
                                    widget.token,widget.userId,widget.allStatus
                                )),
                          );
                        },
                        child: Image.asset("assets/images/back_button.jpg",
                            width: 40),
                      ),
                      SizedBox(width: 50,),
                      Text(
                        "Edit Task",
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
                  textFeildFunction(
                      'Phone Number',
                      phoneNumber,
                      TextInputType.text,
                      Icon(
                        Icons.phone_android,
                        color: Colors.blue,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(20),
                          2: FlexColumnWidth(5),
                          3: FlexColumnWidth(5),

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
                                  child: Center(child: Text('Description',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Center(child: Text('',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Center(child: Text('',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                ),

                              ]),
                          for (int i = 0;
                          i < taskInfo!.data!.description!.length;
                          i++)
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7),
                                child: Center(child: Text(taskInfo!.data!.description![i].slNo.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 20),
                                child: Text(taskInfo!.data!.description![i].descriptions.toString(),textAlign:TextAlign.start,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 10,right: 10),
                                child: InkWell(
                                     onTap: ()=>_editDialogue(
                                         context,
                                         taskInfo!
                                             .data!.description![i].id
                                             .toString(),taskInfo!
                                         .data!.description![i].descriptions
                                         .toString()),
                                     child: Icon(Icons.edit, color: Colors.blue,size: 20,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7,bottom: 7,left: 10,right: 10),
                                child: taskInfo!
      .data!.description![i].isCompleted
      .toString()=='N'?InkWell(
                                    onTap: ()=>_deleteDialogue(
                                        context,
                                        taskInfo!
                                            .data!.description![i].id
                                            .toString()),
                                    child: Icon(Icons.delete, color: Colors.red,size: 20,)):Icon(Icons.check, color: Colors.green,size: 20,)
                              ),

                            ]),







                        ]),
                  ),
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
                            taskInfo!.data!.staffList!.map((data) {
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
                              items: taskInfo!.data!.projectList!
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.id.toString(),
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
                          "taskId":widget.taskId
                        };
                        print(body);
                        AddTaskModel object = await HttpService.editTask(body);
                        if (object.status == true) {
                          Common.toastMessaage(
                              'Added Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListTask(widget.token,widget.userId,widget.allStatus)),
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
  void _editDialogue(BuildContext context, descriptionId,description) {
    descriptionEdit.text=description.toString();
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                        child: TextFormField(maxLines: 5,
                            controller: descriptionEdit,
                            decoration: InputDecoration(

                              border: InputBorder.none,
                            )),
                      ),
                    ),
                  ],
                )),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    // print('task id :'+taskId);

                    EditTaskDescriptionModel object =
                    await HttpService.editTaskDescription(descriptionId, descriptionEdit.text,widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditTask(widget.token, widget.userId,widget.taskId,widget.allStatus)),
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
  void _deleteDialogue(BuildContext context, descriptionId) {

    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Do You Want to Delete?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    // print('task id :'+taskId);

                    DeleteTaskDescriptionModel object =
                    await HttpService.deleteTaskDescription(descriptionId,widget.token);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditTask(widget.token, widget.userId,widget.taskId,widget.allStatus)),
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

