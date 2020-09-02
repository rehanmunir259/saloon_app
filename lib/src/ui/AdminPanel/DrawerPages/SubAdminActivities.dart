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
        backgroundColor: Color(0xFF0d1137),
        title: Text('Sub Admin Activites'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Asad',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    'First App Project',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Icon(Icons.perm_identity, color: Colors.white),
                    radius: 40,
                  ),
                ),
                Divider(
                  height: 40,
                  thickness: 0.5,
                  color: Colors.grey,
                  indent: 32,
                  endIndent: 32,
                ),
              ],
            );
          }),
    );
  }
}
