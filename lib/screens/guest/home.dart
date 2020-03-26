import 'package:facefood/classes/destination.dart';
import 'package:facefood/components/buttons/button_navigation.dart';
import 'package:facefood/layouts/destination.dart';
import 'package:facefood/screens/guest/login.dart';
import 'package:facefood/screens/guest/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:facefood/screens/guest/explore.dart';

List<Destination> guestDestination = <Destination>[
  Destination('Login', Icons.person, LoginScreen()),
  Destination('Register', Icons.person_add, RegisterScreen()),
  Destination('Explore', Icons.explore, ExploreScreen()),
];

class GuestHomeScreen extends StatefulWidget {
  @override
  _GuestHomeScreenState createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen>{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: guestDestination.map<Widget>((Destination destination) {
            return DestinationLayout(
              destination: destination,
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.explore),
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
                      title: guestDestination[0].title,
                      iconData: guestDestination[0].iconData,
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
                      title: guestDestination[1].title,
                      iconData: guestDestination[1].iconData,
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
          )),
    );
  }
}
