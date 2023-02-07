import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pamperbook/constants.dart';
import 'package:pamperbook/pages/customer_list_page.dart';
import 'package:pamperbook/pages/developement_page.dart';
import 'package:pamperbook/pages/new_appointment_page.dart';
import 'package:pamperbook/pages/settings_page.dart';
import 'package:pamperbook/pages/view_appointment_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'dash_board_page.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> _buildScreens() {
    return [
      DashBoardPage(),
      CustomerListPage(),
      NewAppointmentPage(),
      DevelopmentPage(),
      SettingsPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.house_fill),
        inactiveIcon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: textColorUnknown,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_alt),
        inactiveIcon: Icon(CupertinoIcons.person),
        title: ("Customer"),
        activeColorPrimary: textColorUnknown,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.add),
        inactiveIcon: Icon(CupertinoIcons.add),
        title: ("Appointment"),
        activeColorPrimary: textColorUnknown,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.calendar_badge_plus),
        inactiveIcon: Icon(CupertinoIcons.calendar),
        title: ("Schedule"),
        activeColorPrimary: textColorUnknown,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_applications_rounded),
        inactiveIcon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: textColorUnknown,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

    ];
  }
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      hideNavigationBar: false,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}