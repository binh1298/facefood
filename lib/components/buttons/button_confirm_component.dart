import 'package:flutter/material.dart';
import 'package:facefood/style/style.dart';

class ButtonConfirmComponent extends StatelessWidget {
  final Function onPressed;
  final String text;

  ButtonConfirmComponent({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colorConfirmButton,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyleDefault.copyWith(
              color: Colors.white),
        ),
      ),
    );
  }
}
