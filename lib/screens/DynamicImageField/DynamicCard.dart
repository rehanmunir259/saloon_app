import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DynamicDataClass.dart';
import 'DynamicPage.dart';

typedef OnDelete();

class DynamicCard extends StatefulWidget {

  final ImageData imageObj;
  final state = _DynamicCardState();
  final OnDelete onDelete;
  DynamicCard({Key key ,this.imageObj , this.onDelete}): super(key : key);

  @override
  _DynamicCardState createState() => state;

  bool isValid() => state.validate();

}

class _DynamicCardState extends State<DynamicCard> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.image),
                title: Text('Image URL'),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.imageObj.ImageURL,
                  onSaved: (val) => widget.imageObj.ImageURL = val,
                  validator: (val) => val.length > 3 ? null : 'Field cannot be empty',
                  decoration: InputDecoration(
                    labelText: 'URL',
                    hintText: 'www.example.com'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate(){
    var valid = formkey.currentState.validate();
    if(valid) formkey.currentState.save();
    return valid;
  }

}
