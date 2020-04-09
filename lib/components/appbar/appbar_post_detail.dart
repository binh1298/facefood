import 'package:facefood/components/appbar/appbar_post_detail_content.dart';
import 'package:facefood/models/post.dart';
import 'package:facefood/models/user_details.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class AppbarPostDetail extends StatelessWidget {
  final String postname, imageUrl, category, username;
  final int timeNeeded, likeCount, commentCount, postId;
  const AppbarPostDetail({
    Key key,
    this.postId,
    this.username,
    this.postname,
    this.imageUrl,
    this.timeNeeded,
    this.likeCount,
    this.commentCount,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      actions: <Widget>[
        FutureBuilder<UserDetails>(
          future: getUserFromToken(),
          builder: (context, snapshotUser) {
            if (username == snapshotUser.data?.username) {
              return IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  bool confirm =
                      await showConfirmDialog(context, 'delete this post');
                  if (confirm != null && confirm) {
                    bool success = await putRemovePost(postId);
                    if (success) Navigator.pop(context, true);
                  }
                },
              );
            } else
              return SizedBox(
                height: 0,
              );
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(65), // set min height
        child: Text(''),
      ),
      backgroundColor: Colors.grey,
      expandedHeight: 400,
      flexibleSpace: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 650,
              child: FittedBox(
                child: Image.network(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            AppbarPostDetailContent(
              postId: postId,
              category: category,
              commentCount: commentCount,
              likeCount: likeCount,
              postname: postname,
              timeNeeded: timeNeeded,
            ),
          ],
        ),
      ),
    );
  }
}
