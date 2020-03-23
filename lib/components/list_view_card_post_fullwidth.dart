import 'package:facefood/components/card_post_fullwidth.dart';
import 'package:facefood/components/card_user_detail_info.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/user_profile_info.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ListViewPost extends StatelessWidget {
  final List<Post> listPost;
  final UserProfileInfo userProfileInfoInfo;

  const ListViewPost({
    Key key,
    this.listPost,
    this.userProfileInfoInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listPost.isNotEmpty) {
      return Flexible(
        child: ListView(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          children: <Widget>[
            CardUserDetailInfo(
              avatarUrl: userProfileInfoInfo.avatarUrl,
              username: userProfileInfoInfo.username,
              followerCount: userProfileInfoInfo.followerCount,
              followingCount: userProfileInfoInfo.followingCount,
              postCount: userProfileInfoInfo.postCount,
            ),
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
            RaisedButton(
              onPressed: () {},
              textColor: colorTextPrimary,
              color: colorPrimary,
              child: Text('Load more'),
            ),
          ],
        ),
      );
    } else
      return Center(
        child: Text('this user haven\'t post anything yet'),
      );
  }
}
