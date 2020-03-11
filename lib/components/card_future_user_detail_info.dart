import 'package:facefood/components/box_single_detail_info.dart';
import 'package:facefood/models/user_related_infos.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class CardFutureUserDetailInfo extends StatelessWidget {
  final String userId;

  const CardFutureUserDetailInfo({
    Key key,
    this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserRelatedInfos>(
        future: fetchUserRelatedInfos(userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  // Avartar container
                  GestureDetector(
                    onTap: (){print('hihihi');},   // implement on tap
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
                              snapshot.data.username,
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
              ),
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
