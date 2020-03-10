import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardUserBriefFullwidth extends StatelessWidget {
  final String fullname, username, imgUrl;
  const CardUserBriefFullwidth({
    Key key,
    this.fullname = 'default',
    this.username = 'default',
    this.imgUrl = 'default',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.width / 6,
            child: CircleAvatar(
              child: Text('no pic'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                fullname,
                style: textStyleTitle,
              ),
              Text(
                '@$username',
                style: textStyleSubtitle,
              ),
            ],
          ),
          Divider(
            indent: 5,
            color: textStyleDefault.color,
          ),
        ],
      ),
    );
  }
}
