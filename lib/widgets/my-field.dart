import 'package:flutter/material.dart';

class MyInputField extends TextFormField {
  MyInputField(
      {TextEditingController controller,
      String label,
      bool multiLine = false,
      Function validator,
      onSaved})
      : super(
          maxLines: multiLine ? null : 1,
          decoration:
              InputDecoration(labelText: label, border: OutlineInputBorder()),
          // ignore: missing_return
          validator: validator,
          onSaved: onSaved,
        );
}
