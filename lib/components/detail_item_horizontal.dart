import 'package:flutter/material.dart';

import '../style/style.dart';

class DetailItemHoriziontal extends StatelessWidget {
  final String name;
  final String urlPic;
  final String urlPost;
  final int timeNeeded;
  final String category;
  final int likeCount;
  final int commentCount;
  const DetailItemHoriziontal(
      {this.name,
      this.urlPic,
      this.urlPost,
      this.timeNeeded,
      this.category,
      this.likeCount,
      this.commentCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
          onTap: () {
            print('haha');
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: FittedBox(
                  child: Image.network(
                      'https://i.picsum.photos/id/237/536/354.jpg'),
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
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style: textStyleTitlePrimary,
                    ),
                    Text(
                      likeCount.toString() +
                          ' likes ' +
                          commentCount.toString() +
                          ' comments',
                      textAlign: TextAlign.left,
                      style: textStyleDefaultDark,
                    ),
                    Text(
                      'Category: ' + category + ' | ' + timeNeeded.toString() + "'",
                      textAlign: TextAlign.left,
                      style: textStyleDefaultDark,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
