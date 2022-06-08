import 'dart:async';
import 'package:crm_admin/common.dart';
import 'package:crm_admin/dashboard.dart';
import 'package:crm_admin/login.dart';
import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'forceUpdate.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'models/updateModel.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 2;
  UpdateModel? updatedata;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  void initState() {
    super.initState();
    //getData();
    _loadWidget();
  }
  getData() async {
    updatedata = await HttpService.forceUpdate();
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
    final _appVersion=_packageInfo.version;
    print(_appVersion);
    int versionCompare=_appVersion.compareTo(updatedata!.data!.minVersion.toString());

    if(versionCompare<0)
    {
      _checkVersion();
    }
    else
    {
      _loadWidget();
    }

  }
  void _checkVersion()
  async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ForceUpdate()),
    );
    /*final newVersion=NewVersion(
      androidId:"com.azyan",
    );
    final status=await newVersion.getVersionStatus();

    newVersion.showUpdateDialog(context: context,
      versionStatus: status,
      dialogTitle: "UPDATE!!!",
      dismissButtonText: "Skip",
      dialogText: "Please Update The app From "+ "${status.localVersion}"+" to "+"${status.storeVersion}",
      dismissAction: (){
        SystemNavigator.pop();
      },
      updateButtonText: "Update",

    );*/

  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    // return '';
    // return Timer(_duration, navigationPage);
    return Timer(_duration, routeTOHomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 200,
          ),
        ));
  }

  routeTOHomePage() async {
    String? token = await Common.getSharedPref("token");
    print(token);

    if (token != null)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage(token,0)),
          (Route<dynamic> route) => false);
    else
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false);
  }
}
