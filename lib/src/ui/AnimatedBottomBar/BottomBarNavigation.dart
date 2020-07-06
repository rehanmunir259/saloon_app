import 'package:flutter/material.dart';
import 'package:saloon/src/ui/BottomNavigationPages/Form.dart';
import 'package:saloon/src/ui/BottomNavigationPages/Home.dart';
import 'package:saloon/src/ui/BottomNavigationPages/Reservation_Page.dart';
import 'AnimatedBottomBar.dart';

class BottomBarNavigation extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: 'Home', icon: Icons.home, color: Color(0xFF0d1137)),
    BarItem(
        text: 'Reservations', icon: Icons.schedule, color: Color(0xFF0d1137)),
    BarItem(
        text: 'Form', icon: Icons.chrome_reader_mode, color: Color(0xFF0d1137)),
  ];
  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int selectedBarIndex = 0;
  final List<Widget> screens = [
    Home(),
    ReservationPage(),
    FormPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: <Widget>[
        Expanded(child: screens[selectedBarIndex]),
        AnimatedBottomBar(
          barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 150),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          },
        ),
      ]),
    );
  }
}
