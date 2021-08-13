import 'package:flutter/material.dart';
import '../constant.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(10),
        onPressed: onPressed,
        color: primarycolor,
        child: CustomText(
          alignment: Alignment.center,
          text: text,
          color: Colors.white,
          fontSize: 18,
        ));
  }
}
