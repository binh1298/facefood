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
                onTap: () {}, // TODO add routing here
                child: Text(
                  username,
                  style: textStyleTitle,
                ),
              ),
              Spacer(),
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                      child: InkWell(
                    child: isReported?Text('Unreport user'):Text('Report user'),
                    onTap: () async {
                      bool success = await reportComment(commentId);
                      if (success) {
                        showInfoSnackBar(context, isReported?'Unreport success':'Report success');
                        fetchComments();
                      } else {
                        showErrorSnackBar(context, isReported?'Unreport fail':'Report fail');
                      }
                    },
                  )),
                  PopupMenuItem(
                      child: InkWell(
                    child: Text('Remove comment'),
                    onTap: loginUser == postOwner
                        ? () async {
                            bool success = await removeComment(commentId);
                            if (success) {
                              showInfoSnackBar(context,'Remove success');
                              fetchComments();
                            } else {
                              showErrorSnackBar(context,'Remove fail');
                            }
                          }
                        : () {
                            showErrorSnackBar(context, 'Can\'t remove comment');
                          }, //TODO Binh giup vs
                  )),
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
