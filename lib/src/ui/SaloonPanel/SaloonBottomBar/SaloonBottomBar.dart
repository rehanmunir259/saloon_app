import 'package:flutter/material.dart';
import 'package:saloon/src/ui/AdminPanel/AdminBottomBar/AnimatedBottomBar.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomNavigationPages/SaloonForm.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomNavigationPages/SaloonHome.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomNavigationPages/SaloonReservation_Page.dart';

class SaloonBottomBar extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: 'Home', icon: Icons.home, color: Color(0xFF0d1137)),
    BarItem(
        text: 'Reservations', icon: Icons.schedule, color: Color(0xFF0d1137)),
  ];
  @override
  _SaloonBottomBarState createState() => _SaloonBottomBarState();
}

class _SaloonBottomBarState extends State<SaloonBottomBar> {
  int selectedBarIndex = 0;
  final List<Widget> screens = [
    SaloonHome(),
    SaloonReservations(),
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
