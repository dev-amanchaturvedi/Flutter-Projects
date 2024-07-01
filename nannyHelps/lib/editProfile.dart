import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nannyhelps/bottomNavigationBar.dart';
import 'package:nannyhelps/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final infoRef = FirebaseFirestore.instance.collection('profile_data');

  TextEditingController name = TextEditingController();
  FocusNode nameFN = FocusNode();
  TextEditingController age = TextEditingController();
  FocusNode ageFN = FocusNode();
  TextEditingController add = TextEditingController();
  FocusNode addFN = FocusNode();

  String imageUrl = '';

  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E2EB),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'NannyHelps',
              style: TextStyle(fontSize: 20.0),
            ),
            Text('Look for your child',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 10.0,
                )),
          ],
        ),
        backgroundColor: const Color(0xFF7E57C2),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const Text("Upload your picture:"),
                            IconButton(
                                onPressed: () async {
                                  ImagePicker imagepicker = ImagePicker();
                                  XFile? file = await imagepicker.pickImage(source: ImageSource.gallery);
                                  print('${file?.path}');

                                  if(file == null) return;

                                  String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();

                                  Reference referenceRoot = FirebaseStorage.instance.ref();
                                  Reference referenceDirImage = referenceRoot.child('profileimage');
                                  Reference referenceImageToUpload = referenceDirImage.child(uniqueFileName);

                                  try{
                                    await referenceImageToUpload.putFile(File(file.path));
                                    imageUrl = await referenceImageToUpload.getDownloadURL();
                                  }catch(error){
                                    print("Error ${error.toString()}");
                                  }
                                },
                                icon: const Icon(Icons.photo_library_outlined)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Full Name: ",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Nobita Nobi",
                            border: UnderlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          controller: name,
                          focusNode: nameFN,
                          onFieldSubmitted: (value) {
                            nameFN.unfocus();
                            ageFN.requestFocus();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "age: ",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: age,
                          focusNode: ageFN,
                          decoration: const InputDecoration(
                            hintText: "20",
                            border: UnderlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            ageFN.unfocus();
                            addFN.requestFocus();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Address(state): ",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: add,
                          focusNode: addFN,
                          decoration: const InputDecoration(
                            hintText: "Gujarat",
                            border: UnderlineInputBorder(),
                          ),
                          onFieldSubmitted: (value) {
                            addFN.unfocus();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Gender: ",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      RadioListTile(
                          value: "Male",
                          groupValue: gender,
                          onChanged: (newgender) {
                            setState(() {
                              gender = newgender!;
                            });
                          },
                          title: const Text("Male")),
                      RadioListTile(
                        value: "Female",
                        groupValue: gender,
                        onChanged: (newgender) {
                          setState(() {
                            gender = newgender!;
                          });
                        },
                        title: const Text("Female"),
                      ),
                      RadioListTile(
                        value: "Others",
                        groupValue: gender,
                        onChanged: (newgender) {
                          setState(() {
                            gender = newgender!;
                          });
                        },
                        title: const Text("Others"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7E57C2),
                        foregroundColor: Colors.white,
                        shadowColor: Colors.deepPurpleAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()));
                        String id =
                        DateTime.now().microsecondsSinceEpoch.toString();
                        infoRef
                            .doc(id)
                            .set({
                          'image': imageUrl,
                          'name': name.text,
                          'age': int.parse(age.text),
                          'gender': gender.toString(),
                          'address': add.text,
                          'id': id
                        })
                            .then((value) {})
                            .onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                        name.clear();
                        age.clear();
                        add.clear();
                      },
                      child: const Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          )),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
