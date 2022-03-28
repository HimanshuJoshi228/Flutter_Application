import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // edit controller
  final tweetEditingController = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    tweetEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                  child: imagePick != null
                      ? Image.file(
                          imagePick!,
                          fit: BoxFit.contain,
                          width: 300.0,
                          height: 200.0,
                        )
                      : null),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: tweetEditingController,
                    onSaved: (value) {
                      tweetEditingController.text = value!;
                    },
                    maxLength: 300,
                    minLines: 1,
                    maxLines: 7,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Somthing");
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Anything in mind...",
                      hintStyle: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                child: Text(
                  "post".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => {addUserData(tweetEditingController.text)},
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shadowColor: Colors.black,
                  elevation: 15,
                  fixedSize: const Size(200, 60),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.share,
        buttonSize: Size(70, 70),
        childrenButtonSize: Size(60, 60),
        spaceBetweenChildren: 25,
        activeIcon: Icons.close,
        backgroundColor: Colors.green,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.camera_alt_rounded),
              label: "Open Camera",
              backgroundColor: Colors.lightBlue,
              onTap: () {
                openCamera();
              }),
          SpeedDialChild(
              child: const Icon(Icons.folder_shared),
              label: "Open Gallery",
              backgroundColor: Colors.lightBlue,
              onTap: () {
                openGallery();
              }),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  File? imagePick;
  Future openGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No file selected."),
          ),
        );
        return null;
      }

      final imageTemprory = File(image.path);
      setState(() {
        imagePick = imageTemprory;
      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  Future openCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No file selected."),
          ),
        );
        return null;
      }
      final imageTemprory = File(image.path);
      setState(() {
        imagePick = imageTemprory;
      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  void addUserData(String tweet) async {
    User? user = FirebaseAuth.instance.currentUser;
    final userUid = user?.uid;
    CollectionReference userData =
        FirebaseFirestore.instance.collection("post");
    if (_formKey.currentState!.validate()) {
      final imageUrl = await uploadImage(imagePick);
      await userData
          .add({
            'tweet': tweetEditingController.text,
            'uid': userUid,
            'postImg': imageUrl,
            'likes': null,
            'comment': null,
            'postTime': Timestamp.fromDate(new DateTime.now()),
          })
          .then((value) =>
              {Navigator.pushReplacementNamed(context, "/homescreen")})
          .catchError((e) => print(e));
    }
  }

  Future uploadImage(File? imagePick) async {
    if (imagePick != null) {
      try {
        String time = DateTime.now().millisecondsSinceEpoch.toString();
        String filePath = 'post/${imagePick.path.split("/").join("${time}")}';
        Reference reference = FirebaseStorage.instance.ref().child(filePath);
        await reference.putFile(imagePick);
        print("object");
        final String? url = await reference.getDownloadURL();
        print("download url : $url");
        return url;
      } on FirebaseException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("error ${e}"),
          ),
        );
        print(e.toString());
      }
    }
  }
}
