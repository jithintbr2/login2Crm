
import 'package:crm_admin/projectDetails.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'models/addProjectInfoModel.dart';
import 'models/editProjectModel.dart';
import 'projectList.dart';

class ProjectEdit extends StatefulWidget {
  String? token;
  String? projectId;
  String? clientId;
  String? projectName;
  String? projectTypeId;
  String? statusId;
  String? projectCost;
  String? remark;
  ProjectEdit(this.token,this.projectId,this.clientId,this.projectName,this.projectTypeId,this.statusId,
      this.projectCost,this.remark);


  @override
  _ProjectEditState createState() => _ProjectEditState();
}

class _ProjectEditState extends State<ProjectEdit> {
  TextEditingController projectName = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController cost = new TextEditingController();
  TextEditingController remarks = new TextEditingController();
  var client;
  var projectType;
  var status;

  // bool isGst = false;
  // bool isInvoice = false;

  AddProjectInfoModel? clientInfo;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    clientInfo = await HttpService.addProjectInfo();
    client=widget.clientId;
    projectName.text =widget.projectName.toString();
    cost.text=widget.projectCost.toString();
    remarks.text=widget.remark.toString();
    projectType=widget.projectTypeId;
    status=widget.statusId;

    if (clientInfo != null) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: clientInfo != null
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
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProjectList(
                                      widget.token,0)),
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
                          "Project Edit",
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
                                child: Text('Client Name'),
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
                        TextInputType.text, true),

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
                                child: Text('Project Type'),
                              ),
                              value: projectType,
                              items: clientInfo!.data!.projectTypes!
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.ptId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20),
                                    child:
                                    Text(data.ptName.toString()),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  projectType = newValue;
                                });
                                print(projectType);
                              },
                            ),
                          ),
                        );
                      },
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
                                padding:
                                const EdgeInsets.only(left: 0),
                                child: Text('Status'),
                              ),
                              value: status,
                              items: clientInfo!.data!.statuses!
                                  .map((data) {
                                return DropdownMenuItem(
                                  value: data.statusId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20),
                                    child: Text(
                                        data.statusName.toString()),
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
                        'Project Cost', cost, TextInputType.number, true),


                    textFeildFunction(
                        'Remarks', remarks, TextInputType.text, true),


                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (projectName.text.isEmpty) {
                          Common.toastMessaage(
                              'Project Name cannot be empty', Colors.red);
                        } else if (client == null) {
                          Common.toastMessaage('Choose Client', Colors.red);
                        } else if (projectType == null) {
                          Common.toastMessaage(
                              'Choose Project Type', Colors.red);
                        } else if (status == null) {
                          Common.toastMessaage(
                              'Choose Project Status', Colors.red);
                        } else if (cost.text.isEmpty) {
                          Common.toastMessaage(
                              'Project Cost cannot be empty', Colors.red);
                        } else {
                          Common.showProgressDialog(context, "Loading..");

                          EditProjectModel object =
                          await HttpService.editProject(
                              projectName.text,
                              client,
                              cost.text,
                              remarks.text,
                              projectType,
                              status,
                              widget.token,widget.projectId);
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
        ));
  }

  textFeildFunction(hintname, controller, keyboardType, enable) {
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