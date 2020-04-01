import 'package:facefood/components/appbar/appbar_post_detail.dart';
import 'package:facefood/components/cards/card_description_string.dart';
import 'package:facefood/components/cards/card_future_user_brief_fullwidth.dart';
import 'package:facefood/components/future_like_button.dart';
import 'package:facefood/components/lists/list_of_steps.dart';
import 'package:facefood/components/lists/list_future_comments.dart';
import 'package:facefood/components/lists/list_future_ingredient.dart';
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
  Future<PostDetail> postDetail;
  void initState() {
    setState(() {
      postDetail = fetchPostDetail(widget.postId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    FocusNode _focusNode = FocusNode();
    return Scaffold(
        body: FutureBuilder<PostDetail>(
      future: postDetail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              AppbarPostDetail(
                username: snapshot.data.username,
                postId: widget.postId, // change to category
                commentCount: snapshot.data.commentCount,
                category: snapshot.data.categoryName,
                imageUrl: snapshot.data.imageUrl,
                likeCount: snapshot.data.likeCount,
                postname: snapshot.data.postName,
                timeNeeded: snapshot.data.timeNeeded,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          snapshot.data.likeCount.toString(),
                          style: textStyleHeading.copyWith(
                              fontWeight: FontWeight.normal),
                        ),
                        LikeFutureButton(
                          postId: snapshot.data.id,
                          notifyParent: () {
                            setState(() {
                              postDetail = fetchPostDetail(widget.postId);
                            });
                          },
                        ), //snapshot.postId
                        Text(
                          snapshot.data.commentCount.toString(),
                          style: textStyleHeading.copyWith(
                              fontWeight: FontWeight.normal),
                        ),
                        IconButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(_focusNode);
                            _scrollController.animateTo(
                              MediaQuery.of(context).size.height + 500,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 1000),
                            );
                          },
                          icon: Icon(Icons.comment),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
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
                    ListFutureComments(
                      postOwner: snapshot.data.username,
                      postID: widget.postId,
                      focusNode: _focusNode,
                      notifyParent: () {
                        setState(() {
                          postDetail = fetchPostDetail(widget.postId);
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
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
