import 'package:facefood/classes/view_navigation_observer.dart';
import 'package:facefood/screens/not_found_screen.dart';
import 'package:facefood/screens/user/other_user_profile.dart';
import 'package:facefood/screens/user/post_detail.dart';
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
            body = widget.destination.component;
            break;
          case '/viewPostDetails':
            body = PostDetailScreen(postId: settings.arguments);
            break;
          case '/viewUserDetails':
            body = OtherUserProfile(username: settings.arguments);
            break;

          default:
            body = NotFoundScreen();
            break;
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return SafeArea(
              child: Scaffold(
                body: body,
              ),
            );
          },
        );
      },
    );
  }
}
