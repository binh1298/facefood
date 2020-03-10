import 'package:facefood/components/appbar_post_detail.dart';
import 'package:facefood/components/card_description_string.dart';
import 'package:facefood/components/card_user_brief_fullwidth.dart';
import 'package:facefood/components/list_ingredients.dart';
import 'package:facefood/components/list_view_step_card.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/post_step.dart';
import 'package:facefood/models/user_details.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final String postID;
  final String userID;
  const PostDetailScreen({Key key, this.postID = '', this.userID = ''})
      : super(key: key);
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: Future.wait([
        fetchAPost(widget.postID),
        fetchUserProfile(),
        fetchListPostStep(widget.postID),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              AppbarPostDetail(
                category: snapshot.data[0].categoryId.toString(),
                commentCount: snapshot.data[0].commentCount,
                imageUrl: snapshot.data[0].imageUrl,
                likeCount: snapshot.data[0].likeCount,
                postname: snapshot.data[0].postName,
                timeNeeded: snapshot.data[0].timeNeeded,
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
                  description: snapshot.data[0].description,
                ),
                Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                IngredientTable(
                  postID: widget.postID,
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
                      ListCardViewStep(
                        steps: snapshot.data[2],
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
