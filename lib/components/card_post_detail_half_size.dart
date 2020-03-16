import 'package:facefood/components/icon_text.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class CardPostDetailsHalfSize extends StatelessWidget {
  final int postId;
  final String name;
  final String imageUrl;
  final String urlPost;
  final int timeNeeded;
  final String category;
  final int likeCount;
  final int commentCount;
  const CardPostDetailsHalfSize(
      {
        this.postId,
        this.name,
      this.imageUrl,
      this.urlPost,
      this.timeNeeded,
      this.category,
      this.likeCount,
      this.commentCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Card(
          elevation: 20,
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/viewPostDetails', arguments: postId);
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: Image.network(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          color: colorBackgroundDark.withOpacity(0.75),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconTextComponent(
                                icon: Icons.thumb_up,
                                text: likeCount.toString(),
                                style: textStyleDarkBackground,
                                iconColor: colorOnDarkBackground,
                              ),
                              IconTextComponent(
                                icon: Icons.chat_bubble_outline,
                                text: commentCount.toString(),
                                style: textStyleDarkBackground,
                                iconColor: colorOnDarkBackground,
                              ),
                              IconTextComponent(
                                icon: Icons.access_alarm,
                                text: timeNeeded.toString() + "'",
                                style: textStyleDarkBackground,
                                iconColor: colorOnDarkBackground,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
