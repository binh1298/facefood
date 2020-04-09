import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

showErrorSnackBar(BuildContext context, String message) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          '$message',
          // style: textStyleErrorMessage,
        ),
      ),
    );
}

showInfoSnackBar(BuildContext context, String message) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          '$message',
          // style: textStyleErrorMessage,
        ),
      ),
    );
}

showConfirmDialog(BuildContext context, String actionName) {
   return showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text("Confirm request"),
        content: Text('Are you sure you want to $actionName?'),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: Text("Accept"),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
Future<String> showTextDialog(BuildContext context, String title, String textHint) {
  // flutter defined function
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      String reportCause;

      // return object of type Dialog
      return AlertDialog(
        title: Text(title),
        content: TextField(
          decoration: inputDecorationTextFormField(textHint),
          onChanged: (value) {
            reportCause = value;
          },
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
          FlatButton(
            child: Text("Submit"),
            onPressed: () {
              Navigator.of(context).pop(reportCause);
            },
          ),
        ],
      );
    },
  );
}

