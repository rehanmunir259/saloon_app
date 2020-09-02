import 'package:flutter/material.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/SaloonChangePassword.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonDrawerPages/SaloonChangeUsername.dart';
import 'package:saloon/src/ui/utils/navigator.dart';

class SaloonAccountSettings extends StatefulWidget {
  @override
  _SaloonAccountSettingsState createState() => _SaloonAccountSettingsState();
}

class _SaloonAccountSettingsState extends State<SaloonAccountSettings> {
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
                child: Text('CHANGE USERAME',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  navigateTo(context, SaloonChangeUsername());
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
                  navigateTo(context, SaloonChangePassword());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
