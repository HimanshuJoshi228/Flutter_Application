import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AppStack/home_screen.dart';
import 'package:flutter_application_1/Screens/AuthStack/login_screen.dart';
import 'package:flutter_application_1/Screens/AuthStack/signup_screen.dart';
import 'package:flutter_application_1/Screens/splash_screen.dart';
import 'package:flutter_application_1/Screens/start_screen.dart';

void main() => runApp(MyApp());

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
        "/startscreen": (context) => StartScreen(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
      },
    );
  }
}
