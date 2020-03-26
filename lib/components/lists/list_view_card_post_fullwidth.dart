import 'package:facefood/components/cards/card_post_fullwidth.dart';
import 'package:facefood/components/cards/card_user_detail_info.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/user_profile_info.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ListViewPost extends StatelessWidget {
  final List<Post> listPost;
  final UserProfileInfo userProfileInfoInfo;
  final bool isCurrentUser;
  const ListViewPost({
    Key key,
    this.listPost,
    this.userProfileInfoInfo,
    this.isCurrentUser = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listPost.isNotEmpty) {
      return Flexible(
        child: ListView(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          children: <Widget>[
            isCurrentUser ? CardUserDetailInfo(
              avatarUrl: userProfileInfoInfo.avatarUrl,
              username: userProfileInfoInfo.username,
              followerCount: userProfileInfoInfo.followerCount,
              followingCount: userProfileInfoInfo.followingCount,
              postCount: userProfileInfoInfo.postCount,
            ) : SizedBox(height: 0,),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: listPost
                  .map(
                    (post) => CardPostFullWidth(
                      categoryName: post.categoryName,
                      commentCount: post.commentCount,
                      imageUrl: post.imageUrl,
                      likeCount: post.likeCount,
                      id: post.id,
                      postName: post.postName,
                      timeNeeded: post.timeNeeded,
                    ),
                  )
                  .toList(),
            ),
            // RaisedButton(
            //   onPressed: () {},
            //   textColor: colorTextPrimary,
            //   color: colorPrimary,
            //   child: Text('Load more'),
            // ),
            SizedBox(height: 30,),
          ],
        ),
      );
    } else
      return Center(
        child: Text('this user haven\'t post anything yet'),
      );
  }
}
