import 'package:flutter/material.dart';

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
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
                  Navigator.pushNamed(context, '/ChangeUsername');
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
                  Navigator.pushNamed(context, '/ChangePassword');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
