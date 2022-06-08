import 'package:crm_admin/common.dart';
import 'package:crm_admin/dashboard.dart';
import 'package:crm_admin/httpService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'models/loginModel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String? firebaseToken;
  handleAsync() async {
    //await firebase.initialize();
    //print('before');
    firebaseToken = await FirebaseMessaging.instance.getToken();

    print("Firebase token : $firebaseToken");
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    // firebase = FirebaseNotifcation();

    handleAsync();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              // Colors.purple,
              Colors.purple.shade600,
              Colors.deepPurpleAccent,
            ])),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ),
                )),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  margin: const EdgeInsets.only(top: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          // color: Colors.red,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 22, bottom: 20),

                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 1,
                                fontFamily: "Lobster"),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            height: 60,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.email_outlined),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: username,
                                      decoration: const InputDecoration(
                                        hintText: "Username",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            width: double.infinity,
                            height: 60,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.password_outlined),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      obscureText: true,
                                      controller: password,
                                      decoration: const InputDecoration(
                                        hintText: "Password",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (username.text.isEmpty) {
                              Common.toastMessaage(
                                  'Username cannot be empty', Colors.red);
                            } else if (password.text.isEmpty) {
                              Common.toastMessaage(
                                  'Password cannot be empty', Colors.red);
                            } else {
                              LoginModel object = await HttpService.login(
                                  username.text, password.text,firebaseToken);

                              if (object.status == true) {
                                Common.saveSharedPref(
                                    "token", object.data!.token.toString());
                                Common.saveSharedPref(
                                    "userId", object.data!.userId.toString());

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                            object.data!.token.toString(),0)),
                                    (Route<dynamic> route) => false);

                                Common.toastMessaage(
                                    object.message, Colors.green);
                              } else {
                                Common.toastMessaage(
                                    object.message, Colors.red);
                              }
                            }

                            // Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(builder: (context) => Dashboard()),
                            //         (Route<dynamic> route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.purpleAccent,
                              shadowColor: Colors.purpleAccent,
                              elevation: 15,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Colors.purpleAccent,
                                  Colors.deepPurpleAccent
                                ]),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 200,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
