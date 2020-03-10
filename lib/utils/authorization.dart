import 'package:flutter/material.dart';
import 'package:facefood/restart_app.dart';
import 'package:facefood/utils/secure_storage.dart';

logout(BuildContext context) {
  deleteAllFromSecureStorage().then(
    (onValue) => RestartWidget.restartApp(context),
  );
}
