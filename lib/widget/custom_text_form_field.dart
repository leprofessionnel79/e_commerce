import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  Function onSave;
  Function validator;


  CustomTextFormField({this.text, this.hint, this.onSave, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          CustomText(
            text: text,
            color: Colors.grey.shade900,
            fontSize: 13,
          ),
          TextFormField(
            obscureText: hint=='************'?true:false,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white),
          )
        ],
      ) ,
    );
  }
}
