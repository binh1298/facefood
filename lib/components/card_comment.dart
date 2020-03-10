import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardComment extends StatelessWidget {
  final String content, username, imgUrl;
  const CardComment({
    Key key,
    this.content = 'default',
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
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.width / 8,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
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
                username,
                style: textStyleTitle,
              ),
              Text(
                '  $content',
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
