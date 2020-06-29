import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaloonTextField extends TextFormField {
  SaloonTextField(
      {IconData icon,
      String label,
      TextInputType keyboardType,
      BuildContext context,
      TextEditingController controller,
      Function(String) validator})
      : super(
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context).nextFocus();
            },
            style: TextStyle(
              color: Colors.black,
            ),
            scrollPadding: EdgeInsets.all(80),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.black,
              ),
              hintText: 'Enter your $label',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'OpenSans',
              ),
            ),
            validator: validator,
            controller: controller,
        );
}
