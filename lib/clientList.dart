import 'package:crm_admin/addClients.dart';
import 'package:crm_admin/clientDetails.dart';
import 'package:crm_admin/httpService.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'dashboard.dart';
import 'homePage.dart';
import 'models/clientListModel.dart';

class ClientList extends StatefulWidget {
  String? token;

  ClientList(this.token);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  ClientListModel? clientList;
  TextEditingController search = new TextEditingController();
  String? searchKey;
  bool? searchSts=false;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.token,searchKey);
  }

  getData(token,searchKey) async {
    clientList = await HttpService.clientList(token,searchKey);
    if (clientList != null) {
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

        body: clientList != null
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
                                  "Client List",
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
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                                itemCount: clientList!.data!.clientList!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ClientDetails(
                                                clientList!.data!.clientList![index].clientId,
                                                widget.token,clientList!.data!.clientList![index].clientImage.toString())),
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(

                                            children: [

                                              Container(
                                                width:100,height:100,
                                                child: Image.network(clientList!.data!.clientList![index].clientImage.toString()),

                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Container(
                                                    width:220,
                                                    child: Text(clientList!
                                                        .data!
                                                        .clientList![index]
                                                        .clientName
                                                        .toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black)),
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 10),
                                                    child: Text(clientList!
                                                        .data!
                                                        .clientList![index]
                                                        .createdBy
                                                        .toString()+' on '+clientList!
                                                        .data!
                                                        .clientList![index]
                                                        .createdDate
                                                        .toString(),style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.brown)),
                                                  ),
                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Text(clientList!.data!.clientList![index].projectsCount.toString(),style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.green)),
                                                      SizedBox(width: 5,),
                                                      Text('Projects')
                                                    ],
                                                  ),
                                                ],
                                              ),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            height: 40 ,
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
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                        Icons.phone_android,
                                                        color: Colors.green,
                                                        size: 20
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text(clientList!.data!.clientList![index].contact1.toString(),
                                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),




                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                        Icons.monetization_on,
                                                        color: Colors.orange,
                                                        size: 20
                                                    ),
                                                    SizedBox(width: 5,),
                                                    clientList!.data!.clientList![index].balanceDue.toString()=='0'?
                                                    Text('Completed',
                                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),):
                                                    Text('Due: '+clientList!.data!.clientList![index].balanceDue.toString(),
                                                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
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
                    builder: (context) => AddClients(widget.token)),
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
        Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.6,
            margin:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                        controller: search,
                        decoration: InputDecoration(
                          hintText: 'Search By Client ',
                          border: InputBorder.none,
                        )),
                  ),
                ),
              ],
            )),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: Color(0xffE7E3D0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: FlatButton(
            onPressed: () async {
              searchSts=true;
              Common.showProgressDialog(context, "Loading..");
              getData(widget.token, search.text);
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
