import 'package:flutter/material.dart';
import 'package:saloon/screens/thankyou.dart';
import 'package:saloon/widgets/textfield.dart';

class ReservationDetail extends StatefulWidget {
  final String noofperson;
  final DateTime date;
  final int discount;
  ReservationDetail({this.date, this.noofperson, this.discount});

  @override
  _ReservationDetailState createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetail> {
  String getFormattedDate(String date) {
    var d = DateTime.parse(date);
    return [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'June',
          'July',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ][d.month - 1] +
        " " +
        d.day.toString() +
        "," +
        d.year.toString();
  }

  bool autoValidate = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Details'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'No of Person: ${widget.noofperson}',
                  style: TextStyle(fontSize: 20,),
                ),
                SizedBox(height: 10),
                Text(
                  'Date: ${getFormattedDate(widget.date.toString())}',
                  style: TextStyle(fontSize: 20, ),
                ),
                SizedBox(height: 10),
                Text(
                  'Discount: ${widget.discount}%',
                  style: TextStyle(fontSize: 20,),
                ),
                SizedBox(height: 10),
                SaloonTextField(
                  controller: nameController,
                  validator: (value) {
                    return value.isEmpty ? "Please Enter Name" : null;
                  },
                  context: context,
                  icon: Icons.person,
                  label: 'Name',
                ),
                SizedBox(
                  height: 25.0,
                ),
                SaloonTextField(
                  controller: emailController,
                  validator: (value) {
                    return value.isEmpty ? "Please Enter Email" : null;
                  },
                  context: context,
                  icon: Icons.email,
                  label: 'Email',
                ),
                SizedBox(
                  height: 25.0,
                ),
                SaloonTextField(
                  controller: phoneController,
                  validator: (value) {
                    return value.isEmpty ? "Please Enter Phone" : null;
                  },
                  context: context,
                  icon: Icons.phone_android,
                  label: 'Phone',
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                        width: 150.0,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 20.0),
                          ),
                          shape: StadiumBorder(),
                          color: Colors.red[500],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 50.0,
                        width: 150.0,
                        child: FlatButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ThankyouPage(),),);
                            } else {
                              setState(() {
                                autoValidate = true;
                              });
                            }
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                fontSize: 20.0),
                          ),
                          shape: StadiumBorder(),
                          color: Colors.teal[400],
                        ),
                      ),
                    ],
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
