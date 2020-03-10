import 'package:facefood/components/appbar_post_detail.dart';
import 'package:facefood/components/card_description_string.dart';
import 'package:facefood/components/card_user_brief_fullwidth.dart';
import 'package:facefood/components/future_list_ingredients.dart';
import 'package:facefood/components/future_list_of_step_card.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final int postID;
  const PostDetailScreen({Key key, this.postID})
      : super(key: key);
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Post>(
      future:
        fetchAPost(widget.postID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              AppbarPostDetail(
                category: snapshot.data.categoryId.toString(), // change to category
                commentCount: snapshot.data.commentCount,
                imageUrl: snapshot.data.imageUrl,
                likeCount: snapshot.data.likeCount,
                postname: snapshot.data.postName,
                timeNeeded: snapshot.data.timeNeeded,
              ),
              SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                CardUserBriefFullwidth(
                  // fullname: snapshot.data[1],
                  // imgUrl: snapshot.data[1],
                  // username: snapshot.data[1],
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
                FutureListIngredient(
                  postID: snapshot.data.postId,
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
                      FutureListOfStepCard(
                        postID: snapshot.data.postId,
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
          return Text(snapshot.error);
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
