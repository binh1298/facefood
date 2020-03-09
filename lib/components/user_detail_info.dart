import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
>>>>>>> c01f801d66ddcbedc7a125489a8acb720611381a
import '../style/style.dart';

class UserDetailInfo extends StatelessWidget {
  final int number;
  final String title;

  UserDetailInfo({this.number, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          number.toString(),
          style: textStyleDefault,
        ),
        Text(
          title,
          style: textStyleDefaultPrimary,
        )
      ],
    );
  }
}
