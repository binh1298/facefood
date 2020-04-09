import 'package:facefood/components/box_single_detail_info.dart';
import 'package:facefood/models/user_profile_info.dart';
import 'package:facefood/style/style.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class CardUserDetailInfo extends StatelessWidget {
  final String username, avatarUrl;
  final int postCount, followerCount, followingCount;
  final Function refreshList;
  const CardUserDetailInfo(
      {Key key,
      this.username,
      this.avatarUrl,
      this.postCount,
      this.followerCount,
      this.followingCount,
      this.refreshList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('avt: $avatarUrl');
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          // Avartar container
          GestureDetector(
            onTap: () async {
              final imageUrl = await Navigator.pushNamed(
                context,
                '/updateImage',
              );
              print(imageUrl);
              if (imageUrl != null) {
                bool success = await putUserAvatar(username, imageUrl);
                if (!success) {
                  showErrorSnackBar(context, 'Update Avatar Failed');
                }
                refreshList();
              }
            }, // implement on tap
            child: Container(
              // NO PADDING HERE
              width: MediaQuery.of(context).size.width / 3.75,
              height: MediaQuery.of(context).size.width / 3.75,
              child: CircleAvatar(
                backgroundImage: (avatarUrl != null)
                    ? NetworkImage(avatarUrl)
                    : AssetImage('lib/assets/images/user-default-image.png'),
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
