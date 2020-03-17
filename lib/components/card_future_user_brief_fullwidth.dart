import 'package:facefood/models/user_brief.dart';
import 'package:facefood/models/user_details.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardFutureUserBriefFullwidth extends StatelessWidget {
  final String username;
  const CardFutureUserBriefFullwidth({
    Key key,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserBrief>(
      future: fetchUserBrief(username),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.width / 6,
                  child: CircleAvatar(
                    backgroundImage: (snapshot.data.avatarUrl != null)
                        ? NetworkImage(snapshot.data.avatarUrl)
                        : AssetImage('images/user-default-image.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      snapshot.data.fullname,
                      style: textStyleTitle,
                    ),
                    Text(
                      '@${snapshot.data.username}',
                      style: textStyleSubtitle,
                    ),
                  ],
                ),
                Divider(
                  indent: 5,
                  color: textStyleDefault.color,
                ),
              ],
            ),
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
    );
  }
}
