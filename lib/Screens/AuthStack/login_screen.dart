// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                "assets/authassets/login.png",
                fit: BoxFit.contain,
                width: 250.0,
                height: 250.0,
              ),
            ),
            const Text(
              "Twitter LogIn",
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Icon(
                          Icons.email_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter Email",
                      hintStyle: const TextStyle(
                        fontSize: 22.0,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue.shade800,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amberAccent.shade700, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Icon(
                          Icons.no_encryption_gmailerrorred_sharp,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter Password",
                      hintStyle: const TextStyle(
                        fontSize: 22.0,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue.shade800,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amberAccent.shade700, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    child: const Text("LogIn"),
                    onPressed: () => {print("object")},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent[900],
                      shadowColor: Colors.black,
                      elevation: 10,
                      fixedSize: const Size(370, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 25,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: RaisedButton(
                      onPressed: () => {print("object")},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      elevation: 10,
                      splashColor: Colors.green,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.android,
                            color: Colors.green,
                            size: 40.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 5, 10),
                            child: Text(
                              'SignIn With Google',
                              style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 1,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 120.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Create new account? ",
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Click Here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, "/signup");
                            },
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
