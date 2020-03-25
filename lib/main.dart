import 'package:facefood/models/user_details.dart';
import 'package:facefood/restart_app.dart';
import 'package:facefood/screens/guest/home.dart';
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
    print(user);
    return MaterialApp(
      title: 'Facefood',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: (user != null) ? '/user' : '/guest',
      routes: {
        '/user': (context) => FutureBuilder<UserDetails>(
            future: getUserFromToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return UserHomeScreen();
              else
                return GuestHomeScreen();
            }),
        '/guest': (context) => FutureBuilder<UserDetails>(
            future: getUserFromToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return UserHomeScreen();
              else
                return GuestHomeScreen();
            }),

        // '/register': (context) => RegisterScreen(),
        // '/userProfile': (context) => UserProfile(),
        // '/postDetail': (context) => PostDetailScreen(),
        // '/create_post': (context) => CreatePostScreen(),
      },
    );
  }
}
