import 'package:flutter/material.dart';
import 'package:saloon/service/reservation_service.dart';
import 'package:saloon/src/models/reservations_model.dart';
import 'package:saloon/src/ui/AnimatedBottomBar/BottomBarNavigation.dart';
import 'package:saloon/src/ui/utils/localdata_reservation.dart';

class ThankyouPage extends StatefulWidget {
  final ReservationModel reservation;
  const ThankyouPage({this.reservation});
  @override
  _ThankyouPageState createState() => _ThankyouPageState();
}

class _ThankyouPageState extends State<ThankyouPage> {
  final _reservationService = ReservationService();
  Future<List<ReservationModel>> reservationPageFuture;

  @override
  void initState() {
    super.initState();
    reservationPageFuture = _reservationService.getReservations();
    //saloonPageFuture.then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thankyou for reservation with us',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Name: ${LocalDataReservation.reservationModel.personName}',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email: ${LocalDataReservation.reservationModel.email}',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Phone: ${LocalDataReservation.reservationModel.contact}',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10,
              ),
              // FutureBuilder(
              //   future: reservationPageFuture,
              //   builder: (context, snapshot) {
              //     if (snapshot.data == null) {
              //       return Container(
              //         child: Center(
              //           child: Text("Loading...."),
              //         ),
              //       );
              //     } else {
              //       return Text('Reservation Code: ${widget.reservation.code}',style: TextStyle(fontSize: 17.0),);
              //     }
              //   },
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                'No of Person: ${LocalDataReservation.reservationModel.noOfPerson}',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Date: ${LocalDataReservation.reservationModel.date}',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Time: ${LocalDataReservation.reservationModel.reservationTime}',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Discount: ${LocalDataReservation.reservationModel.discount}',
                style: TextStyle(fontSize: 17.0),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    elevation: 5,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomBarNavigation()),
                      );

                      ReservationService().createReservation(context: context);
                      LocalDataReservation.reservationModel =
                          new ReservationModel();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.teal[300],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
