import 'package:PVGasReport/src/screen/home.dart';
import 'package:PVGasReport/src/screen/login.dart';
import 'package:PVGasReport/src/screen/plash.dart';
import 'package:PVGasReport/src/theme/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routes: <String, WidgetBuilder>{
        '/': (context) => Plash(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }
}
