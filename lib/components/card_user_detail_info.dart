import 'package:facefood/components/box_single_detail_info.dart';
import 'package:facefood/models/user_brief.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardUserDetailInfo extends StatelessWidget {
  final String username;
  final int postCount, followerCount, followingCount;

  const CardUserDetailInfo({
    Key key,
    this.username,
    this.postCount,
    this.followerCount,
    this.followingCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          // Avartar container
          GestureDetector(
            onTap: () {
              print('hihihi');
            }, // implement on tap
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width / 3.75,
              height: MediaQuery.of(context).size.width / 3.75,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.width / 7,
                ),
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
                      username,
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
                              title: 'Posts',
                              number: postCount,
                            ),
                          ),
                          Expanded(
                            child: BoxSingleDetailInfo(
                              title: 'Follower',
                              number: followerCount,
                            ),
                          ),
                          Expanded(
                            child: BoxSingleDetailInfo(
                              title: 'Following',
                              number: followingCount,
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
      ),
    );
  }
}
