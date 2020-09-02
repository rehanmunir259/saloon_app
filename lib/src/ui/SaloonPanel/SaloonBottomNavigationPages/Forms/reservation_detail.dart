import 'package:flutter/material.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomNavigationPages/Forms/thankyou.dart';
import 'package:saloon/src/ui/utils/localdata_reservation.dart';
import 'package:saloon/widgets/textfield.dart';

class ReservationDetail extends StatefulWidget {
  final String noofperson;
  final DateTime date;
  final DateTime time;
  final int discount;
  ReservationDetail({this.date, this.noofperson, this.time, this.discount});

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

  void storeReservation2() {
    LocalDataReservation.reservationModel.personName = nameController.text;
    LocalDataReservation.reservationModel.email = emailController.text;
    LocalDataReservation.reservationModel.contact =
        int.parse(phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation Details'),
        backgroundColor: Color(0xFF0d1137),
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
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Date: ${getFormattedDate(widget.date.toString())}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Time: ${widget.time.toString().substring(11, 16)}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Discount: ${widget.discount}%',
                  style: TextStyle(
                    fontSize: 17,
                  ),
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
                  height: 10.0,
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
                  height: 10.0,
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
                  height: 10.0,
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
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            'Cancel',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.red[500],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 50.0,
                        width: 150.0,
                        child: RaisedButton(
                          elevation: 5.0,
                          onPressed: () {
                            storeReservation2();
                            if (_formkey.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ThankyouPage(),
                                ),
                              );
                            } else {
                              setState(() {
                                autoValidate = true;
                              });
                            }
                          },
                          child: Text(
                            'Confirm',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Color(0xFF0d1137),
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
