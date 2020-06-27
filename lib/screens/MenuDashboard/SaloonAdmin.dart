import 'package:flutter/material.dart';

class SaloonAdmin extends StatefulWidget {
  @override
  _SaloonAdminState createState() => _SaloonAdminState();
}

class _SaloonAdminState extends State<SaloonAdmin> {

  String username;
  String password;
  String confirmPass;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget createUsername() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Username'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        username= value;
      },
    );
  }

  Widget createPassword() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Password'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        password= value;
      },
    );
  }

  Widget confirmPassword() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Confirm Password'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        confirmPass= value;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Create Saloon Admin', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                    print(username);
                    print(password);
                    print(confirmPass);
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
