import 'package:facefood/components/appbar_post_detail.dart';
import 'package:facefood/components/card_description_string.dart';
import 'package:facefood/components/list_ingredients.dart';
import 'package:facefood/components/list_view_step_card.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/post_step.dart';
import 'package:facefood/models/user_related_infos.dart';
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
        fetchUserRelatedInfos(widget.userID),
        fetchListPostStep(widget.postID),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          {
            return 
             CustomScrollView(
              slivers: <Widget>[
                AppbarPostDetail(
                  category: '',
                  commentCount: 2,
                  imageUrl:
                      'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/11/2/0/DV1510H_fried-chicken-recipe-10_s4x3.jpg.rend.hgtvcom.826.620.suffix/1568222255998.jpeg',
                  likeCount: 2,
                  postname: 'namenma',
                  timeNeeded: 1212,
                ),
                SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                  //CardUserBriefFullwidth(),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  CardDescriptionString(
                    description: '!',
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
          }
        else if (snapshot.hasError) {
          return Text(snapshot.error);
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Text('Unable to fetch this post');
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    )
    );
  }
}
