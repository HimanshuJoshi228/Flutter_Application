import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  // collection ref
  final Stream<QuerySnapshot> userDataStream =
      FirebaseFirestore.instance.collection('user').snapshots();

  // Stream documentStream =
  // FirebaseFirestore.instance.collection('users').doc(user?.uid).snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: userDataStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List userData = [];
          snapshot.data?.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            userData.add(a);
            print(userData);
          }).toList();

          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.green,
              backgroundColor: Colors.pink[100],
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.pink[100],
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 90,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/authassets/login.png"),
                              radius: 88,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "demo@gmail.com",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // logOut(context);
                                    print(userData);
                                  },
                                  child: const Text(
                                    "LogOut",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 23,
                                      fontWeight: FontWeight.normal,
                                      // letterSpacing: 3,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                        color: Colors.green,
                                        width: 1,
                                      ),
                                    ),
                                    minimumSize: const Size(130, 35),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/userinfoscreen");
                                  },
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 23,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(
                                        color: Colors.green,
                                        width: 1,
                                      ),
                                    ),
                                    minimumSize: const Size(130, 35),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
          );
        });
  }
}
