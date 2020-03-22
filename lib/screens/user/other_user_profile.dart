import 'package:facefood/components/button_full_width.dart';
import 'package:facefood/components/card_user_detail_info.dart';
import 'package:facefood/components/list_view_card_post_fullwidth.dart';
import 'package:facefood/models/user_profile_info.dart';
import 'package:flutter/material.dart';

//TODO this is for viewing others profile

class UserProfile extends StatefulWidget {
  final String username;
  final bool isCurrentUser; 

  const UserProfile({Key key, this.username, this.isCurrentUser = false})
      : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<UserProfileInfo>(
          future: fetchOtherUserProfile(widget.username),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  CardUserDetailInfo(
                    avatarUrl: snapshot.data.avatarUrl,
                    username: snapshot.data.username,
                    followerCount: snapshot.data.followerCount,
                    followingCount: snapshot.data.followingCount,
                    postCount: snapshot.data.postCount,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonFullWidth(
                    label: 'Follow',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListViewPost(
                    listPost: snapshot.data.totalPosts,
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
        ),

        // child: FutureBuilder<UserDetails>(
        //   future: fetchUserProfile(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Center(
        //         child: Text(snapshot.data.username),
        //       );
        //     }
        //     else if (snapshot.hasError) {
        //       return Text(snapshot.error.toString());
        //     }
        //     else return LinearProgressIndicator();
        //   },
        // ),
      ),
    );
  }
}