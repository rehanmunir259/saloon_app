import 'package:flutter/material.dart';
import 'package:saloon/service/saloon_service.dart';

import 'package:saloon/src/models/saloon_model.dart';

class SaloonReservation extends StatefulWidget {
  final SaloonModel saloon;
  const SaloonReservation({this.saloon});
  @override
  _SaloonReservationState createState() => _SaloonReservationState();
}

class _SaloonReservationState extends State<SaloonReservation> {
  SaloonModel selectedSaloon;

  final _saloonService = SaloonService();
  Future<List<SaloonModel>> saloonPagefuture;

  @override
  void initState() {
    super.initState();
    saloonPagefuture = _saloonService.getSaloons();
    //saloonPageFuture.then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Number of Reservations',
        ),
        backgroundColor: Color(0xFF0d1137),
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
                    child: FutureBuilder(
                      future: saloonPagefuture,
                      builder: (context, snapshot) {
                        if(snapshot.data == null){
                          return Container(
                            child: Center(
                              child: Text('loading.....'),
                            ),
                          );
                        }else{
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<SaloonModel>(
                            value: selectedSaloon,
                            hint: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Saloon Name'),
                            ),
                            items: snapshot.data.map<DropdownMenuItem<SaloonModel>>((name) {
                              return DropdownMenuItem<SaloonModel>(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(name.name),
                                ),
                                  value: name,
                              );
                            }).toList(),
                            onChanged: (SaloonModel saloon) {
                              setState(() {
                                selectedSaloon = saloon;
                              });
                            },
                          ),
                        );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          selectedSaloon != null
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
