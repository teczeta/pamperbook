import 'package:flutter/material.dart';

import '../constants.dart';
import 'developement_page.dart';

class BusinessSettingsPage extends StatefulWidget {
  const BusinessSettingsPage({Key? key}) : super(key: key);

  @override
  State<BusinessSettingsPage> createState() => _BusinessSettingsPageState();
}

class _BusinessSettingsPageState extends State<BusinessSettingsPage> {
  List<String> litems = [
    "My Profile",
    "Locations",
    "Forms",
    "SMS",
    "Booking Theme",
    "Opening Times",
    "Service"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Business Settings",
        style: TextStyle(color: textColorBlack)),
      backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        )
    ),

        body: buildContainer());
  }

  Container buildContainer() {
    return Container(
      child: ListView.separated(
          itemCount: litems.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                thickness: 0.1,
                color: textColorBlack,
              ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                navToSettingsPage(index);
              },
              child: ListTile(
                leading: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: textColorBlack,
                ),
                title: Text(litems.elementAt(index)),
              ),
            );
          }),
    );
  }

  void navToSettingsPage(int index) {
    switch(index) {
      case 0: {
        navAction(DevelopmentPage());
      }
      break;

      default: {
        navAction(DevelopmentPage());
      }
      break;
    }


  }
  void navAction(StatefulWidget businessSettingsPage) {
    Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
      builder: (_) => businessSettingsPage,
    ),
    );
  }
}
