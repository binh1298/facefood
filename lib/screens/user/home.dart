import 'package:facefood/classes/destination.dart';
import 'package:facefood/components/buttons/button_navigation.dart';
import 'package:facefood/layouts/destination.dart';
import 'package:facefood/screens/user/create_post.dart';
import 'package:facefood/screens/user/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:facefood/screens/guest/explore.dart';

List<Destination> userDestinations = <Destination>[
  Destination('Create Post', Icons.note_add, CreatePostScreen()),
  Destination('Profile', Icons.person, UserProfile()),
  Destination('Explore', Icons.explore, ExploreScreen()),
];

class UserHomeScreen extends StatefulWidget {
  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 2;
  AnimationController _hide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: userDestinations.map<Widget>((Destination destination) {
            return DestinationLayout(
              destination: destination,
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(userDestinations[2].iconData),
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ButtonNavigation(
                    title: userDestinations[0].title,
                    iconData: userDestinations[0].iconData,
                    isActive: _currentIndex == 0,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ButtonNavigation(
                    title: userDestinations[1].title,
                    iconData: userDestinations[1].iconData,
                    isActive: _currentIndex == 1,
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
