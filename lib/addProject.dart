import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'models/addProjectInfoModel.dart';
import 'models/addProjectModel.dart';
import 'models/milestoneInfoModel.dart';
import 'projectList.dart';

class AddProject extends StatefulWidget {
  String? token;
  int? selectedIndex;

  AddProject(this.token,this.selectedIndex);

  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  TextEditingController projectName = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController cost = new TextEditingController();
  TextEditingController remarks = new TextEditingController();
  TextEditingController totalAmount = new TextEditingController();
  TextEditingController paidAmount = new TextEditingController();
  List<String>?descriptions;
  List<String>?milestoneList;

  var client;
  var projectType;
  var status;
  String? estimatedFromDate;
  String? estimatedToDate;
  bool isGst = false;
  bool isInvoice = false;
  String? createdDate=DateTime.now().toString();
  bool sendNotification=false;

  AddProjectInfoModel? clientInfo;
  MilestoneInfoModel? milestone;
  List<checkBoxClass>? listItems;
  List<checkBoxClass> checkedItems = [];

  //
  List<checkBoxClass>? ids;
  bool clientVal = false;



  //


  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    descriptions=List<String>.empty(growable: true);
    descriptions!.add("");
    milestoneList=List<String>.empty(growable: true);
    milestoneList!.add("");
    listItems = [];
  }

  getData() async {
    clientInfo = await HttpService.addProjectInfo();

    if (clientInfo != null) {
      setState(() {});
    }
  }

  getMilestone(projectType) async {
    milestone = await HttpService.milestoneListData(projectType);

    if (milestone != null) {
      setState(() {
        milestone!.data!.forEach((element) {
          listItems!.add(checkBoxClass(
              element.milestone.toString(),element.milestoneId));
        });




      });
    }
  }
  GlobalKey <FormState> globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: uiWidget(),);
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
                    enabled: enable,
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
  Widget uiWidget()
  {
    Size size = MediaQuery.of(context).size;
    return new Form(
      key: globalKey,
      child: clientInfo != null
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
                    height: 70,
                  ),

                  Row(
                    children: [
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjectList(
                                    widget.token,widget.selectedIndex
                                )),
                          );
                        },
                        child: Image.asset("assets/images/back_button.jpg",
                            width: 40),
                      ),
                      SizedBox(width: 50,),
                      Text(
                        "Add Project",
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
                                    Icons.person_pin_outlined,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Client Name'),
                                ],
                              ),
                            ),
                            value: client,
                            items:
                            clientInfo!.data!.clients!.map((data) {
                              return DropdownMenuItem(
                                value: data.clientId.toString(),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20),
                                  child:
                                  Text(data.clientName.toString()),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                client = newValue;
                              });
                              print(client);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  textFeildFunction('Project Name', projectName,
                      TextInputType.text, true,Icon(
                        Icons.description,
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
                                    Icons.list,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Project Type'),
                                ],
                              ),
                            ),
                            value: projectType,
                            items: clientInfo!.data!.projectTypes!
                                .map((data) {
                              return DropdownMenuItem(
                                value: data.ptId.toString(),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20),
                                  child: Text(data.ptName.toString()),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                projectType = newValue;
                                getMilestone(projectType);
                              });
                              print(projectType);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  if (listItems!.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 10),
                      child: mainItems(),
                    ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context,index)
                      {
                        return Column(
                          children: [
                            milestoneUi(index),
                          ],
                        );
                      },
                      separatorBuilder: (context,index)=>const Divider(),
                      itemCount: milestoneList!.length
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
                                    Icons.settings,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Status'),
                                ],
                              ),
                            ),
                            value: status,
                            items:
                            clientInfo!.data!.statuses!.map((data) {
                              return DropdownMenuItem(
                                value: data.statusId.toString(),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 20),
                                  child:
                                  Text(data.statusName.toString()),
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
                          hintText: 'From Date',
                        ),
                        initialValue: estimatedFromDate,

                        // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
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
                              estimatedFromDate = value;
                            });
                          }
                        },
                        // We can also use onSaved
                        onSaved: (value) {
                          if (value!.isNotEmpty) {
                            estimatedFromDate = value;
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
                          hintText: 'To Date',
                        ),
                        initialValue: estimatedToDate,
                        // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                        type: DateTimePickerType.date,



                        //controller: toDate,
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
                              estimatedToDate = value;
                            });
                          }
                        },
                        // We can also use onSaved
                        onSaved: (value) {
                          if (value!.isNotEmpty) {
                            estimatedToDate = value;
                          }
                        },
                      ),
                    ),
                  ),
                  textFeildFunction(
                      'Project Cost', cost, TextInputType.number, true,Icon(
                    Icons.monetization_on,
                    color: Colors.blue,
                  )),
                  CheckboxListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'is GST',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    value: isGst,
                    onChanged: (bool? value) {
                      if (value == true) {
                        setState(() {
                          isGst = true;
                          String? gstAmount =
                          (int.parse(cost.text) * 18 / 100 +
                              int.parse(cost.text))
                              .toString();
                          //String? totAmount=(int.parse(gstAmount)+int.parse(cost.text)).toString();

                          totalAmount = new TextEditingController(
                              text: gstAmount);

                          // totalAmount= (int.parse(cost.text)*18/100) as TextEditingController;
                        });
                      } else {
                        setState(() {
                          isGst = false;
                        });
                      }
                      print(isGst);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (isGst == true)
                    textFeildFunction('Total Cost', totalAmount,
                        TextInputType.number, false,Icon(
                          Icons.monetization_on,
                          color: Colors.blue,
                        )),
                  textFeildFunction(
                      'Remarks', remarks, TextInputType.text, true,Icon(
                    Icons.description_outlined,
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
                          hintText: 'From Date',
                        ),
                        initialValue: createdDate,

                        // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
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
                              createdDate = value;
                            });
                          }
                        },
                        // We can also use onSaved
                        onSaved: (value) {
                          if (value!.isNotEmpty) {
                            createdDate = value;
                          }
                        },
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Generate Invoice',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    value: isInvoice,
                    onChanged: (bool? value) {
                      if (value == true) {
                        setState(() {
                          isInvoice = true;
                        });
                      } else {
                        setState(() {
                          isInvoice = false;
                        });
                      }
                      print(isInvoice);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (isInvoice == true)
                    textFeildFunction('Paid Amount', paidAmount,
                        TextInputType.number, true,Icon(
                          Icons.monetization_on,
                          color: Colors.blue,
                        )),
                  CheckboxListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Send Notification ',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    value: sendNotification,
                    onChanged: (bool? value) {
                      if (value == true) {
                        setState(() {
                          sendNotification = true;
                        });
                      } else {
                        setState(() {
                          sendNotification = false;
                        });
                      }
                      print(sendNotification);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (client==null) {
                        Common.toastMessaage(
                            'Project Name cannot be empty', Colors.red);
                      } else if (projectName.text.isEmpty) {
                        Common.toastMessaage(
                            'Choose Client', Colors.red);
                      } else if (projectType == null) {
                        Common.toastMessaage(
                            'Choose Project Type', Colors.red);
                      } else if (status == null) {
                        Common.toastMessaage(
                            'Choose Project Status', Colors.red);
                      } else if (cost.text.isEmpty) {
                        Common.toastMessaage(
                            'Project Cost cannot be empty', Colors.red);
                      }
                      else if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      Common.showProgressDialog(context, "Loading..");
                      Map<String, dynamic> body = {
                        "token": widget.token,
                        "projectName": projectName.text,
                        "gstCheck": isGst,
                        "gstAmount": totalAmount.text,
                        "generateInvoice": isInvoice,
                        "projectType": projectType,
                        "mileStone":
                        checkedItems.map((e) => e.ids).toList(),
                        "extraMileStone": milestoneList,
                        "client": client,
                        "cost": cost.text,
                        "status": status,
                        "startDate": estimatedFromDate,
                        "endDate": estimatedToDate,
                        "remarks": remarks.text,
                        "description": descriptions,
                        "paidAmount": paidAmount.text,
                        "createdDate": createdDate,
                        "sendNotification": sendNotification,
                      };
                      print(body);
                      AddProjectModel object = await HttpService.addProjects(body);
                      if (object.status == true) {
                      Common.toastMessaage(
                      'Added Successfully', Colors.green);
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                          ProjectList(widget.token,widget.selectedIndex)),
                      );
                      } else {
                      Navigator.pop(context);
                      Common.toastMessaage(
                      'Something Went Wrong', Colors.red);
                      }
                      print(body);
                      }
                      // if (client==null) {
                      //   Common.toastMessaage(
                      //       'Project Name cannot be empty', Colors.red);
                      // } else if (projectName.text.isEmpty) {
                      //   Common.toastMessaage(
                      //       'Choose Client', Colors.red);
                      // } else if (projectType == null) {
                      //   Common.toastMessaage(
                      //       'Choose Project Type', Colors.red);
                      // } else if (status == null) {
                      //   Common.toastMessaage(
                      //       'Choose Project Status', Colors.red);
                      // } else if (cost.text.isEmpty) {
                      //   Common.toastMessaage(
                      //       'Project Cost cannot be empty', Colors.red);
                      // } else {
                      //   Common.showProgressDialog(context, "Loading..");
                      //
                      //   AddProjectModel object =
                      //   await HttpService.addProjects(
                      //       projectName.text,
                      //       client,
                      //       description.text,
                      //       cost.text,
                      //       remarks.text,
                      //       totalAmount.text,
                      //       paidAmount.text,
                      //       projectType,
                      //       status,
                      //       estimatedFromDate,
                      //       estimatedToDate,
                      //       isGst,
                      //       isInvoice,
                      //       widget.token);
                      //   if (object.status == true) {
                      //     Common.toastMessaage(
                      //         'Added Successfully', Colors.green);
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               ProjectList(widget.token,widget.selectedIndex)),
                      //     );
                      //   } else {
                      //     Navigator.pop(context);
                      //     Common.toastMessaage(
                      //         'Something Went Wrong', Colors.red);
                      //   }
                      // }
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

  Widget milestoneUi(index)
  {

    void addDescripionController(){
      setState(() {
        milestoneList!.add("");
      });
    }
    void removeDescripionController(index){
      setState(() {
        if(milestoneList!.length>0){
          milestoneList!.removeAt(index);
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
                          milestoneList![index]=val!;
                        },
                        //controller: description,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'milestones',
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
          visible:index==milestoneList!.length-1,

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
  mainItems() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return chekBox(listItems![index]);
      },
      itemCount: listItems!.length,
    );
  }

  chekBox(checkBoxClass obj) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CheckboxListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    obj.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),

                ],
              ),
              value: checkedItems.contains(obj) ? true : false,
              onChanged: (bool? value) {
                if (value == true) {
                  setState(() {

                    checkedItems.add(obj);
                    checkedItems.forEach((element) {


                    });
                  });
                } else {
                  setState(() {

                    checkedItems.remove(obj);
                    checkedItems.forEach((element) {


                    });
                  });
                }

              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          )
        ],
      ),
    );
  }
}
class checkBoxClass {
  checkBoxClass(this.title, this.ids, {this.chheckval: false});

  int? ids;
  bool? chheckval;
  String? title;

  getChlk() {
    return chheckval;
  }

  gettitle() {
    return title;
  }

  updateChk(val) {
    chheckval = val;
  }
}