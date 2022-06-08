import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

import 'common.dart';
import 'dashboard.dart';
import 'enquiryList.dart';
import 'httpService.dart';
import 'models/addQuickInfoModel.dart';
import 'models/enquiryAddModel.dart';

class AddEnquiry extends StatefulWidget {
  String? token;
  String? userId;

  AddEnquiry(this.token,this.userId);

  @override
  _AddEnquiryState createState() => _AddEnquiryState();
}

class _AddEnquiryState extends State<AddEnquiry> {
  TextEditingController name = new TextEditingController();
  TextEditingController projectName = new TextEditingController();
  TextEditingController contact1 = new TextEditingController();
  TextEditingController contactPerson = new TextEditingController();
  TextEditingController designation = new TextEditingController();
  TextEditingController projectCost = new TextEditingController();
  TextEditingController remark = new TextEditingController();

  var projectType;
  var countyCode='+91';
  bool phoneNumberCheck=false;
  String ?errorText='';

  AddQuickInfoModel? quickInfo;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    quickInfo = await HttpService.addQuickInfo();

    if (quickInfo != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard(widget.token, 0)),
            (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(
        body: quickInfo != null
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
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EnquiryList(widget.token,widget.userId)),
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
                                "Add Enquiry",
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
                              'Client Name',
                              name,
                              TextInputType.text,
                              Icon(
                                Icons.person_pin_outlined,
                                color: Colors.blue,
                              )),
                          textFeildFunction(
                              'Project Name',
                              projectName,
                              TextInputType.text,
                              Icon(
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
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.web,
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
                                    items: quickInfo!.data!.projectTypes!
                                        .map((data) {
                                      return DropdownMenuItem(
                                        value: data.id.toString(),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.web,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.typeName.toString()),
                                            ],
                                          ),
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
                          textFeildFunction(
                              'Project Cost',
                              projectCost,
                              TextInputType.text,
                              Icon(
                                Icons.money_outlined,
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
                                        items: quickInfo!.data!.countryCodes!
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
                                              controller: contact1,
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
                                    contact1.text = numbr.replaceAll(' ', '');

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

                          textFeildFunction(
                              'Contact Person ',
                              contactPerson,
                              TextInputType.text,
                              Icon(
                                Icons.person,
                                color: Colors.blue,
                              )),
                          textFeildFunction(
                              'Designation',
                              designation,
                              TextInputType.text,
                              Icon(
                                Icons.account_box_outlined,
                                color: Colors.blue,
                              )),


                          textFeildFunction(
                              'Remark',
                              remark,
                              TextInputType.text,
                              Icon(
                                Icons.description,
                                color: Colors.blue,
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (name.text.isEmpty) {
                                Common.toastMessaage(
                                    'Client Name cannot be empty', Colors.red);
                              }
                              else if (projectName.text.isEmpty) {
                                Common.toastMessaage(
                                    'Project Name cannot be empty', Colors.red);
                              }
                              else if (projectType == null) {
                                Common.toastMessaage(
                                    'Choose Project Type', Colors.red);
                              } else if (projectCost.text.isEmpty) {
                                Common.toastMessaage(
                                    'Project Cost  cannot be empty',
                                    Colors.red);
                              }
                              else if (contact1.text.isEmpty) {
                                Common.toastMessaage(
                                    'Contact Number cannot be empty',
                                    Colors.red);
                              }else {
                                Common.showProgressDialog(context, "Loading..");

                                EnquiryAddModel object =
                                    await HttpService.addEnquiry(
                                        name.text,
                                        projectName.text,
                                        countyCode,
                                        contact1.text,
                                        contactPerson.text,
                                        designation.text,
                                        projectType,
                                        projectCost.text,
                                        remark.text,
                                        widget.token);
                                if (object.status == true) {
                                  Common.toastMessaage(
                                      'Added Successfully', Colors.green);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddEnquiry(widget.token,widget.userId)),
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
      ),
    );
  }

  textFeildFunction(hintname, controller, keyboardType, icon) {
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
