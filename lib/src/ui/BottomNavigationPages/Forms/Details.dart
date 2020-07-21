import 'package:flutter/material.dart';
import 'package:saloon/src/ui/utils/localdata.dart';
import 'package:saloon/widgets/my-field.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final openingTController = TextEditingController();
  final closingTController = TextEditingController();
  var city = ['London', 'NewYork', 'Paris', 'Tokyo'];
  var currentItemSelected;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget createName() {
    return MyInputField(
      label: "Name of Saloon",
      controller: nameController,
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
      controller: addressController,
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
      controller: openingTController,
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
      controller: closingTController,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field cannot be empty';
        }
      },
    );
  }

  
void storeData(){
  LocalData.saloonModel.name = nameController.text;
  LocalData.saloonModel.address = addressController.text;
  LocalData.saloonModel.closingTime = closingTController.text;
  LocalData.saloonModel.openingTime = openingTController.text;
  LocalData.saloonModel.city = currentItemSelected;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
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
              Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: RaisedButton(
                  elevation: 5,
                  color: Color(0xFF0d1137),
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
                    storeData();

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

