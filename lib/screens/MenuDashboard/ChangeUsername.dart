import 'package:flutter/material.dart';

class ChangeUsername extends StatefulWidget {
  @override
  _ChangeUsernameState createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {

  String currentUsername;
  String newUsername;
  String confirmUsername;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget CurrentUsername() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Current Username'),
          cursorColor: Colors.black,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        currentUsername= value;
      },
    );
  }

  Widget NewUsername() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'New Username'),
          cursorColor: Colors.black,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        newUsername= value;
      },
    );
  }

  Widget ConfirmUsername() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Confirm Username'),
          cursorColor: Colors.black,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        confirmUsername= value;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Change Username', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                    print(currentUsername);
                    print(newUsername);
                    print(confirmUsername);
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
