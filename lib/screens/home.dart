import 'package:facefood/classes/destination.dart';
import 'package:facefood/components/button_navigation.dart';
import 'package:facefood/layouts/destination.dart';
import 'package:facefood/screens/explore.dart';
import 'package:flutter/material.dart';

List<Destination> adminDestinations = <Destination>[
  Destination('Explore', Icons.person, ExploreScreen()),
  Destination('Profile', Icons.person, ExploreScreen()),
  Destination('Create Post', Icons.person, ExploreScreen()),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: adminDestinations.map<Widget>((Destination destination) {
            return DestinationLayout(destination: destination);
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
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
                      title: adminDestinations[0].title,
                      iconData: adminDestinations[0].iconData,
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
                      title: adminDestinations[1].title,
                      iconData: adminDestinations[1].iconData,
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
