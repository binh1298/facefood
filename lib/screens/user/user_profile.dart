import 'package:facefood/components/button_full_width.dart';
import 'package:facefood/components/card_future_user_detail_info.dart';
import 'package:facefood/components/list_view_card_post_fullwidth.dart';
import 'package:facefood/models/post.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String userId;

  const UserProfile({Key key, this.userId}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CardFutureUserDetailInfo(userId: widget.userId),
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
    );
  }
}
