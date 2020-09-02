import 'package:flutter/material.dart';
import 'package:saloon/src/ui/AdminPanel/BottomNavigationPages/A-Z.dart';
import 'package:saloon/src/ui/AdminPanel/BottomNavigationPages/AdminHome.dart';
import 'AnimatedBottomBar.dart';

class AdminBottomBar extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: 'Home', icon: Icons.home, color: Color(0xFF0d1137)),
    BarItem(text: 'A-Z', icon: Icons.schedule, color: Color(0xFF0d1137)),
  ];
  @override
  _AdminBottomBarState createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  int selectedBarIndex = 0;
  final List<Widget> screens = [
    AdminHome(),
    AZ(),
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
