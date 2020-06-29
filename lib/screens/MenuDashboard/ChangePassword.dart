import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  String currentPassword;
  String newPassword;
  String confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget CurrentPassword() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Current Password'),
          cursorColor: Colors.black,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        currentPassword= value;
      },
    );
  }

  Widget NewPassword() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'New Password'),
          cursorColor: Colors.black,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        newPassword= value;
      },
    );
  }

  Widget ConfirmPassword() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Confirm Password'),
          cursorColor: Colors.black,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        confirmPassword= value;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Change Password', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              CurrentPassword(),
              SizedBox(
                height: 30,
              ),
              NewPassword(),
              SizedBox(
                height: 30,
              ),
              ConfirmPassword(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: RaisedButton(
                  color: Colors.black,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(currentPassword);
                    print(newPassword);
                    print(confirmPassword);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
