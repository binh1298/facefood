import 'package:facefood/components/card_post_fullwidth.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ListViewPost extends StatelessWidget {
  final List<Post> listPost;

  const ListViewPost({
    Key key,
    this.listPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        children: <Widget>[
          Column(
            children: listPost
                .map(
                  (post) => CardPostFullWidth(
                    categoryId: post.categoryId,
                    commentCount: post.commentCount,
                    imageUrl: post.imageUrl,
                    likeCount: post.likeCount,
                    postId: post.postId,
                    postName: post.postName,
                    timeNeeded: post.timeNeeded,
                  ),
                )
                .toList(),
          ),
          RaisedButton(
            onPressed: () {},
            textColor: colorTextPrimary,
            color: colorPrimary,
            child: Text('Load more'),
          ),
        ],
      ),
    );
  }
}
