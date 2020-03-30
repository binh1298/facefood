import 'package:facefood/models/comment.dart';
import 'package:facefood/style/style.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class CardComment extends StatelessWidget {
  final String content, username, avatarUrl, loginUser, postOwner;
  final int commentId;
  final Function fetchComments;
  final bool isReported;
  const CardComment({
    Key key,
    this.content,
    this.loginUser,
    this.commentId,
    this.username,
    this.avatarUrl,
    this.postOwner,
    this.fetchComments,
    this.isReported = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 8 + 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/viewUserDetails',
                      arguments: username);
                },
                child: Text(
                  username,
                  style: textStyleTitle,
                ),
              ),
              Spacer(),
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (BuildContext contextPopup) => <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Builder(
                      builder: (context) {
                        return InkWell(
                          child: Text('Report comment'),
                          onTap: () async {
                            
                            String reportCause = await showInfoDialog(context);
                            print(reportCause);
                            if (reportCause != null && reportCause.length > 0) {
                              reportComment(commentId, reportCause);
                              showInfoSnackBar(context, 'Report success');
                              fetchComments();
                            } 
                            // else {
                            //   showErrorSnackBar(context, 'Report fail');
                            // }
                          },
                        );
                      }
                    ),
                  ),
                  (loginUser == postOwner)
                      ? PopupMenuItem(
                          child: Builder(
                            builder: (context) {
                              return InkWell(
                                  child: Text('Remove comment'),
                                  onTap: () async {
                                    bool success = await removeComment(commentId);
                                    if (success) {
                                      showInfoSnackBar(context, 'Remove success');
                                      fetchComments();
                                    } else {
                                      showErrorSnackBar(context, 'Remove fail');
                                    }
                                  });
                            }
                          ))
                      : null,
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 8,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  '$content',
                  style: textStyleSubtitle,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
