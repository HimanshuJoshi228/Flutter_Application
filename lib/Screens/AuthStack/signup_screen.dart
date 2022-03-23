// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // calling firebase
  final _auth = FirebaseAuth.instance;
  // form key
  final _formKey = GlobalKey<FormState>();
  // edit controller
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  // dispose controller
  @override
  void dispose() {
    // TODO: implement dispose
    emailEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    super.dispose();
  }

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
                "assets/authassets/signup.png",
                fit: BoxFit.contain,
                width: 250.0,
                height: 250.0,
              ),
            ),
            const Text(
              "Twitter SignUp",
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailEditingController,
                          onSaved: (value) {
                            emailEditingController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
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
                                  color: Colors.amberAccent.shade700,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordEditingController,
                          onSaved: (value) {
                            passwordEditingController.text = value!;
                          },
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                          },
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
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
                                  color: Colors.amberAccent.shade700,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: confirmPasswordEditingController,
                          onSaved: (value) {
                            confirmPasswordEditingController.text = value!;
                          },
                          validator: (value) {
                            if (confirmPasswordEditingController.text !=
                                passwordEditingController.text) {
                              return "Password don't match";
                            }
                            return null;
                          },
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Icon(
                                Icons.no_encryption_gmailerrorred_sharp,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Enter Confirm Password",
                            hintStyle: const TextStyle(
                              fontSize: 22.0,
                            ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blue.shade800,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amberAccent.shade700,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    child: const Text("SignUp"),
                    onPressed: () => {
                      signUp(emailEditingController.text,
                          passwordEditingController.text)
                    },
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
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: RaisedButton(
                      onPressed: () => {warningAlert()},
                      onLongPress: () => {signInWithGoogle()},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.black),
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
                              'SignUp With Google',
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
                    height: 70.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Already have account? ",
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Click Here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(context, "/login");
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

// sign up with email and password
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(
                email: emailEditingController.text,
                password: passwordEditingController.text)
            .then((value) =>
                {Navigator.pushReplacementNamed(context, "/homescreen")})
            .catchError((e) => {print(e)});
      } catch (error) {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text("Warning!!!"),
                  content: Text("${error}"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancle'),
                      child: const Text("Cancle"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text("OK"),
                    )
                  ],
                ));
        print(error.toString());
      }
    }
  }

  // sign up with google
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) => Navigator.pushReplacementNamed(context, "/homescreen"));
  }

  warningAlert() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Warning!!!"),
              content: Text("Pressed Button for 2 sec"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text("OK"),
                )
              ],
            ));
  }
}
