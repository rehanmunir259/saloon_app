import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:saloon/service/discount_service.dart';
import 'package:saloon/src/models/discount_model.dart';

class Numberpicker extends StatefulWidget {

  final DiscountModel discount;
  const Numberpicker({this.discount});
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
  

  final _discountService = DiscountService();
  Future<List<DiscountModel>> discountPagefuture;

  @override
  void initState() {
    super.initState();
    discountPagefuture = _discountService.getDiscounts();
    //saloonPageFuture.then((value) => print(value));
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
                                    if (DateTime.parse(discount.time)
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
                                        discount: _discount,
                                        time: _dateTime.toString()));
                                    enabled = false;
                                  });
                                  Navigator.of(context).pop();
                                  //print(_discount);
                                  DiscountService().registerDiscount(
                                      dis: DiscountModel(
                                        discount: _discount,
                                        time: _dateTime.toString(),
                                      ),
                                      context: context);
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
            child: FutureBuilder(
              future: discountPagefuture,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading...."),
                    ),
                  );
                } else {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      var time = snapshot.data[index].time;
                      return Padding(
                        padding: const EdgeInsets.only(left: 12, top: 3),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Discount ${snapshot.data[index].discount.toString()}%",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                'Time: ${DateTime.parse(time).hour}:${DateTime.parse(time).minute}'),
                            IconButton(
                              icon:
                                  Icon(Icons.delete_forever, color: Colors.red),
                              onPressed: () {},
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                      indent: 20.0,
                      endIndent: 20.0,
                    ),
                    itemCount: snapshot.data.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
