import 'package:flutter/material.dart';
import 'package:saloon/service/reservation_service.dart';
import 'package:saloon/src/models/reservations_model.dart';

class SaloonResCard extends StatefulWidget {
  @override
  _SaloonResCardState createState() => _SaloonResCardState();
}

class _SaloonResCardState extends State<SaloonResCard> {
  final _reservationservice = ReservationService();
  Future<List<ReservationModel>> reservationPageFuture;

  @override
  void initState() {
    super.initState();
    reservationPageFuture = _reservationservice.getReservations();
    //saloonPageFuture.then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: reservationPageFuture,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text("Loading...."),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Reuseablecard(
               reservation: snapshot.data[index],
              );           
            },
            itemCount: snapshot.data.length,
          );
        }
      },
    );
  }
}

class Reuseablecard extends StatelessWidget {
  final ReservationModel reservation;
  const Reuseablecard({this.reservation});

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 70,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Code: ${reservation.code}'),
                    Text('Name: ${reservation.personName}'),
                    Text('Mob# ${reservation.contact}'),
                    Text('Email: ${reservation.email}'),
                  ],
                ),
                Spacer(),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(getFormattedDate(reservation.date.toString())),
                    Text('Time: ${reservation.reservationTime.toString().substring(11,16)}'),
                    Text('Dis: ${reservation.discount}%'),
                    Text('No of Person: ${reservation.noOfPerson}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
