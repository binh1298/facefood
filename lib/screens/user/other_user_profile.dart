import 'package:facefood/models/user_profile_info.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';
import 'package:facefood/components/lists/list_view_card_post_fullwidth.dart';
class OtherUserProfile extends StatefulWidget {
  final String username;

  const OtherUserProfile({Key key, this.username})
      : super(key: key);

  @override
  _OtherUserProfileState createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppBar,
        title: Text(
          'View Profile',
          style: textStyleHeading,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: FutureBuilder<UserProfileInfo>(
          future: fetchOtherUserProfile(widget.username),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  ListViewPost(
                    listPost: snapshot.data.totalPosts,
                    userProfileInfoInfo: snapshot.data,
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
      ),
    );
  }
}
