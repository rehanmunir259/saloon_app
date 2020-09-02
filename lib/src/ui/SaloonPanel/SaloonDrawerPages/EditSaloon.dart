import 'package:flutter/material.dart';
import 'package:saloon/widgets/my-field.dart';

class EditSaloon extends StatefulWidget {
  @override
  _EditSaloonState createState() => _EditSaloonState();
}

class _EditSaloonState extends State<EditSaloon> {
  var city = ['London', 'NewYork', 'Paris', 'Tokyo'];
  var currentItemSelected;

  Widget createName() {
    return MyInputField(
      label: "Name of Saloon",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  Widget createAddress() {
    return MyInputField(
      label: "Address",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      multiLine: true,
    );
  }

  Widget openingTime() {
    return MyInputField(
      label: "Opening Time",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  Widget closingTime() {
    return MyInputField(
      label: "Closing Time",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  Widget AboutSaloon() {
    return MyInputField(
      label: "About Saloon",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      multiLine: true,
    );
  }

  // ignore: non_constant_identifier_names
  Widget Atmosphere() {
    return MyInputField(
      label: "Atmosphere",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      multiLine: true,
    );
  }

  // ignore: non_constant_identifier_names
  Widget Services() {
    return MyInputField(
      label: "Facilities/Services",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
      multiLine: true,
    );
  }

  // ignore: non_constant_identifier_names
  Widget Languages() {
    return MyInputField(
      label: "Languages",
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget Payment() {
    return MyInputField(
      label: "Payment",
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
          'Edit Saloon',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0d1137),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
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
                    hint: Text('Select the City'),
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
            ],
          ),
        ),
      ),
    );
  }
}
