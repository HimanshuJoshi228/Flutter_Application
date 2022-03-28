import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
// stack redirect
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    _auth.authStateChanges().listen((User? user) {
      if (!(user == null)) {
        Navigator.pushReplacementNamed(context, "/homescreen");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Image.asset(
                "assets/authassets/twitterlogo.png",
                fit: BoxFit.contain,
                width: 200.0,
                height: 200.0,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            RichText(
              text: const TextSpan(
                text: "Welcome to ",
                style: TextStyle(fontSize: 28.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: "TWITTER",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 180.0,
            ),
            ElevatedButton(
              child: const Text("LogIn"),
              onPressed: () =>
                  {Navigator.pushReplacementNamed(context, "/login")},
              style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                  shadowColor: Colors.black,
                  elevation: 15,
                  fixedSize: const Size(350, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 25,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              child: const Text(
                "SignUp",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () =>
                  {Navigator.pushReplacementNamed(context, "/signup")},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shadowColor: Colors.black,
                elevation: 15,
                fixedSize: const Size(350, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                textStyle: const TextStyle(
                    fontSize: 25,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
