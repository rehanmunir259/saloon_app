import 'package:flutter/material.dart';
import 'package:saloon/models/reservation_model.dart';

class SaloonReservation extends StatefulWidget {
  @override
  _SaloonReservationState createState() => _SaloonReservationState();
}

class _SaloonReservationState extends State<SaloonReservation> {
  Reservation selectedReservation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number of Reservations'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
