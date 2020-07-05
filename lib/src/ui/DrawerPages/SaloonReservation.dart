import 'package:flutter/material.dart';

import 'package:saloon/src/models/reservation_model.dart';

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
        title: Text(
          'Number of Reservations',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Please choose the Saloon'),
                  Material(
                    elevation: 20,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Reservation>(
                        value: selectedReservation,
                        hint: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Saloon Name'),
                        ),
                        items: nameList.map((name) {
                          return DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(name.saloonName),
                            ),
                            value: name,
                          );
                        }).toList(),
                        onChanged: (Reservation reservation) {
                          setState(() {
                            selectedReservation = reservation;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          selectedReservation != null
              ? Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        width: 500,
                        child: Card(
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'This month',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen.shade600,
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 500,
                        child: Card(
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'Over all',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
