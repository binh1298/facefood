import 'package:facefood/classes/view_navigation_observer.dart';
import 'package:facefood/screens/guest/explore.dart';
import 'package:facefood/screens/user/other_user_profile.dart';
import 'package:facefood/screens/user/post_detail.dart';
import 'package:facefood/style/style.dart';
import 'package:facefood/utils/authorization.dart';
import 'package:flutter/material.dart';
import '../classes/destination.dart';

class DestinationLayout extends StatefulWidget {
  final Destination destination;
  final VoidCallback onNavigation;

  DestinationLayout({Key key, this.destination, this.onNavigation})
      : super(key: key);

  @override
  _DestinationLayoutState createState() => _DestinationLayoutState();
}

class _DestinationLayoutState extends State<DestinationLayout> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        Widget body;
        switch (settings.name) {
          case '/':
            title = widget.destination.title;
            body = widget.destination.component;
            break;
          case '/viewPostDetails':
            title = 'View Post Details';
            body = PostDetailScreen(postId: settings.arguments);
            break;
          case '/viewUserDetails':
            title = 'View User Details';
            body = OtherUserProfile(username: settings.arguments);
            break;

          default:
            body = ExploreScreen();
            break;
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return SafeArea(
              child: Scaffold(
                appBar: (title == 'View Post Details' || title == 'Explore')
                    ? null
                    : AppBar(
                        backgroundColor: colorAppBar,
                        title: Text(
                          title,
                          style: textStyleHeading,
                        ),
                        iconTheme: IconThemeData(color: Colors.black),
                        elevation: 0,
                        actions: widget.destination.title == 'Profile'
                            ? <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    logout(context);
                                  },
                                ),
                              ]
                            : null,
                      ),
                body: body,
              ),
            );
          },
        );
      },
    );
  }
}
