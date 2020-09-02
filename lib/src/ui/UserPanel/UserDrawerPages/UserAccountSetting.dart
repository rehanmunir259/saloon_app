import 'package:flutter/material.dart';
import 'package:saloon/src/ui/UserPanel/UserDrawerPages/UserChangePassword.dart';
import 'package:saloon/src/ui/UserPanel/UserDrawerPages/UserChangeUsername.dart';
import 'package:saloon/src/ui/utils/navigator.dart';

class UserAccountSettings extends StatefulWidget {
  @override
  _UserAccountSettingsState createState() => _UserAccountSettingsState();
}

class _UserAccountSettingsState extends State<UserAccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Settings',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0d1137),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints.expand(width: 200, height: 40),
              child: RaisedButton(
                color: Color(0xFF0d1137),
                elevation: 5,
                child: Text('CHANGE USERNAME',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  navigateTo(context, UserChangeUsername());
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(width: 200, height: 40),
              child: RaisedButton(
                color: Color(0xFF0d1137),
                elevation: 5,
                child: Text('CHANGE PASSWORD',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  navigateTo(context, UserChangePassword());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
