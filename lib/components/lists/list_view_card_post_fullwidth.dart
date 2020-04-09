import 'package:facefood/components/cards/card_post_fullwidth.dart';
import 'package:facefood/components/cards/card_user_detail_info.dart';
import 'package:facefood/components/future_follow_button.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/user_details.dart';
import 'package:facefood/models/user_profile_info.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter/material.dart';

class ListViewPost extends StatefulWidget {
  final List<Post> listPost;
  final UserProfileInfo userProfileInfoInfo;
  final Function refreshList;
  const ListViewPost({Key key, this.listPost, this.userProfileInfoInfo, this.refreshList})
      : super(key: key);

  @override
  _ListViewPostState createState() => _ListViewPostState();
}

class _ListViewPostState extends State<ListViewPost> {
  int followCount = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.listPost.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            CardUserDetailInfo(
              avatarUrl: widget.userProfileInfoInfo.avatarUrl,
              username: widget.userProfileInfoInfo.username,
              fullname: widget.userProfileInfoInfo.fullname,
              followerCount:
                  (widget.userProfileInfoInfo.followerCount + followCount),
              followingCount: widget.userProfileInfoInfo.followingCount,
              postCount: widget.userProfileInfoInfo.activePostsCount,
              refreshList: widget.refreshList,
            ),
            FutureBuilder<UserDetails>(
              future: getUserFromToken(),
              builder: (context, snapshotUserDetails) {
                if (snapshotUserDetails.hasData) {
                  return (snapshotUserDetails.data?.username !=
                          widget.userProfileInfoInfo.username)
                      ? FutureFollowButton(
                          notifyParent: (int number) {
                            setState(() {
                              followCount = number;
                            });
                          },
                          username: snapshotUserDetails.data.username,
                          following: widget.userProfileInfoInfo.username,
                        )
                      : SizedBox(
                          height: 0,
                        );
                } else {
                  return SizedBox(
                    height: 0,
                  );
                }
              },
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: widget.listPost
                  .map(
                    (post) => post.isDeleted ? SizedBox(height: 0,) : CardPostFullWidth(
                      refreshList: widget.refreshList,
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
