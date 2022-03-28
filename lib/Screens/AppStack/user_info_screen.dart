// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // edit controller
  final nameEditingController = new TextEditingController();
  final bioEditingController = new TextEditingController();
  final dobEditingController = new TextEditingController();
  final mobileEditingController = new TextEditingController();
  final cityEditingController = new TextEditingController();
  final countryEditingController = new TextEditingController();

  // dispose controller
  @override
  void dispose() {
    // TODO: implement dispose
    nameEditingController.dispose();
    bioEditingController.dispose();
    dobEditingController.dispose();
    mobileEditingController.dispose();
    cityEditingController.dispose();
    countryEditingController.dispose();
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
            children: [
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 90,
                  child: ClipOval(
                    child: imagePick != null
                        ? Image.file(imagePick!)
                        : Image.asset("assets/authassets/login.png"),
                  ),
                ),
                onTap: () {
                  bottomSheet();
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameEditingController,
                        onSaved: (value) {
                          nameEditingController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Name");
                          }
                        },
                        keyboardType: TextInputType.name,
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
                              Icons.person_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Full Name",
                          hintStyle: const TextStyle(
                            fontSize: 22.0,
                          ),
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.shade700, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: bioEditingController,
                        onSaved: (value) {
                          bioEditingController.text = value!;
                        },
                        maxLength: 150,
                        minLines: 1,
                        maxLines: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Bio");
                          }
                        },
                        keyboardType: TextInputType.multiline,
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
                              Icons.badge_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Your Bio",
                          hintStyle: const TextStyle(
                            fontSize: 22.0,
                          ),
                          labelText: "Bio",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.shade700, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: dobEditingController,
                        onSaved: (value) {
                          dobEditingController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your DOB");
                          }
                        },
                        keyboardType: TextInputType.datetime,
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
                              Icons.book,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Your DOB",
                          hintStyle: const TextStyle(
                            fontSize: 22.0,
                          ),
                          labelText: "DOB",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.shade700, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: mobileEditingController,
                        onSaved: (value) {
                          mobileEditingController.text = value!;
                        },
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Mobile Number");
                          }
                        },
                        keyboardType: TextInputType.number,
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
                              Icons.phone_iphone_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Your Mobile Number",
                          hintStyle: const TextStyle(
                            fontSize: 22.0,
                          ),
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.shade700, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: cityEditingController,
                        onSaved: (value) {
                          cityEditingController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your City");
                          }
                        },
                        keyboardType: TextInputType.text,
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
                              Icons.location_city_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Your City",
                          hintStyle: const TextStyle(
                            fontSize: 22.0,
                          ),
                          labelText: "City",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.shade700, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: countryEditingController,
                        onSaved: (value) {
                          countryEditingController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Country");
                          }
                        },
                        keyboardType: TextInputType.text,
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
                              Icons.location_on,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter Your Country",
                          hintStyle: const TextStyle(
                            fontSize: 22.0,
                          ),
                          labelText: "Country",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.shade700, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () => {
                          addUserData(
                              nameEditingController.text,
                              bioEditingController.text,
                              dobEditingController.text,
                              mobileEditingController.text,
                              cityEditingController.text,
                              countryEditingController.text)
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            shadowColor: Colors.black,
                            elevation: 15,
                            fixedSize: const Size(350, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 1.5,
                              ),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 25,
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void bottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.deepPurple[200],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(80),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Select For Image'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  child: RaisedButton(
                    onPressed: () => {openGallery()},
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.image,
                          color: Colors.green,
                          size: 40.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 5, 10),
                          child: Text(
                            'Open Gallery',
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  child: RaisedButton(
                    onPressed: () => {openCamera()},
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.camera_enhance_rounded,
                          color: Colors.green,
                          size: 40.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 5, 10),
                          child: Text(
                            'Open Camera',
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
                )
              ],
            ),
          ),
        );
      },
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
        Navigator.pop(context);
        return null;
      }

      final imageTemprory = File(image.path);
      setState(() {
        imagePick = imageTemprory;
      });
      Navigator.pop(context);
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
        Navigator.pop(context);
        return null;
      }
      final imageTemprory = File(image.path);
      setState(() {
        imagePick = imageTemprory;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  // Adding data of user
  void addUserData(String name, String bio, String dob, String mobile,
      String city, String country) async {
    User? user = FirebaseAuth.instance.currentUser;
    final userUid = user?.uid;
    CollectionReference userData =
        FirebaseFirestore.instance.collection("user");
    final imageUrl = await uploadImage(imagePick);
    if (_formKey.currentState!.validate()) {
      await userData
          .doc('${userUid}')
          .set({
            'fullName': nameEditingController.text,
            'bio': bioEditingController.text,
            'dob': dobEditingController.text,
            'mobile': mobileEditingController.text,
            'city': cityEditingController.text,
            'country': countryEditingController.text,
            'uid': userUid,
            'profilePic': imageUrl,
          })
          .then((value) =>
              {Navigator.pushReplacementNamed(context, "/homescreen")})
          .catchError((e) => print(e));
    }
  }

  Future uploadImage(File? imagePick) async {
    if (imagePick == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No file selected."),
        ),
      );
      return null;
    } else {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        final userUid = user?.email;
        String fileName = 'ProfilePic/${userUid}';
        Reference reference = FirebaseStorage.instance.ref().child(fileName);
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
