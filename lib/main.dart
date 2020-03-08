import 'package:facefood/models/user_details.dart';
import 'package:facefood/restart_app.dart';
import 'package:facefood/screens/guest/home.dart';
<<<<<<< HEAD
import 'package:facefood/screens/user/create_post.dart';
=======
import 'package:facefood/screens/register.dart';
>>>>>>> 68d20a4d85ee923ea0a684e99df6eecf1674a240
import 'package:facefood/screens/user/home.dart';
import 'package:facefood/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
          (user != null) ? '/user' : '/create_post',
      routes: {
        '/user': (context) => UserHomeScreen(),
        '/guest': (context) => GuestHomeScreen(),
<<<<<<< HEAD
        '/create_post': (context) => CreatePostScreen(),
=======
         '/register':(context) => RegisterScreen(),
>>>>>>> 68d20a4d85ee923ea0a684e99df6eecf1674a240
      },
    );
  }
}
