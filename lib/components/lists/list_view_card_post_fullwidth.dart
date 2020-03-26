import 'package:facefood/components/buttons/button_full_width.dart';
import 'package:facefood/components/cards/card_post_fullwidth.dart';
import 'package:facefood/components/cards/card_user_detail_info.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/user_profile_info.dart';
import 'package:flutter/material.dart';

class ListViewPost extends StatelessWidget {
  final List<Post> listPost;
  final UserProfileInfo userProfileInfoInfo;
  final bool isCurrentUser;
  const ListViewPost(
      {Key key,
      this.listPost,
      this.userProfileInfoInfo,
      this.isCurrentUser = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listPost.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            CardUserDetailInfo(
              avatarUrl: userProfileInfoInfo.avatarUrl,
              username: userProfileInfoInfo.username,
              followerCount: userProfileInfoInfo.followerCount,
              followingCount: userProfileInfoInfo.followingCount,
              postCount: userProfileInfoInfo.postCount,
            ),
            isCurrentUser
                ? SizedBox(
                    height: 0,
                  )
                : ButtonFullWidth(
                    label: 'Follow',
                    onPressed: () {},
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
            SizedBox(
              height: 30,
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
