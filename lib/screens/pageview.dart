import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saloon/models/discount_model.dart';
import 'package:saloon/models/slide_model.dart';
import 'package:saloon/screens/reservation_detail.dart';
import 'package:saloon/widgets/slideitem.dart';

class Pageview extends StatefulWidget {
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

  final List<String> numberList = [
    '1',
    '2',
    '3',
    '4',
  ];
  String selecteditem;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
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
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Panel'),
        backgroundColor: Colors.teal,
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
                          color: Colors.grey[400]
                        ),
                      ]
                    ),
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
                                child:
                                    Text('$item', textAlign: TextAlign.end),
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
                                : getFormattedDate(
                                    _dateTime.toIso8601String()),
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
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Center(child: Text('Discount & Time',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Container(
                height: 180.0,
                child: ListView.builder(
                  itemCount: disList.length,
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
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReservationDetail(
                                date: _dateTime,
                                noofperson: selecteditem,
                                discount: disList[index].discount,
                              ),
                            ),
                          );
                        }
                      },
                      child: DiscountCard(
                        dis: disList[index],
                      ),
                    );
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

class DiscountCard extends StatelessWidget {
  final DiscountModel dis;

  const DiscountCard({
    this.dis,
    Key key,
  }) : super(key: key);

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
            Text('Discount: ${dis.discount}%'),
            Text('Time'),
          ],
        ),
      ),
    );
  }
}
