import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> postStream =
      FirebaseFirestore.instance.collection('post').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: postStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final List postData = [];
        snapshot.data?.docs.map((DocumentSnapshot document) {
          Map a = document.data() as Map<String, dynamic>;
          postData.add(a);
          print(postData);
        }).toList();

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                for (var i = 0; i < postData.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.blueGrey, width: 1.2),
                      ),
                      shadowColor: Colors.white,
                      elevation: 10,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 185,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 0, 20, 0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/authassets/login.png"),
                                      radius: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 150, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Full Name"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          formattedTime(
                                              postData[i]['postTime']),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.share,
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                height: 30,
                                color: Colors.blueGrey,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Text(
                                  postData[i]['tweet'],
                                  style: TextStyle(
                                    fontSize: 23,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              Center(
                                  child: postData[i]['postImg'] != null
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 0),
                                          child: Image.network(
                                            postData[i]['postImg']!,
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      : null),
                              const Divider(
                                thickness: 1,
                                height: 30,
                                color: Colors.blueGrey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.heart),
                                      SizedBox(width: 8),
                                      Text("Like"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.retweet),
                                      SizedBox(width: 10),
                                      Text("Retweet"),
                                    ],
                                  ),
                                  Center(
                                      child: postData[i]['uid'] == user?.uid
                                          ? Row(
                                              children: [
                                                Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(width: 8),
                                                Text("Delete"),
                                              ],
                                            )
                                          : null),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }

  String formattedTime(timestamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    return DateFormat.yMMMd().format(dateFromTimeStamp);
  }
}
