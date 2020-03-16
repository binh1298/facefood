import 'package:flutter/material.dart';
import 'package:facefood/style/style.dart';

class TextFormFieldRectangleWithTitle extends StatelessWidget {
  final bool obscureText;
  final String hintText, titleText;
  final Function onSaved, validator;
  final int maxLine;
  final TextInputType inputType;
  TextFormFieldRectangleWithTitle(
      {this.hintText,
      this.obscureText = false,
      this.onSaved,
      this.validator,
      this.titleText,
      this.maxLine = 1, 
      this.inputType = TextInputType.text});

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
            keyboardType: inputType,
            maxLines: maxLine,
            obscureText: obscureText,
            style: textStyleDefault,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                ),
              ),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}