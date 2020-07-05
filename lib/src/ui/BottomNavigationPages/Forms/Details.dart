import 'package:flutter/material.dart';
import 'package:saloon/widgets/my-field.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String name;
  String address;
  String openingT;
  String closingT;
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final openingTController = TextEditingController();
  final closingTController = TextEditingController();
  var city = ['London', 'NewYork', 'Paris', 'Tokyo'];
  var currentItemSelected = 'London';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget createName() {
    return MyInputField(
      label: "Name of Saloon",
      controller: nameController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget createAddress() {
    return MyInputField(
      label: "Address",
      controller: addressController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        address = value;
      },
      multiLine: true,
    );
  }

  Widget openingTime() {
    return MyInputField(
      label: "Opening Time",
      controller: openingTController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        openingT = value;
      },
    );
  }

  Widget closingTime() {
    return MyInputField(
      label: "Closing Time",
      controller: closingTController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      onSaved: (String value) {
        closingT = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              createName(),
              SizedBox(
                height: 30,
              ),
              createAddress(),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Select the city:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  DropdownButton<String>(
                    items: city.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        this.currentItemSelected = newValueSelected;
                      });
                    },
                    value: currentItemSelected,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              openingTime(),
              SizedBox(
                height: 30,
              ),
              closingTime(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: RaisedButton(
                  elevation: 5,
                  color: Colors.teal,
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

                    Navigator.pushNamed(context, '/About');
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
