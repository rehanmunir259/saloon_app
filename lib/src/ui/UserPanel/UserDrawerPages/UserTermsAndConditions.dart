import 'package:flutter/material.dart';

class UserTermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0d1137),
        title: Text('Terms&Conditions'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Terms & Conditions'),
      ),
    );
  }
}
