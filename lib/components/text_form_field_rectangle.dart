import 'package:flutter/material.dart';
import 'package:facefood/style/style.dart';

class TextFormFieldRectangle extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final Function onSaved, validator;
  final FocusNode focusNode;
  final TextEditingController controller;
  TextFormFieldRectangle(
      {this.hintText, this.obscureText = false, this.onSaved, this.validator,this.focusNode,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      focusNode: focusNode,
      style: textStyleDefault,
      controller: controller ,
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
    );
  }
}
