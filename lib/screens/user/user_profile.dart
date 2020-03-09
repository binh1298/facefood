import 'package:facefood/components/button_full_width.dart';
import 'package:facefood/components/detail_item_horizontal.dart';
import 'package:facefood/components/user_detail_info.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

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
              UserDetail(),
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
                      category: 'Korean food',
                      commentCount: 13,
                      likeCount: 49,
                      name: 'Korean beef stew',
                      timeNeeded: 90,
                      imageUrl: 'https://images.kitchenstories.io/wagtailOriginalImages/R1998-photo-final-1/R1998-photo-final-1-medium-landscape-150.jpg',
                      urlPost: '',
                    ),
                    DetailItemHoriziontal(
                      category: 'Banquet Meal',
                      commentCount: 4,
                      likeCount: 23,
                      name: 'Beef ragout & celery root',
                      timeNeeded: 30,
                      imageUrl: 'https://images.kitchenstories.io/recipeImages/R1100-photo-final/R1100-photo-final-medium-landscape-150.jpg',
                      urlPost: '',
                    ),
                    DetailItemHoriziontal(
                      category: 'Tradition Germany',
                      commentCount: 2,
                      likeCount: 13,
                      name: 'Roast pork & potatoes',
                      timeNeeded: 120,
                      imageUrl: 'https://images.kitchenstories.io/recipeImages/R872-photo-final-4x3/R872-photo-final-4x3-medium-landscape-150.jpg',
                      urlPost: '',
                    ),
                    DetailItemHoriziontal(
                      category: 'Roast',
                      commentCount: 2,
                      likeCount: 3,
                      name: 'Roast beef with cabbage',
                      timeNeeded: 333,
                      imageUrl: 'https://images.kitchenstories.io/recipeImages/R881-photo-final-4x3/R881-photo-final-4x3-medium-landscape-150.jpg',
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

class UserDetail extends StatelessWidget {
  const UserDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
