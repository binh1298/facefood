import 'package:flutter/material.dart';
import 'package:facefood/style/style.dart';

class TextFormFieldComponent extends StatelessWidget {
  final String title, hintText, labelText;
  final TextInputType textInputType;
  final Function onSaved, validator;
  final maxLines;

  TextFormFieldComponent(
      {this.hintText,
      this.title,
      this.maxLines,
      this.onSaved,
      this.labelText,
      this.validator,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: colorPrimary),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: hintText,
                  labelText: labelText,
                ),
                onSaved: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                maxLines: maxLines,
                style: textStyleSubtitle,
                keyboardType: textInputType,
              ),
            ),
          )
        ],
      ),
    );
  }
}
