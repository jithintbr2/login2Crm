import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

import 'accounts.dart';
import 'clientList.dart';
import 'common.dart';
import 'dashboard.dart';
import 'httpService.dart';
import 'invoiceLis.dart';
import 'login.dart';
import 'models/homeModel.dart';
import 'projectList.dart';

class HomePage extends StatefulWidget {
  String? token;
  int? index;

  HomePage(this.token, this.index);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectedIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HomeModel? homePageDetails;
  ListQueue<int> _navigationQueue = ListQueue();
  int index = 0;

  void initState() {
    _selectedIndex = widget.index;
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    homePageDetails = await HttpService.homePage(widget.token);
    if (homePageDetails != null) {
      setState(() {});
    }
  }

  void _onItemTapped(int index) {
    index == 3
        ? _scaffoldKey.currentState!.openEndDrawer()
        : setState(() {
            _selectedIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    List _widgetOptions = [
      Dashboard(widget.token, _selectedIndex),
      ProjectList(widget.token, _selectedIndex),
      Accounts(widget.token, '5', _selectedIndex)

      //ShopList(widget.userId.toString(),_selectedIndex),
      // ReportsPage(widget.userId.toString(),widget.username,_selectedIndex,widget.fromDate,widget.toDate),
      // Settings(widget.userId.toString(),widget.username,_selectedIndex),
      //Imager(),
    ];
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex!),
      ),
      endDrawer: homePageDetails != null
          ? Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Container(
                        child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              homePageDetails!.data!.image.toString()),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homePageDetails!.data!.userName.toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(Icons.login_outlined,
                                  color: Colors.black),
                              onPressed: () => _dialogue(context),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homePageDetails!.data!.staffs!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Row(
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                maxHeight: 50,
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 20,
                                  minWidth: 20,
                                  maxHeight: 40,
                                  maxWidth: 40,
                                ),
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
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(homePageDetails!
                                          .data!.staffs![index].image
                                          .toString())),
                                  // image: AssetImage(
                                  //     'assets/images/img.jpeg')),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: homePageDetails!.data!.staffs![index]
                                            .nowWorking ==
                                        true
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(homePageDetails!
                                .data!.staffs![index].staffName
                                .toString()),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                      child: Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
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
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 20.0,
              ),
              label: 'Dashboard',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.description,
                size: 20.0,
              ),
              label: 'Projects',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                size: 20.0,
              ),
              label: 'Accounts',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 20.0,
              ),
              label: 'menu',
              backgroundColor: Colors.white,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex!,
          selectedItemColor: Color(0xFF2a52be),
          unselectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }

  void _dialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Please Confirm'),
            content: Text('Are you sure to Logout?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Common.saveSharedPref("Logout", "success");
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (Route<dynamic> route) => false);
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
