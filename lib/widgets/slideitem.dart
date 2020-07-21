import 'package:flutter/material.dart';
import 'package:saloon/src/models/slide_model.dart';

class Slideitem extends StatelessWidget {
  final int index;
  Slideitem(this.index);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Image.network(slideList[index].imagerUrl,fit: BoxFit.fitWidth,),
          ),
        ],
      ),
    );
  }
}
