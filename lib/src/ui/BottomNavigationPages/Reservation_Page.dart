import 'package:flutter/material.dart';
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
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.pinkAccent,
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
          color: Colors.indigo,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                ListTile(
                  title: Text(
                    'Asad',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    'First App Project',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
                  icon: Icons.home,
                  title: 'Create Sub Admin',
                  onTap: () => navigateTo(context, SubAdmin()),
                ),
                MenuItem(
                  icon: Icons.person,
                  title: 'Create Saloon Admin',
                  onTap: () => navigateTo(context, SaloonAdmin()),
                ),
                MenuItem(
                  icon: Icons.shopping_basket,
                  title: 'Account Settings',
                  onTap: () => navigateTo(context, AccountSetting()),
                ),
                MenuItem(
                  icon: Icons.home,
                  title: 'Sub Admin Activites',
                  onTap: () => navigateTo(context, SubAdminActivities()),
                ),
                MenuItem(
                  icon: Icons.person,
                  title: 'Saloon Reservations',
                  onTap: () => navigateTo(context, SaloonReservation()),
                ),
                MenuItem(
                  icon: Icons.shopping_basket,
                  title: 'Terms&Conditions',
                  onTap: () => navigateTo(context, TermsAndConditions()),
                ),
                MenuItem(
                  icon: Icons.home,
                  title: 'Privacy Policies',
                  onTap: () => navigateTo(context, PrivacyPolicies()),
                ),
                MenuItem(
                  icon: Icons.person,
                  title: 'FAQs',
                  onTap: () => navigateTo(context, FAQs()),
                ),
                MenuItem(
                  icon: Icons.shopping_basket,
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
                  icon: Icons.settings,
                  title: 'Settings',
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
