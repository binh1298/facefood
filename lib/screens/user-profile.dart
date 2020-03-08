import 'package:facefood/components/button_full_width.dart';
import 'package:facefood/components/detail_item_horizontal.dart';
import 'package:facefood/components/user_detail_info.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text('KR'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 32,
                            child: Text(
                              'Reanu Keeves',
                              style: textStyleHeading,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: UserDetailInfo(
                                      title: 'Followers',
                                      number: 1,
                                    ),
                                  ),
                                  Expanded(
                                    child: UserDetailInfo(
                                      title: 'Likes',
                                      number: 13,
                                    ),
                                  ),
                                  Expanded(
                                    child: UserDetailInfo(
                                      title: 'Following',
                                      number: 15,
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
              SizedBox(
                height: 20,
              ),
              ButtonFullWidth(
                label: 'Follow',
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  children: <Widget>[
                    DetailItemHoriziontal(
                      category: 'cate',
                      comments: 2,
                      likes: 3,
                      name: 'name name name',
                      time: 333,
                      urlPic: 'https://i.picsum.photos/id/237/536/354.jpg',
                      urlPost: '',
                    ),
                    DetailItemHoriziontal(
                      category: 'cate',
                      comments: 2,
                      likes: 3,
                      name: 'name name name',
                      time: 333,
                      urlPic: 'https://i.picsum.photos/id/237/536/354.jpg',
                      urlPost: '',
                    ),
                    DetailItemHoriziontal(
                      category: 'cate',
                      comments: 2,
                      likes: 3,
                      name: 'name name name',
                      time: 333,
                      urlPic: 'https://i.picsum.photos/id/237/536/354.jpg',
                      urlPost: '',
                    ),
                    DetailItemHoriziontal(
                      category: 'cate',
                      comments: 2,
                      likes: 3,
                      name: 'name name name',
                      time: 333,
                      urlPic: 'https://i.picsum.photos/id/237/536/354.jpg',
                      urlPost: '',
                    ),
                    RaisedButton(
                      onPressed: () {},
                      textColor: colorTextPrimary,
                      color: colorPrimary,
                      child: Text('Load more'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
