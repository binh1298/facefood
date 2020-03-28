import 'package:facefood/components/update_image_component.dart';
import 'package:facefood/screens/not_found_screen.dart';
import 'package:facefood/screens/user/other_user_profile.dart';
import 'package:facefood/screens/user/post_detail.dart';
import 'package:flutter/material.dart';
import '../classes/destination.dart';

class DestinationLayout extends StatefulWidget {
  final Destination destination;

  DestinationLayout({Key key, this.destination}) : super(key: key);

  @override
  _DestinationLayoutState createState() => _DestinationLayoutState();
}

class _DestinationLayoutState extends State<DestinationLayout> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
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
          case '/updateImage':
            body = UpdateImageComponent();
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
