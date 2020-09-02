import 'package:flutter/material.dart';
import 'package:saloon/src/ui/AdminPanel/AdminBottomBar/AdminBottomBar.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomBar/SaloonBottomBar.dart';
import 'package:saloon/src/ui/UserPanel/UserBottomBar/UserBottomBar.dart';

class SaloonApp extends MaterialApp {
  SaloonApp()
      : super(
          home: SaloonBottomBar(),
          debugShowCheckedModeBanner: false,
        );
}
