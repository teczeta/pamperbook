// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pamperbook/pages/bottom_bar_page.dart';
import 'package:pamperbook/pages/dash_board_page.dart';
import 'package:pamperbook/pages/splash_page.dart';
import 'package:pamperbook/pages/view_appointment_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Pamper Book",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}






