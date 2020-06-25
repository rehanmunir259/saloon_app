import 'package:flutter/material.dart';
//import 'package:saloon/screens/pageview.dart';
//import 'package:saloon/screens/reservation_cards.dart';
import 'package:saloon/screens/reservation_page.dart';
//import 'package:saloon/formscreen.dart';
//import 'package:saloon/numberpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/',
      //routes: {
      //  '/': (context)=>FormScreen(),
      //  '/first':(context)=>Numberpicker(),
      //},
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ReservationPage(),
      ),
    );
  }
}
