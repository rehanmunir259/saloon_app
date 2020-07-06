import 'package:flutter/material.dart';
import 'package:saloon/src/ui/DrawerPages/AccountSetting.dart';
import 'package:saloon/src/ui/DrawerPages/Contact.dart';
import 'package:saloon/src/ui/DrawerPages/FAQs.dart';
import 'package:saloon/src/ui/DrawerPages/PrivacyPolicies.dart';
import 'package:saloon/src/ui/DrawerPages/SaloonAdmin.dart';
import 'package:saloon/src/ui/DrawerPages/SaloonReservation.dart';
import 'package:saloon/src/ui/DrawerPages/SubAdmin.dart';
import 'package:saloon/src/ui/DrawerPages/SubAdminActivities.dart';
import 'package:saloon/src/ui/DrawerPages/TermsAndConditions.dart';
import 'package:saloon/src/ui/utils/navigator.dart';
import 'package:saloon/widgets/MenuItems.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
        backgroundColor: Color(0xFF0d1137),
        title: Text('FormPage'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Color(0xFF0d1137),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  title: Text(
                    'Asad',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    'First App Project',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  leading: CircleAvatar(
                    child: Icon(Icons.perm_identity, color: Colors.white),
                    radius: 40,
                  ),
                ),
                Divider(
                  height: 64,
                  thickness: 0.5,
                  color: Colors.white.withOpacity(0.5),
                  indent: 32,
                  endIndent: 32,
                ),
                MenuItem(
                  icon: Icons.group_add,
                  title: 'Create Sub Admin',
                  onTap: () => navigateTo(context, SubAdmin()),
                ),
                MenuItem(
                  icon: Icons.person_pin,
                  title: 'Create Saloon Admin',
                  onTap: () => navigateTo(context, SaloonAdmin()),
                ),
                MenuItem(
                  icon: Icons.settings,
                  title: 'Account Settings',
                  onTap: () => navigateTo(context, AccountSetting()),
                ),
                MenuItem(
                  icon: Icons.assignment,
                  title: 'Sub Admin Activites',
                  onTap: () => navigateTo(context, SubAdminActivities()),
                ),
                MenuItem(
                  icon: Icons.assignment_ind,
                  title: 'Saloon Reservations',
                  onTap: () => navigateTo(context, SaloonReservation()),
                ),
                MenuItem(
                  icon: Icons.chat,
                  title: 'Terms&Conditions',
                  onTap: () => navigateTo(context, TermsAndConditions()),
                ),
                MenuItem(
                  icon: Icons.event_note,
                  title: 'Privacy Policies',
                  onTap: () => navigateTo(context, PrivacyPolicies()),
                ),
                MenuItem(
                  icon: Icons.question_answer,
                  title: 'FAQs',
                  onTap: () => navigateTo(context, FAQs()),
                ),
                MenuItem(
                  icon: Icons.phone,
                  title: 'Contact Us',
                  onTap: () => navigateTo(context, Contact()),
                ),
                Divider(
                  height: 64,
                  thickness: 0.5,
                  color: Colors.white.withOpacity(0.5),
                  indent: 32,
                  endIndent: 32,
                ),
                MenuItem(
                  icon: Icons.person_add,
                  title: 'Sign Up',
                ),
                MenuItem(
                  icon: Icons.perm_identity,
                  title: 'Sign In',
                ),
                MenuItem(
                  icon: Icons.exit_to_app,
                  title: 'Logout',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Color(0xFF0d1137),
            onPressed: () {
              Navigator.pushNamed(context, '/Details');
            },
            child: Text(
              'Create New',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
