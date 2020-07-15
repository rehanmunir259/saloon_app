import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloon/src/ui/BottomNavigationPages/reservationbody.dart';
import 'package:saloon/src/ui/DrawerPages/AccountSetting.dart';
import 'package:saloon/src/ui/DrawerPages/Contact.dart';
import 'package:saloon/src/ui/DrawerPages/FAQs.dart';
import 'package:saloon/src/ui/DrawerPages/PrivacyPolicies.dart';
import 'package:saloon/src/ui/DrawerPages/SaloonAdmin.dart';
import 'package:saloon/src/ui/DrawerPages/SaloonReservation.dart';
import 'package:saloon/src/ui/DrawerPages/SubAdmin.dart';
import 'package:saloon/src/ui/DrawerPages/SubAdminActivities.dart';
import 'package:saloon/src/ui/DrawerPages/TermsAndConditions.dart';
import 'package:saloon/src/ui/DrawerPages/discount.dart';
import 'package:saloon/src/ui/utils/navigator.dart';
import 'package:saloon/widgets/MenuItems.dart';

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

  List<Widget> cards = [
    SaloonResCard(),
    SaloonResCard(),
  ];
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
        title: Text(
          'Reservation Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0d1137),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              child: Text(
                'Upcoming Reservation',
              ),
            ),
            Tab(
              child: Text(
                'Historical Reservation',
              ),
            ),
          ],
          controller: controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
        ),
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
                  icon: FontAwesomeIcons.percentage,
                  title: 'Add Discount',
                  onTap: () => navigateTo(context, Numberpicker()),
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
      body: TabBarView(
        children: cards,
        controller: controller,
      ),
    );
  }
}
