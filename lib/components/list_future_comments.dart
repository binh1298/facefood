import 'package:facefood/components/card_comment.dart';
import 'package:facefood/components/text_form_field_rectangle.dart';
import 'package:facefood/models/comment.dart';
import 'package:facefood/style/style.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:facefood/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class ListFutureComments extends StatefulWidget {
  final int postID;
  final FocusNode focusNode;
  ListFutureComments({
    Key key,
    this.focusNode,
    this.postID = 1,
  }) : super(key: key);

  @override
  _ListFutureCommentsState createState() => _ListFutureCommentsState();
}

class _ListFutureCommentsState extends State<ListFutureComments> {
  final _comment = Comment();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = new TextEditingController();
  Future<List<Comment>> comments;
  @override
  void initState() {
    setState(() {
      comments = fetchComment(widget.postID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Comments',
            style: textStyleHeadingPrimary,
          ),
        ),
        Builder(
          builder: (context) => Form(
              key: _formKey,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormFieldRectangle(
                      hintText: 'write some comments here ...',
                      controller: _controller,
                      focusNode: widget.focusNode,
                      onSaved: (value) => {
                        setState(() {
                          _comment.content = value;
                        })
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Enter some Comments';
                        } else
                          return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () async {
                      var loginUser = await getUserFromToken();
                      if (loginUser == null) {
                        showErrorSnackBar(context, 'Please login first !!');
                      } else {
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          setState(() {
                            _comment.postID = widget.postID;
                          });
                          bool success = await _comment.sendComment(
                              context, loginUser.userId);
                          if (success) {
                            _controller.clear();
                            setState(() {
                              comments=fetchComment(widget.postID);
                            });
                          }
                        }
                      }
                    },
                  ),
                ],
              )),
        ),
        FutureBuilder<List<Comment>>(
          future: comments,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isNotEmpty)
                return Column(
                    children: snapshot.data
                        .map<Widget>((comment) => CardComment(
                              avatarUrl: comment.avatarUrl,
                              content: comment.content,
                              username: comment.username,
                            ))
                        .toList());
              else
                return Center(child: Text('no comment yet.'));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text('Unable to fetch this post\'s comment');
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ],
    );
  }
}
