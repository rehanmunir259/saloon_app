import 'package:flutter/material.dart';
import 'package:saloon/src/ui/AnimatedBottomBar/BottomBarNavigation.dart';
import 'package:saloon/src/ui/BottomNavigationPages/Forms/About.dart';
import 'package:saloon/src/ui/BottomNavigationPages/Forms/Details.dart';
import 'package:saloon/src/ui/BottomNavigationPages/Forms/ImagePickerPage.dart';
import 'package:saloon/src/ui/DrawerPages/AccountSetting.dart';
import 'package:saloon/src/ui/DrawerPages/ChangePassword.dart';
import 'package:saloon/src/ui/DrawerPages/ChangeUsername.dart';
import 'package:saloon/src/ui/DrawerPages/SaloonAdmin.dart';
import 'package:saloon/src/ui/DrawerPages/SaloonReservation.dart';
import 'package:saloon/src/ui/DrawerPages/SubAdmin.dart';

class SaloonApp extends MaterialApp {

  SaloonApp(
  )
      : super(
<<<<<<< HEAD
          home: ImagePickerPage(),
=======
          home: BottomBarNavigation(),
          debugShowCheckedModeBanner: false,
>>>>>>> b971eab4fae204d4415b967ac41e7fb9665dba84
          routes: {
            '/SubAdmin': (context) => SubAdmin(),
            '/SaloonAdmin': (context) => SaloonAdmin(),
            '/AccountSetting': (context) => AccountSetting(),
            '/ChangeUsername': (context) => ChangeUsername(),
            '/ChangePassword': (context) => ChangePassword(),
            '/SaloonReservation': (context) => SaloonReservation(),
            '/Details': (context) => Details(),
            '/About': (context) => About(),
            '/Image': (context) => ImagePickerPage(),
           // '/Discount': (context) => Numberpicker(),
          },
        );
}
