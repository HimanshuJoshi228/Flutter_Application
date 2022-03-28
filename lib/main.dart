import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Screens/AppStack/add_post_screen.dart';
import 'package:flutter_application_1/Screens/AppStack/home_screen.dart';
import 'package:flutter_application_1/Screens/AppStack/profile_screen.dart';
import 'package:flutter_application_1/Screens/AppStack/user_info_screen.dart';
import 'package:flutter_application_1/Screens/AuthStack/login_screen.dart';
import 'package:flutter_application_1/Screens/AuthStack/signup_screen.dart';
import 'package:flutter_application_1/Screens/splash_screen.dart';
import 'package:flutter_application_1/Screens/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      routes: {
        "/": (context) => SplashScreen(),
        "/homescreen": (context) => HomeScreen(),
        "/addpostscreen": (context) => AddPostScreen(),
        "/profilescreen": (context) => ProfileScreen(),
        "/userinfoscreen": (context) => UserInfoScreen(),
        "/startscreen": (context) => StartScreen(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
      },
    );
  }
}
