import 'package:flutter/material.dart';

import '../constants.dart';

class DevelopmentPage extends StatefulWidget {
  const DevelopmentPage({Key? key}) : super(key: key);

  @override
  State<DevelopmentPage> createState() => _DevelopmentPageState();
}

class _DevelopmentPageState extends State<DevelopmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Development In Progress",
          style: TextStyle(color: textColorBlack)),

            backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),

      body: Container(
        child: Center(
          child: Text("Development In Progress"),
        ),
      ),
    );
  }
}
