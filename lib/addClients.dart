import 'package:crm_admin/clientDetails.dart';
import 'package:crm_admin/httpService.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

import 'clientList.dart';
import 'common.dart';
import 'dashboard.dart';
import 'models/addClientInfoModel.dart';
import 'models/addClientModel.dart';

class AddClients extends StatefulWidget {
  String? token;

  AddClients(this.token);

  @override
  _AddClientsState createState() => _AddClientsState();
}

class _AddClientsState extends State<AddClients> {
  TextEditingController name = new TextEditingController();
  TextEditingController contact1 = new TextEditingController();
  TextEditingController contact2 = new TextEditingController();
  TextEditingController emailId = new TextEditingController();
  TextEditingController contactPerson = new TextEditingController();
  TextEditingController designation = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController gstNumber = new TextEditingController();
  TextEditingController careOff = new TextEditingController();
  TextEditingController remarks = new TextEditingController();
  AddClientInfoModel? clientInfo;
  var countyCode='+91';
  bool phoneNumberCheck=false;
  bool sendNotification=false;
  String ?errorText='';

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    clientInfo = await HttpService.addClientInfo();

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
                                      builder: (context) => ClientList(
                                            widget.token,
                                          )),
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
                              "Add Client",
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
                            'Name',
                            name,
                            TextInputType.text,
                            Icon(
                              Icons.person_pin_outlined,
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
                                      items: clientInfo!.data!.countryCodes!
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
                                            ), onChanged: (text) => setState((){
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
                        Row(
                          children: [
                            Container(
                                width: 280,
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
                                      Icons.phone_android,
                                      color: Colors.blue,
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                            controller: contact2,
                                            keyboardType:  TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: 'Contact Number 2 ',
                                              border: InputBorder.none,
                                            )),
                                      ),
                                    ),
                                  ],
                                )),
                            InkWell(
                              onTap: () async {
                                final PhoneContact contact =
                                await FlutterContactPicker.pickPhoneContact();
                                if(contact != null){
                                  contact2.text = contact.phoneNumber!.number.toString();

                                  setState(() {

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
                        textFeildFunction(
                            'Email Id',
                            emailId,
                            TextInputType.text,
                            Icon(
                              Icons.email,
                              color: Colors.blue,
                            )),
                        textFeildFunction(
                            'Contact Person',
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
                              Icons.settings,
                              color: Colors.blue,
                            )),
                        textFeildFunction(
                            'Address',
                            address,
                            TextInputType.text,
                            Icon(
                              Icons.location_on,
                              color: Colors.blue,
                            )),
                        textFeildFunction(
                            'Description',
                            description,
                            TextInputType.text,
                            Icon(
                              Icons.description_outlined,
                              color: Colors.blue,
                            )),
                        textFeildFunction(
                            'GST Number',
                            gstNumber,
                            TextInputType.text,
                            Icon(
                              Icons.list,
                              color: Colors.blue,
                            )),
                        textFeildFunction(
                            'Care Off',
                            careOff,
                            TextInputType.text,
                            Icon(
                              Icons.person,
                              color: Colors.blue,
                            )),
                        textFeildFunction(
                            'Remarks',
                            remarks,
                            TextInputType.text,
                            Icon(
                              Icons.description,
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
                            if (name.text.isEmpty) {
                              Common.toastMessaage(
                                  'Client Name cannot be empty', Colors.red);
                            } else if (contact1.text.isEmpty) {
                              Common.toastMessaage(
                                  'Contact1  cannot be empty', Colors.red);
                            } else {
                              Common.showProgressDialog(context, "Loading..");

                              AddClientModel object =
                                  await HttpService.addClient(
                                      name.text,
                                      countyCode,
                                      contact1.text,
                                      contact2.text,
                                      emailId.text,
                                      contactPerson.text,
                                      designation.text,
                                      address.text,
                                      description.text,
                                      gstNumber.text,
                                      careOff.text,
                                      remarks.text,
                                      sendNotification,
                                      widget.token);
                              if (object.status == true) {
                                Common.toastMessaage(
                                    'Added Successfully', Colors.green);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ClientList(
                                          widget.token)),
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
