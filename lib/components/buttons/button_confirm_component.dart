import 'package:flutter/material.dart';
import 'package:facefood/style/style.dart';

class ButtonConfirmComponent extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  ButtonConfirmComponent({this.onPressed, this.text, this.color = colorPrimary});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
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
