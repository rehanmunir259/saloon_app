import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFFFC0202),
        title: Text('Notifications'),
      ),
        body: Container(
        child: Center(child: Text('Notifiactions')),
        ),
    );
  }
}
