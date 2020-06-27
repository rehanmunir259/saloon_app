import 'package:flutter/material.dart';
import 'package:saloon/screens/BottomNavigation/reservationbody.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }
  List<Widget> cards =[
    SaloonResCard(),
    SaloonResCard(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Page', style: TextStyle(color: Colors.black),),
        centerTitle: true,
         iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              child: Text('Upcoming Reservation', style: TextStyle(color: Colors.black),),
            ),
             Tab(
              child: Text('Historical Reservation', style: TextStyle(color: Colors.black),),
            ),
          ],
          controller: controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.black,
        ),
      ),
      body: TabBarView(
        children: cards,
        controller: controller,
        ),
    );
  }
}
