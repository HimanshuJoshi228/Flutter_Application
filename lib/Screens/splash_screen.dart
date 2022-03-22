import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => StartScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/authassets/info.png",
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              "Let's Connect With Others!!",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: LinearProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
