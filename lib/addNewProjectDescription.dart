import 'package:crm_admin/projectDetails.dart';
import 'package:flutter/material.dart';

import 'common.dart';
import 'httpService.dart';
import 'models/addProjectDescriptionInfoModel.dart';
import 'models/addProjectDescriptionModel.dart';

class AddNewProjectDescription extends StatefulWidget {
  String? projectId;
  String? token;
  int? selectedIndex;

  AddNewProjectDescription(this.projectId, this.token, this.selectedIndex);

  @override
  _AddNewProjectDescriptionState createState() => _AddNewProjectDescriptionState();
}

class _AddNewProjectDescriptionState extends State<AddNewProjectDescription> {
  List<String>? descriptionList;

  bool clientVal = false;
  AddProjectDescriptionInfoModel? projectDescriptionInfo;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    descriptionList = List<String>.empty(growable: true);
    descriptionList!.add("");

  }

  getData() async {
    projectDescriptionInfo =
    await HttpService.addProjectDescriptionInfo(widget.projectId, widget.token);

    if (projectDescriptionInfo != null) {

      setState(() {});
    }
  }

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProjectDetails(
                  widget.projectId,
                  widget.token,
                  widget.selectedIndex)),
        );
        return true;
      },
      child: Scaffold(
        body: projectDescriptionInfo != null
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProjectDetails(
                                          widget.projectId,
                                          widget.token,
                                          widget.selectedIndex)),
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
                              "Add Description",
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 20),
                                      child: Container(
                                        width: 200,
                                        child: Text(
                                          projectDescriptionInfo!.data!.clientName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.purple),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 20),
                                      child: Text(
                                        projectDescriptionInfo!.data!.status
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: projectDescriptionInfo!.data!.status
                                                .toString() ==
                                                'Completed'
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                      projectDescriptionInfo!.data!.projectName
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Container(
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
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    projectDescriptionInfo!
                                                        .data!.typeImage
                                                        .toString())),
                                            borderRadius:
                                            const BorderRadius.all(
                                                Radius.circular(18))),
                                        width: 70,
                                        height: 70,
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10),
                                            child: Text(
                                                projectDescriptionInfo!.data!.createdBy
                                                    .toString() +
                                                    ' on ' +
                                                    projectDescriptionInfo!
                                                        .data!.createdDate
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                          projectDescriptionInfo!.data!.assignments!
                                              .length >
                                              0
                                              ? SizedBox(
                                            height: 80,
                                            child: ListView.builder(
                                                scrollDirection:
                                                Axis.horizontal,
                                                shrinkWrap: true,
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 5,
                                                    vertical: 15),
                                                itemCount:
                                                projectDescriptionInfo!
                                                    .data!
                                                    .assignments!
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext
                                                context,
                                                    int childIndex) {
                                                  return GestureDetector(
                                                    onTap: () async {},
                                                    child: Container(
                                                      constraints:
                                                      const BoxConstraints(
                                                        maxHeight: 50,
                                                      ),
                                                      child: Container(
                                                        constraints:
                                                        const BoxConstraints(
                                                          minHeight: 20,
                                                          minWidth: 20,
                                                          maxHeight: 40,
                                                          maxWidth: 40,
                                                        ),
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .white,
                                                              width: 0),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey,
                                                                blurRadius:
                                                                5,
                                                                offset: Offset(
                                                                    1,
                                                                    1)),
                                                          ],
                                                          color: Colors
                                                              .white,
                                                          shape: BoxShape
                                                              .circle,
                                                          image: DecorationImage(
                                                              fit: BoxFit
                                                                  .cover,
                                                              image: NetworkImage(projectDescriptionInfo!
                                                                  .data!
                                                                  .assignments![
                                                              childIndex]
                                                                  .staffImage
                                                                  .toString())),
                                                          // image: AssetImage(
                                                          //     'assets/images/img.jpeg')),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          )
                                              : SizedBox(
                                            height: 80,
                                            child: Container(
                                              constraints:
                                              const BoxConstraints(
                                                maxHeight: 50,
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    constraints:
                                                    const BoxConstraints(
                                                      minHeight: 20,
                                                      minWidth: 20,
                                                      maxHeight: 40,
                                                      maxWidth: 40,
                                                    ),
                                                    decoration:
                                                    BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors
                                                              .white,
                                                          width: 0),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color: Colors
                                                                .grey,
                                                            blurRadius:
                                                            5,
                                                            offset:
                                                            Offset(
                                                                1,
                                                                1)),
                                                      ],
                                                      color:
                                                      Colors.white,
                                                      shape: BoxShape
                                                          .circle,
                                                      image: DecorationImage(
                                                          fit: BoxFit
                                                              .cover,
                                                          image: AssetImage(
                                                              'assets/images/avathar.jpg')),
                                                      // image: AssetImage(
                                                      //     'assets/images/img.jpeg')),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Not Assigned',
                                                    style: TextStyle(
                                                        color:
                                                        Colors.red),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                              'Working Staff : ' +
                                                  projectDescriptionInfo!.data!
                                                      .assignments!.length
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
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
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 4,
                                        blurRadius: 6,
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
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
                                      Row(
                                        children: [
                                          Icon(Icons.task,
                                              color: Colors.grey, size: 20),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            projectDescriptionInfo!.data!.taskCount
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(Icons.comment,
                                              color: Colors.grey, size: 20),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            projectDescriptionInfo!.data!.documentCount
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.monetization_on,
                                              color: Colors.orange, size: 20),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          projectDescriptionInfo!.data!.balanceAmount
                                              .toString() ==
                                              '0'
                                              ? Text(
                                            'Completed',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.green),
                                          )
                                              : Text(
                                            'Due: ' +
                                                projectDescriptionInfo!
                                                    .data!.balanceAmount
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
                        ),
                        uiWidget(),
                      ],
                    ),
                  )),
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

  Widget uiWidget() {
    Size size = MediaQuery.of(context).size;
    return new Form(
        key: globalKey,
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            children: [

              ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        descriptionUi(index),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: descriptionList!.length),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    Common.showProgressDialog(context, "Loading..");
                    Map<String, dynamic> body = {
                      "token": widget.token,
                      "projectId": widget.projectId,
                      "description": descriptionList,
                    };
                    print(body);
                    AddProjectDescriptionModel object =
                    await HttpService.addprojectDescription(body);
                    if (object.status == true) {
                      Common.toastMessaage('Added Successfully', Colors.green);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectDetails(
                                widget.projectId,
                                widget.token,
                                widget.selectedIndex)),
                      );
                    } else {
                      Navigator.pop(context);
                      Common.toastMessaage('Something Went Wrong', Colors.red);
                    }
                    print(body);
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
                      gradient: const LinearGradient(
                          colors: [Colors.greenAccent, Colors.blueAccent]),
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
        ));
  }

  Widget descriptionUi(index) {
    void addDescripionController() {
      setState(() {
        descriptionList!.add("");
      });
    }

    void removeDescripionController(index) {
      setState(() {
        if (descriptionList!.length > 0) {
          descriptionList!.removeAt(index);
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
                          descriptionList![index] = val!;
                        },
                        //controller: description,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Description',
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
              icon: Icon(
                Icons.add_circle,
                color: Colors.green,
              ),
              onPressed: () {
                addDescripionController();
              },
            ),
          ),
          visible: index == descriptionList!.length - 1,
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
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
              onPressed: () {
                removeDescripionController(index);
              },
            ),
          ),
          visible: index > 0,
        )
      ],
    );
  }



}


