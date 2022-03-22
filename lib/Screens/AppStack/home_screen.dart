import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomeScreen",
        ),
      ),
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
                    const Text(
                      "user@gmail.com",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: const Text(
                        "SignOut",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          letterSpacing: 3,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
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
                children: const [
                  Icon(
                    Icons.verified_user_sharp,
                    size: 30.0,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
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
      floatingActionButton: const SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          splashColor: Colors.green,
          onPressed: null,
          child: Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
