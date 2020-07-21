import 'package:flutter/material.dart';
import 'package:saloon/widgets/my-field.dart';

class SaloonAdmin extends StatefulWidget {
  @override
  _SaloonAdminState createState() => _SaloonAdminState();
}

class _SaloonAdminState extends State<SaloonAdmin> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget createUsername() {
    return MyInputField(
      label: "Current Username",
      controller: userNameController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  Widget createPassword() {
    return MyInputField(
      label: " Password",
      controller: passwordController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  Widget confirmPassword() {
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
          'Create Saloon Admin',
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
              createUsername(),
              SizedBox(
                height: 30,
              ),
              createPassword(),
              SizedBox(
                height: 30,
              ),
              confirmPassword(),
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
