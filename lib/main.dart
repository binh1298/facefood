import 'package:facefood/models/user_details.dart';
import 'package:facefood/restart_app.dart';
import 'package:facefood/screens/explore.dart';
import 'package:facefood/screens/guest/home.dart';
import 'package:facefood/screens/home.dart';
import 'package:facefood/screens/login.dart';
import 'package:facefood/screens/register.dart';
import 'package:facefood/screens/user-profile.dart';
import 'package:facefood/screens/user/home.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/explore.dart';
import 'screens/home.dart';

void main() async {
  await DotEnv().load('.env');
  UserDetails user = await getUserFromToken();
  if (user != null)
    runApp(RestartWidget(
          child: MyApp(
        user: user,
      ),
    ));
  else
    runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final UserDetails user;
  MyApp({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          (user != null) ? '/user' : '/guest',
      routes: {
        '/user': (context) => UserHomeScreen(),
        '/guest': (context) => GuestHomeScreen(),
         '/register':(context) => RegisterScreen(),
         '/userProfile': (context) => UserProfile(
        ),
      },
    );
  }
}
