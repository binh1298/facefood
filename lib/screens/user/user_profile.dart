import 'package:facefood/components/button_full_width.dart';
import 'package:facefood/components/card_post_fullwidth.dart';
import 'package:facefood/components/user_detail_info.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              ButtonFullWidth(
                label: 'Follow',
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<List<Post>>(
                future: fetchPostListFromAUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListViewPost(
                      listPost: snapshot.data,
                    );
                  } else if (snapshot.error) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class UserDetail extends StatelessWidget {
  final String username;
  final String totalFollowersCount;
  final String totalFollowingCount;

  const UserDetail({
    Key key,
    this.username,
    this.totalFollowersCount,
    this.totalFollowingCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text('KR'),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              children: <Widget>[
                Container(
                  height: 32,
                  child: Text(
                    'Reanu Keeves',
                    style: textStyleHeading,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: UserDetailInfo(
                            title: 'Followers',
                            number: 1,
                          ),
                        ),
                        Expanded(
                          child: UserDetailInfo(
                            title: 'Likes',
                            number: 13,
                          ),
                        ),
                        Expanded(
                          child: UserDetailInfo(
                            title: 'Following',
                            number: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
