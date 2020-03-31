import 'package:facefood/components/buttons/button_full_width.dart';
import 'package:facefood/models/follow.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class FutureFollowButton extends StatefulWidget {
  final String username;
  final String following;
  final Function notifyParent;
  const FutureFollowButton({
    Key key,
    this.username,
    this.notifyParent,
    this.following,
  }) : super(key: key);

  @override
  _FutureFollowButtonState createState() => _FutureFollowButtonState();
}

class _FutureFollowButtonState extends State<FutureFollowButton> {
  Future<bool> isFollowing;
  @override
  void initState() {
    super.initState();
    isFollowing = checkIfFollowingUser(widget.username, widget.following);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isFollowing,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ButtonFullWidth(
            label: snapshot.data ? 'UNFOLLOW' : 'FOLLOW',
            color: snapshot.data ? colorCancelButton : colorPrimary,
            onPressed: snapshot.data
                ? () async {
                    await changeFollowingStatus(
                        snapshot.data, widget.username, widget.following);
                    setState(() {
                      isFollowing = checkIfFollowingUser(
                          widget.username, widget.following);
                    });
                    widget.notifyParent(0);
                  }
                : () async {
                    await changeFollowingStatus(
                        snapshot.data, widget.username, widget.following);
                    setState(() {
                      isFollowing = checkIfFollowingUser(
                          widget.username, widget.following);
                    });
                    widget.notifyParent(1);
                  },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
