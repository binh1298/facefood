import 'package:facefood/components/icon_text.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class CardPostFullWidth extends StatelessWidget {
  final String postName;
  final String imageUrl;
  final int id;
  final int timeNeeded;
  final String categoryName;
  final int likeCount;
  final int commentCount;

  const CardPostFullWidth(
      {this.imageUrl,
      this.timeNeeded,
      this.likeCount,
      this.commentCount,
      this.postName,
      this.id,
      this.categoryName});

  @override
  Widget build(BuildContext context) {
    print(id);
    return Card(
      elevation: 10,
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/viewPostDetails', arguments: id);
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.7,
                child: FittedBox(
                  child: Image.network(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: colorBackgroundDark.withOpacity(0.75),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          postName,
                          textAlign: TextAlign.left,
                          style: textStyleTitleDarkBackground,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconTextComponent(
                          icon: Icons.access_alarm,
                          text: timeNeeded.toString() + '\'',
                          style: textStyleDarkBackground,
                          iconColor: colorOnDarkBackground,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconTextComponent(
                          icon: Icons.favorite,
                          text: likeCount.toString(),
                          style: textStyleDarkBackground,
                          iconColor: colorOnDarkBackground,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconTextComponent(
                          icon: Icons.chat_bubble_outline,
                          text: commentCount.toString(),
                          style: textStyleDarkBackground,
                          iconColor: colorOnDarkBackground,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
