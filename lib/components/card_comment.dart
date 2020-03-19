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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                username,
                style: textStyleTitle,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 8,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  '$content',
                  style: textStyleSubtitle,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
