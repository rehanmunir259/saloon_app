import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon/src/ui/AdminPanel/DrawerPages/discount.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomNavigationPages/Forms/Details.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/EditSaloon.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/SaloonAccountSetting.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/SaloonContact.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/SaloonFAQs.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/SaloonPrivacyPolicies.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/SaloonTermsAndConditions.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonTabPages/SaloonLiked.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonTabPages/SaloonPanelSaloon.dart';
import 'package:saloon/src/ui/utils/navigator.dart';
import 'package:saloon/widgets/MenuItems.dart';

class SaloonHome extends StatefulWidget {
  @override
  _SaloonHomeState createState() => _SaloonHomeState();
}

class _SaloonHomeState extends State<SaloonHome> {
  final _key = GlobalKey<ScaffoldState>();

  final List<Widget> tabPages = [SaloonPanelSaloons(), SaloonLiked()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _key,
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
                    icon: Icons.settings,
                    title: 'Account Settings',
                    onTap: () => navigateTo(context, SaloonAccountSettings()),
                  ),
                  MenuItem(
                    icon: Icons.edit,
                    title: 'Edit Saloon',
                    onTap: () => navigateTo(context, EditSaloon()),
                  ),
                  MenuItem(
                    icon: Icons.search,
                    title: 'Add Discount',
                    onTap: () => navigateTo(context, Numberpicker()),
                  ),
                  MenuItem(
                    icon: Icons.chat,
                    title: 'Terms&Conditions',
                    onTap: () =>
                        navigateTo(context, SaloonTermsAndConditions()),
                  ),
                  MenuItem(
                    icon: Icons.event_note,
                    title: 'Privacy Policies',
                    onTap: () => navigateTo(context, SaloonPrivacyPolicies()),
                  ),
                  MenuItem(
                    icon: Icons.question_answer,
                    title: 'FAQs',
                    onTap: () => navigateTo(context, SaloonFAQs()),
                  ),
                  MenuItem(
                    icon: Icons.phone,
                    title: 'Contact Us',
                    onTap: () => navigateTo(context, SaloonContact()),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateTo(context, Details());
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF0d1137),
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
          backgroundColor: Color(0xFF0d1137),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: ('Saloons'),
              ),
              Tab(
                text: ('Liked'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[SaloonPanelSaloons(), SaloonLiked()],
        ),
      ),
    );
  }
}
