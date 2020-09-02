import 'package:flutter/material.dart';
import 'package:saloon/src/ui/AdminPanel/AdminBottomBar/AnimatedBottomBar.dart';
import 'package:saloon/src/ui/UserPanel/UserBottomNavigationPages/UserHome.dart';
import 'package:saloon/src/ui/UserPanel/UserBottomNavigationPages/UserReservation_Page.dart';

class UserBottomBar extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: 'Home', icon: Icons.home, color: Color(0xFF0d1137)),
    BarItem(
        text: 'Reservations', icon: Icons.schedule, color: Color(0xFF0d1137)),
  ];
  @override
  _UserBottomBarState createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  int selectedBarIndex = 0;
  final List<Widget> screens = [UserHome(), UserReservations()];
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
