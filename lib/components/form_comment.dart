import 'package:facefood/components/text_form_field_rectangle.dart';
import 'package:flutter/material.dart';

class FormComment extends StatelessWidget {
  const FormComment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      children: <Widget>[
        SizedBox(width: 10,),
        Expanded(
          child: TextFormFieldRectangle(
            hintText: 'Comment',
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        ),
      ],
    ));
  }
}