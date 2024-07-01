import 'dart:io';

import 'package:card_maker/screens/home_screen.dart';
import 'package:card_maker/screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Insert extends StatefulWidget {
  Insert({
    Key? key,
    this.data,
  }) : super(key: key);

  QueryDocumentSnapshot<Map<String, dynamic>>? data;

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  TextEditingController nm = TextEditingController();
  FocusNode nameFN = FocusNode();
  TextEditingController looking = TextEditingController();
  FocusNode lookingFN = FocusNode();
  TextEditingController age = TextEditingController();
  FocusNode ageFN = FocusNode();
  TextEditingController number = TextEditingController();
  FocusNode numberFN = FocusNode();
  TextEditingController email = TextEditingController();
  FocusNode emailFN = FocusNode();
  TextEditingController add = TextEditingController();
  FocusNode addFN = FocusNode();
  TextEditingController qualification = TextEditingController();
  FocusNode qualFN = FocusNode();
  TextEditingController expertise = TextEditingController();
  FocusNode expertFN = FocusNode();
  TextEditingController experience = TextEditingController();
  FocusNode expFN = FocusNode();

  final infoRef = FirebaseFirestore.instance.collection('info');

  String imageUrl = '';

  _selectFile(bool imageFrom) async {
    var file = await ImagePicker().pickImage(
        source: imageFrom ? ImageSource.gallery : ImageSource.camera);
    print(file?.name);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.deepPurpleAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade700,
                    border: const Border(bottom: BorderSide(width: 2))),
                child: const Center(
                  child: Text('Hello',
                      style: TextStyle(
                        fontSize: 40,
                      )),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ));
                  });
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'User Data',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.deepPurpleAccent.shade700,
        ),
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          ImagePicker imagepicker = ImagePicker();
                          XFile? file = await imagepicker.pickImage(
                              source: ImageSource.gallery);
                          print('${file?.path}');

                          if (file == null) return;

                          String uniqueFileName =
                              DateTime.now().microsecondsSinceEpoch.toString();

                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDirImage =
                              referenceRoot.child('images');

                          Reference referenceImageToUpload =
                              referenceDirImage.child(uniqueFileName);

                          try {
                            await referenceImageToUpload
                                .putFile(File(file.path));
                            imageUrl =
                                await referenceImageToUpload.getDownloadURL();
                          } catch (error) {
                            const Text("Something went wrong");
                          }
                        },
                        icon: const Icon(Icons.photo_library_outlined)),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          nameFN.unfocus();
                          ageFN.requestFocus();
                        },
                        focusNode: nameFN,
                        controller: nm,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Name',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          ageFN.unfocus();
                          numberFN.requestFocus();
                        },
                        controller: age,
                        focusNode: ageFN,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Age',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          numberFN.unfocus();
                          emailFN.requestFocus();
                        },
                        controller: number,
                        focusNode: numberFN,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Number',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          emailFN.unfocus();
                          addFN.requestFocus();
                        },
                        focusNode: emailFN,
                        controller: email,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Email',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          addFN.unfocus();
                          lookingFN.requestFocus();
                        },
                        controller: add,
                        focusNode: addFN,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Address',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          lookingFN.unfocus();
                          qualFN.requestFocus();
                        },
                        controller: looking,
                        focusNode: lookingFN,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Looking For',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          qualFN.unfocus();
                          expertFN.requestFocus();
                        },
                        controller: qualification,
                        focusNode: qualFN,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Qualification',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          expertFN.unfocus();
                          expFN.requestFocus();
                        },
                        controller: expertise,
                        focusNode: expertFN,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Expertise',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        onSubmitted: (value) {
                          expFN.unfocus();
                        },
                        controller: experience,
                        focusNode: expFN,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Experience',
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        String id =
                            DateTime.now().microsecondsSinceEpoch.toString();
                        infoRef
                            .doc(id)
                            .set({
                              'name': nm.text,
                              'age': int.parse(age.text),
                              'looking': looking.text,
                              'image': imageUrl,
                              'number': int.parse(number.text),
                              'email': email.text,
                              'address': add.text,
                              'qualification': qualification.text,
                              'expertise': expertise.text,
                              'experience': experience.text,
                              'id': id
                            })
                            .then((value) {})
                            .onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                        nm.clear();
                        age.clear();
                        looking.clear();
                        number.clear();
                        email.clear();
                        add.clear();
                        qualification.clear();
                        expertise.clear();
                        experience.clear();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
