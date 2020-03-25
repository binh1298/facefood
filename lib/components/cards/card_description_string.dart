import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardDescriptionString extends StatelessWidget {
  final String description;
  const CardDescriptionString({
    Key key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        '"$description"',
        style: textStyleQuotation,
      ),
    );
  }
}
