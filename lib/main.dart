


import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/ui/dashboard.dart';
import 'package:firebaseapp/ui/forgetpass.dart';
import 'package:firebaseapp/ui/login.dart';
import 'package:firebaseapp/ui/registeration.dart';
import 'package:firebaseapp/ui/screen1.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:Screen1(),
      routes: {
      Login.routeName : (context) => Login(),
      Registeration.routeName : (context) => Registeration(),
      Dashboard.routeName : (context) => Dashboard(),
      Forget.routeName : (context) => Forget(),
      },
    );
  }
}
