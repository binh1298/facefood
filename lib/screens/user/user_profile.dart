import 'package:facefood/models/user_profile_info.dart';
import 'package:facefood/components/lists/list_view_card_post_fullwidth.dart';
import 'package:facefood/style/style.dart';
import 'package:facefood/utils/authorization.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String username;

  const UserProfile({Key key, this.username}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<UserProfileInfo> _userProfileInfo;
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _userProfileInfo = fetchCurrentUserProfileInfo();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: true);
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _userProfileInfo = fetchCurrentUserProfileInfo();
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppBar,
        title: Text(
          'Profile',
          style: textStyleHeading,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        key: refreshKey,
        child: FutureBuilder<UserProfileInfo>(
          future: _userProfileInfo,
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
