import 'package:flutter/material.dart';
import 'package:saloon/screens/MenuDashboard/AccountSetting.dart';
import 'package:saloon/screens/MenuDashboard/ChangePassword.dart';
import 'package:saloon/screens/MenuDashboard/ChangeUsername.dart';
import 'package:saloon/screens/MenuDashboard/SaloonAdmin.dart';
import 'package:saloon/screens/MenuDashboard/SubAdmin.dart';
import 'package:saloon/screens/MenuDashboard/SaloonReservation.dart';
import 'package:saloon/screens/pageview.dart';




void main() => runApp(SaloonApp());

class SaloonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pageview(),
      routes: {
        '/SubAdmin': (context) => SubAdmin(),
        '/SaloonAdmin': (context) => SaloonAdmin(),
        '/AccountSetting': (context) => AccountSetting(),
        '/ChangeUsername': (context) => ChangeUsername(),
        '/ChangePassword': (context) => ChangePassword(),
        '/SaloonReservation': (context) => SaloonReservation(),
      },
    );
  }
}

