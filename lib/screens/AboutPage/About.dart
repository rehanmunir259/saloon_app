import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String aboutSaloon;
  String atmospheres;
  String services;
  String language;
  String payment;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget AboutSaloon() {
    return TextFormField(
      maxLines: 3,
      decoration: InputDecoration(
          labelText: 'About Saloon'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        aboutSaloon= value;
      },
    );
  }

  Widget Atmosphere() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Atmosphere'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        atmospheres = value;
      },
    );
  }

  Widget Services() {
    return TextFormField(
        maxLines: 2,
      decoration: InputDecoration(
          labelText: 'Facilities/Services'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        services = value;
      },
    );
  }

  Widget Languages() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Spoken Languages'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        language = value;
      },
    );
  }

  Widget Payment() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'Payment Option'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        payment = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              AboutSaloon(),
              SizedBox(
                height: 30,
              ),
              Atmosphere(),
              SizedBox(
                height: 30,
              ),
              Services(),
              SizedBox(
                height: 30,
              ),
              Languages(),
              SizedBox(
                height: 30,
              ),
              Payment(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(aboutSaloon);
                    print(atmospheres);
                    print(services);
                    print(language);
                    print(payment);
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
