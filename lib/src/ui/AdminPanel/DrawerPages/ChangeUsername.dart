import 'package:flutter/material.dart';
import 'package:saloon/widgets/my-field.dart';

class ChangeUsername extends StatefulWidget {
  @override
  _ChangeUsernameState createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  final currentUserController = TextEditingController();
  final newUserController = TextEditingController();
  final confirmUserController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  Widget CurrentUsername() {
    return MyInputField(
      label: "Current Username",
      controller: currentUserController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget NewUsername() {
    return MyInputField(
      label: "New Username",
      controller: currentUserController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget ConfirmUsername() {
    return MyInputField(
      label: "Confirm Username",
      controller: currentUserController,
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
          'Change Username',
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
              CurrentUsername(),
              SizedBox(
                height: 30,
              ),
              NewUsername(),
              SizedBox(
                height: 30,
              ),
              ConfirmUsername(),
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
