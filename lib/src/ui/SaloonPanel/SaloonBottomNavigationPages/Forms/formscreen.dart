import 'package:flutter/material.dart';


class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String country;
  String city;
  TextEditingController _saloonname = TextEditingController();
  TextEditingController _address = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildSaloonName() {
    return TextFormField(
      maxLength: 25,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Saloon Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Saloon Name is Required';
        }
        return null;
      },
      controller: _saloonname,
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      maxLength: 225,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Address'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      controller: _address,
    );
  }

  String selected = "";
  String selected2 = '';
  bool disabledropdown = true;

  List<DropdownMenuItem<String>> cities = [];
  final pakistan = {
    "1": "Lahore",
    "2": "Karachi",
    "3": "Peshawar",
    "4": "Islamabad",
    "5": "Quetta",
  };
  final india = {
    "1": "Mumbai",
    "2": "Chennai",
    "3": "Bengaluru",
    "4": "Kolkata",
  };
  final iran = {
    "1": "isfahan",
    "2": "Shiraz",
    "3": "Tehran",
  };
  final china = {
    "1": "Beijing",
    "2": "Shanghai",
    "3": "Wuhan",
  };

  void populatepakistan() {
    for (String key in pakistan.keys) {
      cities.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(pakistan[key]),
        ),
        value: pakistan[key],
      ));
    }
  }

  void populateindia() {
    for (String key in india.keys) {
      cities.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(india[key]),
        ),
        value: india[key],
      ));
    }
  }

  void populateiran() {
    for (String key in iran.keys) {
      cities.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(iran[key]),
        ),
        value: iran[key],
      ));
    }
  }

  void populatechina() {
    for (String key in china.keys) {
      cities.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(china[key]),
        ),
        value: china[key],
      ));
    }
  }

  void selectedItem(String value) {
    if (value == "Pakistan") {
      cities = [];
      populatepakistan();
    } else if (value == 'India') {
      cities = [];
      populateindia();
    } else if (value == 'Iran') {
      cities = [];
      populateiran();
    } else if (value == 'China') {
      cities = [];
      populatechina();
    }
    // setState(() {
    //   selected = value;
    // disabledropdown = false;
    // print('$value');
    // });
  }

  // void secondselected(String value) {
  //   setState(() {
  //     selected2 = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSaloonName(),
                _buildAddress(),
                DropdownButtonFormField<String>(
                  value: country,
                  items: [
                    DropdownMenuItem(
                      value: 'Pakistan',
                      child: Text('Pakistan'),
                    ),
                    DropdownMenuItem(
                      value: 'India',
                      child: Text('India'),
                    ),
                    DropdownMenuItem(
                      value: 'Iran',
                      child: Text('Iran'),
                    ),
                    DropdownMenuItem(
                      value: 'China',
                      child: Text('China'),
                    ),
                  ],
                  validator: (value) =>
                      value == null ? 'Country is Required' : null,
                  onChanged: (_value) async {
                    print(_value);
                    setState(() {
                      country = _value;
                      city = null;
                      disabledropdown = false;
                    });

                    // selected = _value;
                    selectedItem(_value);
                  },
                  hint: Text('Please Choose Your Country'),
                  // value: selected,
                ),
                SizedBox(
                  height: 15.0,
                ),
                DropdownButtonFormField<String>(
                  value: city,
                  hint: Text('Please Choose Your City'),
                  disabledHint: Text('Firstly Select Your Country'),
                  items: cities,
                  validator: (value) =>
                      value == null ? 'Country is Required' : null,
                  onChanged: disabledropdown
                      ? null
                      : (_value) {
                          // secondselected(_value);
                          setState(() {
                            city = _value;
                          });
                        },
                ),
                SizedBox(
                  height: 100,
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  buttonColor: Colors.grey[400],
                  child: RaisedButton(
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();

                      print(_saloonname.text);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //      // return Numberpicker();
                      //     },
                      //   ),
                      // );
                    },
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
