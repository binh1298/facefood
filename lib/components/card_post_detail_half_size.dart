import 'package:facefood/components/icon_text.dart';
import 'package:facefood/components/text_safe.dart';
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
      {this.postId,
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
      height: MediaQuery.of(context).size.width / 1.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Card(
          elevation: 20,
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/viewPostDetails',
                    arguments: postId);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 3,
                    child: FittedBox(
                      child: Image.network(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name, overflow: TextOverflow.ellipsis, style: textStyleHeading.copyWith(fontSize: 20),),
                        Text(category, overflow: TextOverflow.ellipsis, style: textStyleDefault.copyWith(fontSize: 15),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(likeCount.toString(), style: textStyleDefault,),
                            Icon(Icons.favorite_border),
                            SizedBox(width: 4,),
                            Text(commentCount.toString(), style: textStyleDefault),
                            Icon(Icons.chat_bubble_outline),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
