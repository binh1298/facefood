import 'package:flutter/material.dart';
import 'package:facefood/style/style.dart';

class ButtonFullWidth extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color color;
  ButtonFullWidth({this.label,this.onPressed, this.color = colorPrimary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: 40,
      child: RaisedButton(
        color: color,
        onPressed:onPressed,
        child: Text(label,
        style: textStyleButtonPrimary.copyWith(color: Colors.white),),
      ),
    );
  }
}
