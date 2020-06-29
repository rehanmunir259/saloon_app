import 'package:flutter/material.dart';
import 'package:saloon/screens/BottomNavigation/home.dart';
import 'package:saloon/screens/BottomNavigation/notification.dart';
import 'package:saloon/screens/BottomNavigation/reservation_page.dart';



class startingPage extends StatefulWidget {
  @override
  _startingPageState createState() => _startingPageState();
}

class _startingPageState extends State<startingPage> {

  int _currentindex=0;
  final List<Widget> screens=[
    Home(),
    ReservationPage(),
    notification(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Reservations'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            title: Text('Notification'),
          ),
        ],
        onTap: (index){
          setState(() {
            _currentindex=index;
          });
        },
      ),
    );
  }
}