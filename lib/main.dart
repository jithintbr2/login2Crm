// @dart=2.9
import 'package:crm_admin/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(home:SplashScreen()),);
}
initFirebase() async {
  await Firebase.initializeApp();
}