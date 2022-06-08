
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'httpService.dart';
import 'models/workDetailsModel.dart';
import 'subModuleDetails.dart';

class WorkDetails extends StatefulWidget {
  String? token;
  String? staffId;
  String? activityId;
  WorkDetails(this.token,this.staffId,this.activityId);



  @override
  _WorkDetailsState createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  WorkDetailsModel? workDetails;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    workDetails =
    await HttpService.workDetails(widget.staffId,widget.activityId,widget.token);
    if (workDetails != null) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body:  workDetails != null
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
                                      builder: (context) => Dashboard(
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
                            "Work Details",
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

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(

                          width: MediaQuery.of(context).size.width * 0.95,

                          child: Container
                            (
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.only(top: 0),
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
                                ],),
                                child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //SizedBox(height: 15,),
                              Container(
                                width: 80,
                                height: 30,

                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, width: 0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 5, offset: Offset(1, 1)),
                                    ],
                                    color: workDetails!.data!.statusName.toString()=='Completed'?Colors.green:Colors.red,
                                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(workDetails!.data!.statusName.toString(), style: TextStyle(
                                    fontWeight: FontWeight.bold,color: Colors.white
                                  )),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          workDetails!.data!.staffImage
                                              .toString(),
                                        ),
                                        radius: 25,
                                      ),
                                    )),
                              ),
                              Container(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                      workDetails!.data!.staffName
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      child: Center(
                                        child: Text(workDetails!.data!.clientName.toString(), style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      child: Center(
                                        child: Text(workDetails!.data!.projectName.toString(), style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: double.infinity,
                                child: Center(
                                  child: Text('Module : '+workDetails!.data!.activity.toString(), style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(
                                    width: 140,
                                    height: 60,
                                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white, width: 0),

                                        color: const Color(0xffCCE698),
                                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Text('Estimated Time ', style: TextStyle(
                                          fontSize: 13

                                        )),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Icon(
                                                Icons.punch_clock,
                                                color: Colors.grey,
                                                size: 20
                                            ),
                                            SizedBox(width: 5,),
                                            Text(workDetails!.data!.estimatedTime.toString(),style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 15

                                            )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    height: 60,
                                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white, width: 0),

                                        color: const Color(0xffCCE698),
                                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Completed Time ', style: TextStyle(fontSize: 13

                                        )),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Icon(
                                                Icons.punch_clock,
                                                color: Colors.grey,
                                                size: 20
                                            ),
                                            SizedBox(width: 5,),
                                            Text(workDetails!.data!.completedTime.toString(),style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 15

                                            )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Container(
                                height: 40 ,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xffE7E3D0),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Center(child: Text('Completed Date : '+workDetails!.data!.completedDate.toString(),style: TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 13,color: Colors.deepOrange

                                ))),
                              ),

                              // SizedBox(height: 10,),
                              // Text('Completed Time : '+workDetails!.data!.completedTime.toString(), style: TextStyle(
                              //   fontWeight: FontWeight.bold,
                              // )),
                              // SizedBox(height: 10,),
                              // Text('Completed date : '+workDetails!.data!.completedDate.toString(), style: TextStyle(
                              //   fontWeight: FontWeight.bold,
                              // )),
                              // SizedBox(height: 10,),



                            ],
                          )),
                        ),

                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                          itemCount: workDetails!.data!.subModules!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubModuleDetails(
                                          widget.token,widget.staffId,widget.activityId,workDetails!.data!.subModules![index].subModuleId.toString())),
                                ),
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.only(top: 0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 30,

                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white, width: 0),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.grey, blurRadius: 5, offset: Offset(1, 1)),
                                              ],
                                              color: workDetails!.data!.subModules![index].statusName.toString()=='Completed'?Colors.green:Colors.red,
                                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                                          child: Center(
                                            child: Text(workDetails!.data!.subModules![index].statusName.toString(), style: TextStyle(
                                                fontWeight: FontWeight.bold,color: Colors.white
                                            )),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(
                                            width: double.infinity,
                                            child: Center(
                                              child: Text(
                                                workDetails!.data!.subModules![index].subModuleName.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              '3 Sub Modeules',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Container(
                                              width: 135,
                                              height: 60,
                                              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.white, width: 0),

                                                  color: const Color(0xffDEF0F5),
                                                  borderRadius: const BorderRadius.all(Radius.circular(10))),
                                              child: Column(
                                                children: [
                                                  Text('Estimated Time ', style: TextStyle(
                                                      fontSize: 13

                                                  )),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                          Icons.punch_clock,
                                                          color: Colors.grey,
                                                          size: 20
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(workDetails!.data!.subModules![index].estimatedTime.toString(),style: TextStyle(
                                                          fontWeight: FontWeight.bold,fontSize: 15

                                                      )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 135,
                                              height: 60,
                                              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.white, width: 0),

                                                  color: const Color(0xffDEF0F5),
                                                  borderRadius: const BorderRadius.all(Radius.circular(10))),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('Completed Time ', style: TextStyle(fontSize: 13

                                                  )),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                          Icons.punch_clock,
                                                          color: Colors.grey,
                                                          size: 20
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(workDetails!.data!.subModules![index].completedTime.toString(),style: TextStyle(
                                                          fontWeight: FontWeight.bold,fontSize: 15

                                                      )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 10,),

                                        Padding(
                                          padding: const EdgeInsets.only(left:10),
                                          child: Text('Remark : '+workDetails!.data!.subModules![index].remarks.toString(),),
                                        ),
                                        SizedBox(height: 10,),

                                      ],
                                    ),
                                    Container(
                                      height: 40 ,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE7E3D0),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      child:Center(child: Text('Created Date: '+ workDetails!.data!.subModules![index].createdDate.toString(),style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),

                    ],
                  ),
                )),
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
      ),


    );
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
