import 'package:facefood/models/like.dart';
import 'package:facefood/models/post_detail.dart';
import 'package:facefood/models/user_details.dart';
import 'package:facefood/style/style.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/material.dart';

import 'like_post_button.dart';

class LikeFutureButton extends StatefulWidget {
  final int postId;
  final Function notifyParent;
  LikeFutureButton({Key key, this.postId = 1,this.notifyParent}) : super(key: key);

  @override
  _LikeFutureButtonState createState() => _LikeFutureButtonState();
}

class _LikeFutureButtonState extends State<LikeFutureButton> {
  bool isLiked;
  LikePost likeCom = LikePost();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetails>(
        future: getUserFromToken(),
        builder: (context, snapshot1) {
          if (snapshot1.hasData) {
            return FutureBuilder<bool>(
                future: likeCom.checkIfLikePost(widget.postId),
                builder: (context, snapshot2) {
                  if (snapshot2.hasData) {
                    isLiked = snapshot2.data;
                    return LikePostButton(
                      color: isLiked ? colorLove : colorInactive,
                      onPressed: () async {
                        likeCom.postId = widget.postId;
                        bool success =
                            await likeCom.changeLikeStatus(context, isLiked);
                        print('success: $success');
                        if (success) {
                          setState(() {
                            isLiked = isLiked ? false : true;
                          });
                          widget.notifyParent();
                        } else {
                          showErrorSnackBar(context, 'cannot perform action');
                        }
                      },
                    );
                  } else {
                    // chua co data
                    return  CircularProgressIndicator();
                  }
                });
          } else {
            // chua login
            return LikePostButton(
              color: colorInactive,
              onPressed: () {
                showInfoSnackBar(context, 'Please login first !!');
              },
            );
          }
        });
  }
}
