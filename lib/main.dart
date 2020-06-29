import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:saloon/screens/pageview.dart';
import 'package:saloon/screens/reservation_detail.dart';
//import 'package:saloon/screens/reservation_cards.dart';
//import 'package:saloon/formscreen.dart';
//import 'package:saloon/numberpicker.dart';
=======
import 'package:saloon/screens/LandingPage/startingPage.dart';
import 'package:saloon/screens/MenuDashboard/AccountSetting.dart';
import 'package:saloon/screens/MenuDashboard/ChangePassword.dart';
import 'package:saloon/screens/MenuDashboard/ChangeUsername.dart';
import 'package:saloon/screens/MenuDashboard/SaloonAdmin.dart';
import 'package:saloon/screens/MenuDashboard/SubAdmin.dart';
import 'package:saloon/screens/MenuDashboard/SaloonReservation.dart';
import 'package:saloon/screens/BottomNavigation/Reservation_Page.dart';
>>>>>>> 511ee210671a48d889834d37474d0e85dd720c58




void main() => runApp(SaloonApp());

class SaloonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      //initialRoute: '/',
      //routes: {
      //  '/': (context)=>FormScreen(),
      //  '/first':(context)=>Numberpicker(),
      //},
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Pageview(),
      ),
=======
      home: startingPage(),
      routes: {
        '/SubAdmin': (context) => SubAdmin(),
        '/SaloonAdmin': (context) => SaloonAdmin(),
        '/AccountSetting': (context) => AccountSetting(),
        '/ChangeUsername': (context) => ChangeUsername(),
        '/ChangePassword': (context) => ChangePassword(),
        '/SaloonReservation': (context) => SaloonReservation(),
      },
>>>>>>> 511ee210671a48d889834d37474d0e85dd720c58
    );
  }
}

