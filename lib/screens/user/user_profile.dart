import 'package:facefood/components/button_full_width.dart';
import 'package:facefood/components/card_future_user_detail_info.dart';
import 'package:facefood/components/list_view_card_post_fullwidth.dart';
import 'package:facefood/models/post.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String username;

  const UserProfile({Key key, this.username}) : super(key: key);

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
            SizedBox(
              height: 10,
            ),
            CardFutureUserDetailInfo(username: widget.username),
            SizedBox(
              height: 20,
            ),
            ButtonFullWidth(
              label: 'Follow',
              onPressed: () {
                
              },
            ),
            SizedBox(
              height: 10,
            ),
            // FutureBuilder<List<Post>>(
            //   future: fetchPopularPostsList(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return ListViewPost(
            //         listPost: snapshot.data,
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text(snapshot.error.toString());
            //     } else {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
