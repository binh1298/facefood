import 'package:flutter/material.dart';
import 'package:facefood/style/style.dart';

class TextFormFieldRectangleWithTitle extends StatelessWidget {
  final bool obscureText;
  final String hintText, titleText;
  final Function onSaved, validator;
  final int maxLine;
  final TextInputType inputType;
  final String initialValue;
  TextFormFieldRectangleWithTitle(
      {this.hintText,
      this.obscureText = false,
      this.onSaved,
      this.validator,
      this.titleText,
      this.maxLine = 1,
      this.inputType = TextInputType.text,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          child: Text(
            titleText,
            style: textStyleDefaultPrimary,
          ),
        ),
        Expanded(
          child: TextFormField(
            initialValue: initialValue,
            keyboardType: inputType,
            maxLines: maxLine,
            obscureText: obscureText,
            style: textStyleDefault,
            decoration: inputDecorationTextFormField(hintText),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
