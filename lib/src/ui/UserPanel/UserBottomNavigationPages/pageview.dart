import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saloon/service/discount_service.dart';
import 'package:saloon/src/models/discount_model.dart';
import 'package:saloon/src/models/saloon_model.dart';
import 'package:saloon/src/models/slide_model.dart';
import 'package:saloon/src/ui/SaloonPanel/SaloonBottomNavigationPages/Forms/reservation_detail.dart';
import 'package:saloon/src/ui/utils/localdata_reservation.dart';
import 'package:saloon/widgets/slideitem.dart';

class Pageview extends StatefulWidget {
  final SaloonModel saloon;

// ignore: non_constant_identifier_names
  const Pageview({this.saloon});

  @override
  _PageviewState createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  DateTime _dateTime;
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
//  _parseDate(DateTime date) {
//    return formatDate(date, [d, '-' , MM, '-',yyyy, '|', HH, ':' nn, am]).toString();
//  }
  //formatDate(date, [d, '-', MM, '-', yyyy, '|', HH, ':', nn, am]).toString();

  final List<String> numberList = [
    '1',
    '2',
    '3',
    '4',
  ];
  String selecteditem;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final _saloonservice = DiscountService();
  Future<List<DiscountModel>> discountPageFuture;

  @override
  void initState() {
    super.initState();
    discountPageFuture = _saloonservice.getDiscounts();
    Timer.periodic(
      Duration(seconds: 4),
      (Timer timer) {
        if (_currentPage < slideList.length) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInCirc,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void storeReservation() {
    LocalDataReservation.reservationModel.noOfPerson = int.parse(selecteditem);
    LocalDataReservation.reservationModel.date = _dateTime.toString();
    LocalDataReservation.reservationModel.saloon = widget.saloon.sId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Panel'),
        backgroundColor: Color(0xFF0d1137),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250.0,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, i) => Slideitem(i),
                itemCount: slideList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 19.0, right: 10.0),
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black, width: 2.0),
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7,
                              spreadRadius: 3,
                              color: Colors.grey[400]),
                        ]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(
                          'No of Persons',
                          style: TextStyle(color: Colors.black),
                        ),
                        dropdownColor: Colors.grey[300],
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 30.0,
                        value: selecteditem,
                        items: numberList.map(
                          (String item) {
                            return DropdownMenuItem(
                              child: SizedBox(
                                child: Text('$item', textAlign: TextAlign.end),
                                width: 50,
                              ),
                              value: item,
                            );
                          },
                        ).toList(),
                        onChanged: (String i) =>
                            setState(() => selecteditem = i),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 160.0,
                    padding: EdgeInsets.only(
                        left: 20.0, right: 10, top: 11.5, bottom: 11.5),
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey[100],
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: _dateTime == null
                                  ? DateTime.now()
                                  : _dateTime,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000),
                            ).then((date) {
                              setState(() {
                                _dateTime = date;
                              });
                            });
                          },
                          child: Text(
                            _dateTime == null
                                ? 'Picked the Date'
                                : getFormattedDate(_dateTime.toIso8601String()),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                    child: Text(
                  'Discount & Time',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                height: 180.0,
                child: FutureBuilder(
                  future: discountPageFuture,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text("Loading...."),
                        ),
                      );
                    } else {
                      // return Container();
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (_dateTime == null || selecteditem == null) {
                                showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    content: Text(
                                        'Please select the Date or No of Person'),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                print(snapshot.data[index].time);
                                LocalDataReservation.reservationModel.discount =
                                    snapshot.data[index].discount;
                                LocalDataReservation
                                        .reservationModel.reservationTime =
                                    snapshot.data[index].time;
                                storeReservation();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReservationDetail(
                                      date:
                                          DateTime.parse(_dateTime.toString()),
                                      time: DateTime.parse(
                                          snapshot.data[index].time),
                                      noofperson: selecteditem,
                                      discount: snapshot.data[index].discount,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: DiscountCard(
                              snapshot.data[index],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DiscountCard extends StatelessWidget {
  final DiscountModel distime;
  // ignore: unused_element
//  _parseDate(DateTime date) {
//    return formatDate(date, [d, '-', MM, '-', yyyy, '|', HH, ':', nn, am])
//        .toString();
//  }

  DiscountCard(this.distime);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              spreadRadius: 3,
              color: Colors.grey[400],
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Time: ${DateTime.parse(distime.time).toString()}'),
            Text('Discount: ${distime.discount}%'),
          ],
        ),
      ),
    );
  }
}
