import 'package:flutter/material.dart';

class ConfirmDetails extends StatefulWidget {
  @override
  _ConfirmDetailsState createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Details'),
        backgroundColor: Color(0xFF0d1137),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
              'Name of Saloon',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
