import 'package:flutter/material.dart';
import 'package:pamperbook/pages/business_settings_page.dart';
import 'package:pamperbook/pages/customer_list_page.dart';
import 'package:pamperbook/pages/developement_page.dart';
import 'package:pamperbook/pages/login_page.dart';
import 'package:pamperbook/pages/new_appointment_page.dart';
import 'package:pamperbook/pages/view_appointment_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> litems = [
    "Business Settings",
    "Payments",
    "Customers",
    'Staff',
    "Reviews",
    "Appointment",
    "Unavailability",
    "Logout"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Menu",
        style: TextStyle(color: textColorBlack)),

            backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),

      ),
    body: buildContainer(),
    );
  }

  Container buildContainer(){


    return Container(
      child: ListView.separated(
          itemCount: litems.length,
          separatorBuilder: (BuildContext context, int index) =>
              Divider(
                height: 1, thickness: 0.1, color: textColorBlack,),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){

                navToSettingsPage(index);

              },
              child: ListTile(

                leading: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: textColorBlack,),
                title: Text(litems.elementAt(index)),
              ),
            );
          }),
    );
  }

  void navToSettingsPage(int index) {
    switch(index) {
      case 0: {
        navAction(BusinessSettingsPage());
      }
      break;

      case 2:{
        navAction(CustomerListPage());

      }
      break;
      case 5:{
        navAction(ViewAppointmentPage());

      }
      break;

      case 7:{

        showAlertDialogCommon(
            context, "Are you sure to logout?", () {

          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (_) => LoginPage(),
          ),
          );

        });
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

  showAlertDialogCommon(BuildContext context, String message, onOkButtonClicked) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.clear();


        Navigator.of(context,rootNavigator: true).pop();
        onOkButtonClicked();
      },
    );  Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context,rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Pamper Book"),
      content: Text(message),
      actions: [
        cancelButton,
        okButton
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
