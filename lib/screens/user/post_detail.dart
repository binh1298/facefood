import 'package:facefood/components/appbar_post_detail.dart';
import 'package:facefood/components/card_description_string.dart';
import 'package:facefood/components/card_future_user_brief_fullwidth.dart';
import 'package:facefood/components/list_future_ingredient.dart';
import 'package:facefood/components/list_of_steps.dart';
import 'package:facefood/models/post_detail.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final int postId;
  const PostDetailScreen({Key key, this.postId = 1}) : super(key: key);
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<PostDetail>(
      future: fetchPostDetail(widget.postId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              AppbarPostDetail(
                postId: widget.postId, // change to category
                commentCount: snapshot.data.commentCount,
                category: snapshot.data.categoryName,
                imageUrl: snapshot.data.imageUrl,
                likeCount: snapshot.data.likeCount,
                postname: snapshot.data.postName,
                timeNeeded: snapshot.data.timeNeeded,
              ),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                CardFutureUserBriefFullwidth(
                  username: snapshot.data.username,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                CardDescriptionString(
                  description: snapshot.data.description,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                ListFutureIngredient(
                  postID: snapshot.data.id,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Step by step',
                          style: textStyleHeadingPrimary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListOfSteps(
                        listSteps: snapshot.data.steps,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
              ]))
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Text('Unable to fetch this post');
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    ));
  }
}
