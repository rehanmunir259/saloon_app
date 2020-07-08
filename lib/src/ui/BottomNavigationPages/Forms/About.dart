import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloon/widgets/my-field.dart';
import 'package:saloon/src/ui/utils/localdata.dart';


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
  final aboutController = TextEditingController();
  final atmosphereController = TextEditingController();
  final servicesController = TextEditingController();
  final languageController = TextEditingController();
  final paymentTController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget AboutSaloon() {
    return MyInputField(
      label: "About Saloon",
      controller: aboutController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        aboutSaloon = value;
      },
      multiLine: true,
    );
  }

  Widget Atmosphere() {
    return MyInputField(
      label: "Atmosphere",
      controller: atmosphereController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        atmospheres = value;
      },
      multiLine: true,
    );
  }

  Widget Services() {
    return MyInputField(
      label: "Facilities/Services",
      controller: servicesController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        services = value;
      },
      multiLine: true,
    );
  }

  Widget Languages() {
    return MyInputField(
      label: "Languages",
      controller: languageController,
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
    return MyInputField(
      label: "Payment",
      controller: paymentTController,
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

void storeData2(){
  LocalData.saloonModel.aboutSaloon = aboutController.text;
  LocalData.saloonModel.atmosphere = atmosphereController.text;
  LocalData.saloonModel.service = servicesController.text;
  LocalData.saloonModel.language = languageController.text;
  LocalData.saloonModel.paymentOption = paymentTController.text;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
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
                  color: Color(0xFF0d1137),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    storeData2();
                    Navigator.pushNamed(context, '/Image');
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
