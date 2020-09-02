import 'package:flutter/material.dart';
import 'package:saloon/widgets/textfield.dart';

import 'login.dart';

class SaloonSignUp extends StatefulWidget {
  @override
  _SaloonSignUpState createState() => _SaloonSignUpState();
}

class _SaloonSignUpState extends State<SaloonSignUp> {
  var _formkey = GlobalKey<FormState>();
  bool autoValidate = false;

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formkey,
        autovalidate: autoValidate,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SaloonTextField(
                  context: context,
                  controller: fnameController,
                  icon: Icons.person,
                  label: 'First Name',
                  validator: (value) {
                    return value.isEmpty ? "Please Enter FirstName" : null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                SaloonTextField(
                  context: context,
                  controller: lnameController,
                  icon: Icons.person,
                  label: 'Last Name',
                  validator: (value) {
                    return value.isEmpty ? "Please Enter LastName" : null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                SaloonTextField(
                  context: context,
                  controller: usernameController,
                  icon: Icons.person,
                  label: 'UserName',
                  validator: (value) {
                    return value.isEmpty ? "Please Enter UserName" : null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                SaloonTextField(
                  context: context,
                  controller: emailController,
                  icon: Icons.email,
                  label: 'Email',
                  validator: (value) {
                    return value.isEmpty ? "Please Enter Email" : null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                SaloonTextField(
                  obscure: true,
                  context: context,
                  controller: passwordController,
                  icon: Icons.lock,
                  label: 'Password',
                  validator: (value) {
                    return value.isEmpty ? "Please Enter Password" : null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SaloonLogin(),
                          ),
                        );
                      } else {
                        setState(() {
                          autoValidate = true;
                        });
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.teal[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
