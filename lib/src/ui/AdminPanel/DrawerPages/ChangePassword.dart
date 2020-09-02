import 'package:flutter/material.dart';
import 'package:saloon/widgets/my-field.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  Widget CurrentPassword() {
    return MyInputField(
      label: "Current Password",
      controller: currentPassController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget NewPassword() {
    return MyInputField(
      label: "New Password",
      controller: newPassController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget ConfirmPassword() {
    return MyInputField(
      label: "Confirm Password",
      controller: confirmPassController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0d1137),
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
                  color: Color(0xFF0d1137),
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
