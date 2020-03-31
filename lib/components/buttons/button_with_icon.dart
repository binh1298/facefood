import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final Function onPressed;
  final Icon icon;
  final String label;
  final Color color;
  const ButtonWithIcon(
      {Key key,
      @required this.onPressed,
      this.icon,
      this.color = colorPrimary,
      @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: (icon!= null) ? RaisedButton.icon(
        color: color,
        onPressed: this.onPressed,
        icon: this.icon,
        label: Text(
          this.label,
          textAlign: TextAlign.center,
          style: textStyleDefault.copyWith(
              color: Colors.white),
        ),
      ) : RaisedButton(
        color: color,
        onPressed: this.onPressed,
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: textStyleDefault.copyWith(
              color: Colors.white),
        ),
      ),
    );
  }
}
