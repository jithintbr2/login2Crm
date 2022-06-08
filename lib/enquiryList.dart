
import 'package:crm_admin/addEnquiry.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common.dart';
import 'dashboard.dart';
import 'editEnquiry.dart';
import 'enquiryFollowupList.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'models/deleteEnquiryModel.dart';
import 'models/deleteExpenseModel.dart';
import 'models/enquiryInfoModel.dart';
import 'models/enquirytListModel.dart';

class EnquiryList extends StatefulWidget {
 String? token;
 String? userId;
 EnquiryList(this.token,this.userId);
  @override
  _EnquiryListState createState() => _EnquiryListState();
}

class _EnquiryListState extends State<EnquiryList> {
  String? selectIndex = '-1';
  EnquiryInfoModel? enquiryInfo;
  EnquirytListModel? enquiryList;
  TextEditingController search = new TextEditingController();
  String? searchKey;
  bool? searchSts=false;
  var staff;

  void initState() {
    // TODO: implement initState
    staff = widget.userId;
    super.initState();
    getData(widget.token,selectIndex,staff,searchKey);
  }

  getData(token,selectIndex,staff,searchKey) async {
    enquiryInfo = await HttpService.enquiryInfo(token,staff);
    if (enquiryInfo != null) {
      enquiryList = await HttpService.enquiryList(token,selectIndex,staff,searchKey);
      if(searchSts==true){Navigator.pop(context);}
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => HomePage(
                    widget.token,0)),
                (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(

        body: enquiryList != null
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
                  SafeArea(
          child: SingleChildScrollView(
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
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(
                                          widget.token,0)),
                                      (Route<dynamic> route) => false);
                            },
                            child: Image.asset(
                                "assets/images/back_button.jpg",
                                width: 40),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "Enquiry List",
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
                      top(),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            itemCount: enquiryInfo!.data!.status!.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () async {
                                  searchSts = true;
                                  Common.showProgressDialog(
                                      context, "Loading..");
                                  getData(
                                      widget.token,enquiryInfo!.data!.status![index].statusId,staff,searchKey);

                                  setState(() {

                                    selectIndex = enquiryInfo!.data!.status![index].statusId.toString();


                                  });
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15),
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 0),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                              offset: Offset(1, 1)),
                                        ],
                                        color: selectIndex ==
                                            enquiryInfo!.data!.status![index].statusId.toString()
                                            ? Colors.lightBlueAccent
                                            : Colors.white,
                                        borderRadius:
                                        const BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(enquiryInfo!.data!.status![index].status.toString(),
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold),
                                          ),

                                          CircleAvatar(
                                            backgroundColor: Colors.green,
                                            radius: 12,
                                            child: Text(
                                              enquiryInfo!.data!.status![index].count.toString(),
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      ListView.builder(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 24),
                          itemCount: enquiryList!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            print(enquiryList!.data!.length);
                            return GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EnquiryFollowupList(widget.token,enquiryList!
                                          .data![index].enquiryId
                                          .toString(),widget.userId)),
                                ),
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.only(top: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius: 6,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 20),
                                      child: Container(
                                        width: 200,
                                        child: Text(
                                          enquiryList!
                                              .data![index].projectType
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            constraints: const BoxConstraints(
                                              minHeight: 20,
                                              minWidth: 20,
                                              maxHeight: 50,
                                              maxWidth: 50,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 0),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 5,
                                                    offset: Offset(1, 1)),
                                              ],
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      enquiryList!
                                                          .data![index]
                                                          .typeImage
                                                          .toString())),
                                              // image: AssetImage(
                                              //     'assets/images/img.jpeg')),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  enquiryList!
                                                      .data![index]
                                                      .clientName
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color:
                                                      Colors.deepOrange)),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 10),
                                                child: Text(
                                                    enquiryList!
                                                        .data![index]
                                                        .createdBy
                                                        .toString()+' on ' +
                                                        enquiryList!
                                                            .data![index]
                                                            .createdDate
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black)),
                                              ),
                                              SizedBox(height: 5,),
                                              Container(
                                                width: 200,
                                                child: Text('Project Name: '+
                                                    enquiryList!
                                                        .data![index]
                                                        .projectName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black)),
                                              ),
                                              SizedBox(height: 5,),
                                              Container(
                                                width: 200,
                                                child: Text('Contact Number: '+
                                                    enquiryList!
                                                        .data![index]
                                                        .contactNo
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black)),
                                              ),
                                              SizedBox(height: 5,),
                                              Container(
                                                width: 200,
                                                child: Text(
                                                    enquiryList!
                                                        .data![index]
                                                        .remarks
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE7E3D0),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(

                                              children: [
                                                InkWell(
                                                    onTap: (){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => EditEnquiry(widget.token,enquiryList!.data![index].enquiryId.toString(),
                                                                enquiryList!.data![index].clientName.toString(),enquiryList!.data![index].contactNo.toString(),
                                                                enquiryList!.data![index].contactPerson.toString(),enquiryList!.data![index].designation.toString(),
                                                                enquiryList!.data![index].projectTypeId.toString(),enquiryList!.data![index].cost.toString(),
                                                                enquiryList!.data![index].remarks.toString(),enquiryList!.data![index].projectName.toString(),widget.userId)),
                                                      );
                                                    },
                                                    child: Icon(Icons.edit, color: Colors.blue,size: 20,)),
                                                SizedBox(width: 10,),
                                                InkWell(
                                                    onTap: ()=>_dialogue(context,enquiryList!.data![index].enquiryId
                                                        .toString()),


                                                    child: Icon(Icons.delete, color: Colors.red,size: 20,)),
                                                SizedBox(width: 10,),
                                                InkWell(
                                                    onTap: () async {
                                                      String url = 'tel:'+enquiryList!.data![index].contactNo.toString();
                                                      if (await canLaunch(url)) {
                                                      await launch(url);
                                                      } else {
                                                      throw 'Could not launch $url';
                                                      }
                                                    },


                                                    child: Icon(Icons.call_sharp, color: Colors.green,size: 20,)),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.monetization_on,
                                                  color: Colors.orange,
                                                  size: 20),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                enquiryList!.data![index].cost
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Colors.red),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),

                    ],
                  ),
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

        floatingActionButton: Container(
          height: 60.0,
          width: 60.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddEnquiry(widget.token,widget.userId)),
              );
            },
            backgroundColor: const Color(0xFF2a52be),
            child: const Icon(Icons.add_box_outlined,size: 35,),
          ),
        ),

      ),
    );
  }
  top() {
    return Row(
      children: [
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(1, 1)),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Staff'),
                  ),
                  value: staff,
                  items: enquiryInfo!.data!.staffList!.map((data) {
                    return DropdownMenuItem(
                      value: data.createdBy.toString(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(data.username.toString()),
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
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: Color(0xffE7E3D0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: FlatButton(
            onPressed: () async {
              selectIndex = '-1';
              searchSts = true;
              Common.showProgressDialog(context, "Loading..");
              getData(widget.token,selectIndex,staff,searchKey);
            },
            child: Text(
              'Search',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
  void _dialogue(BuildContext context,enquiryId) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Delete?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {

                    DeleteEnquiryModel object =
                    await HttpService.deleteEnquiry(enquiryId,
                        widget.token);
                    if (object.status == true) {
                      Common.toastMessaage(
                          'Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EnquiryList(widget.token,widget.userId)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage(
                          'Something Went Wrong', Colors.red);
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

Widget label(String labelName, {Color color = const Color(0xff757575)}) {
  return Text(
    labelName,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget info(String infoText, {Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Text(
      infoText,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}