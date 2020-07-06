import 'package:flutter/material.dart';
import 'package:saloon/screens/pageview.dart';
import 'package:saloon/widgets/textfield.dart';

class SaloonLogin extends StatefulWidget {
  @override
  _SaloonLoginState createState() => _SaloonLoginState();
}

class _SaloonLoginState extends State<SaloonLogin> {
  var _formkey = GlobalKey<FormState>();
  bool autoValidate = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
          autovalidate: autoValidate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                          builder: (context) => Pageview(),
                        ),
                      );
                    } else {
                      setState(() {
                        autoValidate = true;
                      });
                    }
                  },
                  child: Text(
                    'Login',
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
    );
  }
}
