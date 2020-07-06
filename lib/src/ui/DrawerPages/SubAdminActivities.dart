import 'package:flutter/material.dart';

class SubAdminActivities extends StatefulWidget {
  @override
  _SubAdminActivitiesState createState() => _SubAdminActivitiesState();
}

class _SubAdminActivitiesState extends State<SubAdminActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Admin Activites'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Activites'),
      ),
    );
  }
}
