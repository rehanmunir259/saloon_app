import 'package:flutter/material.dart';
import 'package:saloon/screens/reservationbody.dart';

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
        title: Text('Reservation Page'),
        backgroundColor: Colors.teal,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              child: Text('Upcoming Reservation'),
            ),
             Tab(
              child: Text('Historical Reservation'),
            ),
          ],
          controller: controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade400,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.amber,
        ),
      ),
      body: TabBarView(
        children: cards,
        controller: controller,
        ),
    );
  }
}
