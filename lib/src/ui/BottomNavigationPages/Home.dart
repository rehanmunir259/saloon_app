import 'package:flutter/cupertino.dart';
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
import 'package:saloon/src/ui/TabPages/Liked.dart';
import 'package:saloon/src/ui/TabPages/grid-package.dart';
import 'package:saloon/widgets/MenuItems.dart';
import 'package:saloon/src/ui/utils/navigator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _key = GlobalKey<ScaffoldState>();

  final List<Widget> tabPages = [
    GridPackage(),
    Liked(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _key,
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _key.currentState.openDrawer();
            },
          ),
          title: Text(
            'Saloon',
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo.shade400,
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: ('Categories'),
              ),
              Tab(
                text: ('Liked'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[GridPackage(), Liked()],
        ),
      ),
    );
  }
}
