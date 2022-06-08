
import 'package:flutter/material.dart';

import 'clientDetails.dart';
import 'clientList.dart';
import 'common.dart';
import 'httpService.dart';
import 'models/addClientInfoModel.dart';
import 'models/editClientModel.dart';

class ClientEdit extends StatefulWidget {
  String? token;
  String? clientId;
  String? clientName;
  String? contact1;
  String? contact2;
  String? email;
  String? contactPerson;
  String? designation;
  String? address1;
  String? description;
  String? remarks;
  String? gstNo;
  String? careOf;
  String?clientImage;
  ClientEdit(this.token,this.clientId,this.clientName,this.contact1,this.contact2,this.email,this.contactPerson,this.designation
      ,this.address1,this.description,this.remarks,this.gstNo,this.careOf,this.clientImage);

  @override
  _ClientEditState createState() => _ClientEditState();
}

class _ClientEditState extends State<ClientEdit> {
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

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    clientInfo = await HttpService.addClientInfo();
    name.text =widget.clientName.toString();
    contact1.text =widget.contact1.toString();
    contact2.text =widget.contact2.toString();
    emailId.text =widget.email.toString();
    contactPerson.text =widget.contactPerson.toString();
    designation.text =widget.designation.toString();
    address.text =widget.address1.toString();
    description.text =widget.description.toString();
    gstNumber.text =widget.gstNo.toString();
    careOff.text =widget.careOf.toString();
    remarks.text =widget.remarks.toString();





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
                                builder: (context) => ClientList(
                                    widget.token)),
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
                        "Client Edit",
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

                  textFeildFunction('Name', name, TextInputType.text),
                  textFeildFunction(
                      'Contact Number 1', contact1, TextInputType.text),
                  textFeildFunction(
                      'Contact Number 2', contact2, TextInputType.text),
                  textFeildFunction(
                      'Email Id', emailId, TextInputType.text),
                  textFeildFunction('Contact Person', contactPerson,
                      TextInputType.text),
                  textFeildFunction(
                      'Designation', designation, TextInputType.text),
                  textFeildFunction(
                      'Address', address, TextInputType.text),
                  textFeildFunction(
                      'Description', description, TextInputType.text),
                  textFeildFunction(
                      'GST Number', gstNumber, TextInputType.text),
                  textFeildFunction(
                      'Care Off', careOff, TextInputType.text),
                  textFeildFunction(
                      'Remarks', remarks, TextInputType.text),
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

                        EditClientModel object =
                        await HttpService.editClient(
                            name.text,
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
                            widget.token,widget.clientId);
                        if (object.status == true) {
                          Common.toastMessaage(
                              'Edit Successfully', Colors.green);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClientDetails(
                                    widget.clientId,
                                    widget.token,widget.clientImage)),
                          );
                        } else {
                          Navigator.pop(context);
                          Common.toastMessaage(
                              'Something went wrong ', Colors.red);
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

  textFeildFunction(hintname, controller, keyboardType) {
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
