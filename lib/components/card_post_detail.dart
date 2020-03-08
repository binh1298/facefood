import 'package:facefood/components/image_post_safe.dart';
import 'package:flutter/material.dart';

class CardPostDetails extends StatelessWidget {
  final String imgUrl, title, creatorName, timeNeeded, likeCount, commentCount;
  CardPostDetails({this.imgUrl, this.title, this.creatorName, this.timeNeeded, this.commentCount, this.likeCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ImagePostSafe(imgUrl: imgUrl,),
          Text(title),
          Text(creatorName),
          Text(timeNeeded),
          Text(likeCount),
          Text(commentCount),
        ],
      ),
    );
  }
}
