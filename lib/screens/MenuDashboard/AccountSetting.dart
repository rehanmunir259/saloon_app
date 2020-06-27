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
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Account Settings', style: TextStyle(color:Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 70 ,right: 70, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.black,
              elevation: 5,
              child:Text('CHANGE USERAME', style: TextStyle(color:Colors.white, fontSize: 19 )),
              onPressed:(){Navigator.pushNamed(context, '/ChangeUsername');}, 
            ),
            SizedBox(height: 15,),
             RaisedButton(
              color: Colors.white,
              elevation: 5,
              child:Text('CHANGE PASSWORD', style: TextStyle(color:Colors.black, fontSize: 19 )),
              onPressed:(){Navigator.pushNamed(context, '/ChangePassword');}, 
              
            ),
          ],
        ),
      ),
    );
  }
} 