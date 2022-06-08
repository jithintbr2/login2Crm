import 'package:crm_admin/httpService.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dashboard.dart';
import 'homePage.dart';
import 'models/StaffListModel.dart';

class StaffList extends StatefulWidget {
  String? token;

  StaffList(this.token);

  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  StaffListModel? staffList;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    staffList = await HttpService.staffList(widget.token);
    if (staffList != null) {
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

        body: staffList != null
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
                    child: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
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
                                  "Staff List",
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
                                padding: const EdgeInsets.only(top: 10),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: staffList!.data!.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 6.0 / 9,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                        padding: EdgeInsets.all(5),
                                        child: SingleChildScrollView(
                                          child: Card(
                                              elevation: 10,
                                              semanticContainer: true,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: InkWell(
                                                onTap: () async {},
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 20),
                                                      child: CircleAvatar(
                                                        backgroundImage: NetworkImage(
                                                            staffList!.data![index].proPic
                                                                .toString()),
                                                        radius: 40,
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.only(top: 10),
                                                        child: Text(
                                                          staffList!.data![index].staffName
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        )),
                                                    Padding(
                                                        padding: EdgeInsets.only(top: 5),
                                                        child: Text(
                                                          staffList!
                                                              .data![index].staffDesignation
                                                              .toString(),
                                                          style: TextStyle(fontSize: 15),
                                                        )),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              label('All'),
                                                              info(staffList!
                                                                  .data![index].newProjects
                                                                  .toString()),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              label('Complete'),
                                                              info(staffList!.data![index]
                                                                  .completedProjects
                                                                  .toString()),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              label('Pending'),
                                                              info(staffList!.data![index]
                                                                  .pendingProjects
                                                                  .toString()),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context).size.height *
                                                              0.05,
                                                      width:
                                                          MediaQuery.of(context).size.width *
                                                              0.45,
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius.circular(10),
                                                      ),
                                                      child: RaisedButton(
                                                        color: Colors.green,
                                                        onPressed: () async {
                                                          String url = 'tel:' +
                                                              staffList!.data![index].phoneNo
                                                                  .toString();
                                                          if (await canLaunch(url)) {
                                                            await launch(url);
                                                          } else {
                                                            throw 'Could not launch $url';
                                                          }
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                          children: [
                                                            Icon(
                                                              Icons.call_sharp,
                                                              color: Colors.black,
                                                              size: 15,
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text('Call'),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ));
                                  },
                                )),
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
      ),
    );
  }
}

Widget label(String labelName, {Color color = const Color(0xff757575)}) {
  return Center(
    child: Text(
      labelName,
      style: TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget info(String infoText, {Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Center(
      child: Text(
        infoText,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
