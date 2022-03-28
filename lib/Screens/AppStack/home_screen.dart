import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AppStack/post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// call firebase
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "HomeScreen",
        ),
      ),
      backgroundColor: Colors.blue[300],
      body: PostScreen(),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 300,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.supervised_user_circle_rounded,
                      size: 100.0,
                      color: Colors.blue,
                    ),
                    const Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    Text(
                      "${user?.email}",
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        logOut(context);
                      },
                      child: const Text(
                        "SignOut",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          letterSpacing: 3,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    Icons.verified_user_sharp,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      child: const Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/profilescreen");
                      }),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(
                    Icons.settings,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Setting",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: TextButton(
                  onPressed: null,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.home,
                        size: 38,
                        color: Colors.green,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                child: TextButton(
                  onPressed: null,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.chat,
                        size: 38,
                        color: Colors.green,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          splashColor: Colors.green,
          backgroundColor: Colors.purple,
          onPressed: () {
            Navigator.pushNamed(context, "/addpostscreen");
          },
          child: const Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, "/startscreen");
    print("logout");
  }
}
