import 'package:facefood/components/box_single_detail_info.dart';
import 'package:facefood/models/user_details.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardUserDetailInfo extends StatelessWidget {
  final String userId;

  const CardUserDetailInfo({
    Key key,
    this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUserDetails(userId),
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Row(
          children: <Widget>[
            // Avartar container
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 3,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.width / 7,
                ),
              ),
            ),
            // Name & info boxes container
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 32,
                      child: Text(
                        snapshot.data.fullname,
                        style: textStyleHeading,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: BoxSingleDetailInfo(
                                title: 'Followers',
                                number: snapshot.data.totalFollowers,
                              ),
                            ),
                            Expanded(
                              child: BoxSingleDetailInfo(
                                title: 'Likes',
                                number: snapshot.data.likeCount,
                              ),
                            ),
                            Expanded(
                              child: BoxSingleDetailInfo(
                                title: 'Following',
                                number: snapshot.data.totalFollowings,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      } else if (snapshot.hasError) {
        return Text(snapshot.error.toString());
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
