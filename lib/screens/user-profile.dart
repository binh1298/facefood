import 'package:facefood/components/button_full_width.dart';
import 'package:facefood/components/user_detail_info.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';


class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
      body:
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text('KR'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Reanu Keeves',
                        style: textStyleDefault,
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: <Widget>[
                            UserDetailInfo(
                              title: 'Followers',
                              number: 1,
                            ),
                            UserDetailInfo(
                              title: 'Likes',
                              number: 13,
                            ),
                            UserDetailInfo(
                              title: 'Following',
                              number: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ButtonFullWidth(
            label: 'Follow',
          ),
          Column(
            children: <Widget>[
              Text('sadfsadf'),
              Text('sadfsadf'),
              Text('sadfsadf'),
            ],
          ),
          
        ],
      ),
    ),
    );
  }
}