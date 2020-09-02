import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon/src/ui/UserPanel/UserDrawerPages/UserAccountSetting.dart';
import 'package:saloon/src/ui/UserPanel/UserDrawerPages/UserFAQs.dart';
import 'package:saloon/src/ui/UserPanel/UserDrawerPages/UserPrivacyPolicies.dart';
import 'package:saloon/src/ui/UserPanel/UserDrawerPages/UserTermsAndConditions.dart';
import 'package:saloon/src/ui/UserPanel/UserTabPages/UserLiked.dart';
import 'package:saloon/src/ui/UserPanel/UserTabPages/UserSaloons.dart';
import 'package:saloon/src/ui/utils/navigator.dart';
import 'package:saloon/widgets/MenuItems.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final _key = GlobalKey<ScaffoldState>();

  final List<Widget> tabPages = [UserSaloons(), UserLiked()];

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
                    onTap: () => navigateTo(context, UserAccountSettings()),
                  ),
                  MenuItem(
                    icon: Icons.chat,
                    title: 'Terms&Conditions',
                    onTap: () => navigateTo(context, UserTermsAndConditions()),
                  ),
                  MenuItem(
                    icon: Icons.event_note,
                    title: 'Privacy Policies',
                    onTap: () => navigateTo(context, UserPrivacyPolicies()),
                  ),
                  MenuItem(
                    icon: Icons.question_answer,
                    title: 'FAQs',
                    onTap: () => navigateTo(context, UserFAQS()),
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
          children: <Widget>[UserSaloons(), UserLiked()],
        ),
      ),
    );
  }
}
