import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:saloon/src/models/discount_model.dart';

class Numberpicker extends StatefulWidget {
  @override
  _NumberpickerState createState() => _NumberpickerState();
}

class _NumberpickerState extends State<Numberpicker> {
  List<DiscountModel> discounts = [];
  DateTime _dateTime = DateTime.now();
  int _discount = 15;
  bool enabled = true;

  List<String> months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    super.initState();
  }

  void storeData3(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discount',
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  child: AlertDialog(
                    content: SizedBox(
                      height: 250,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 150.0,
                                    child: CupertinoDatePicker(
                                      use24hFormat: true,
                                      mode: CupertinoDatePickerMode.time,
                                      initialDateTime: _dateTime,
                                      onDateTimeChanged: (datetime) {
                                        print(datetime);
                                        setState(() {
                                          _dateTime = datetime;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 150.0,
                                  child: NumberPicker.integer(
                                    initialValue: _discount,
                                    minValue: 0,
                                    maxValue: 100,
                                    onChanged: (value) {
                                      setState(() {
                                        _discount = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 50.0,
                            
                            child: RaisedButton(
                              elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                                color: Color(0xFF0d1137),
                                onPressed: () async {
                                  for (final discount in discounts) {
                                    if (discount.time
                                            .difference(_dateTime)
                                            .inMinutes ==
                                        0) {
                                      await showDialog(
                                          context: context,
                                          child: AlertDialog(
                                            content: Text('Time Already Added'),
                                            actions: <Widget>[
                                              FlatButton(
                                                  child: Text('Ok'),
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop())
                                            ],
                                          ));

                                      Navigator.of(context).pop();
                                      return;
                                    }
                                  }

                                  setState(() {
                                    discounts.add(DiscountModel(
                                        discount: _discount, time: _dateTime));
                                    enabled = false;
                                  });
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
        backgroundColor: Color(0xFF0d1137),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                var time = discounts[index].time;

                return ListTile(
                  title: Text(
                    "Discount ${discounts[index].discount.toString()}%",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Time: ${time.hour} : ${time.minute}'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Date: ${time.day}${months[time.month - 1]}${time.year}')
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
                indent: 20.0,
                endIndent: 20.0,
              ),
              itemCount: discounts.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 50,
              width: 150,
              child: RaisedButton(
                onPressed: () {},
                color: Color(0xFF0d1137),
                elevation: 5,
                child: Text(
                  'Comfirm',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
