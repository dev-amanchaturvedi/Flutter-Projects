import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nannyhelps/bottomNavigationBar.dart';
import 'package:nannyhelps/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  TextEditingController fnm = TextEditingController();
  FocusNode fnameFN = FocusNode();
  TextEditingController lnm = TextEditingController();
  FocusNode lnameFN = FocusNode();
  TextEditingController age = TextEditingController();
  FocusNode ageFN = FocusNode();
  TextEditingController edu = TextEditingController();
  FocusNode eduFN = FocusNode();
  TextEditingController exp = TextEditingController();
  FocusNode expFN = FocusNode();
  TextEditingController num = TextEditingController();
  FocusNode numFN = FocusNode();
  TextEditingController email = TextEditingController();
  FocusNode emailFN = FocusNode();
  TextEditingController price = TextEditingController();
  FocusNode priceFN = FocusNode();
  TextEditingController add = TextEditingController();
  FocusNode addFN = FocusNode();

  final infoRef = FirebaseFirestore.instance.collection('nanny_data');

  String imageUrl = '';

  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    fontSize: 8.0,
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
                          const Text("Upload your picture(passport size):"),
                          IconButton(
                              onPressed: () async {
                                ImagePicker imagePicker = ImagePicker();
                                XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                                print('${file?.path}');

                                if(file == null) return;

                                String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();

                                Reference referenceRoot = FirebaseStorage.instance.ref();
                                Reference referenceDirImage = referenceRoot.child('images');
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
                      "First Name: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Tutun",
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        controller: fnm,
                        focusNode: fnameFN,
                        onFieldSubmitted: (value) {
                          fnameFN.unfocus();
                          lnameFN.requestFocus();
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
                      "Last Name: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: lnm,
                        focusNode: lnameFN,
                        decoration: const InputDecoration(
                          hintText: "Mosi",
                          border: UnderlineInputBorder(),
                        ),
                        onFieldSubmitted: (value) {
                          lnameFN.unfocus();
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
                      "Age: ",
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
                          eduFN.requestFocus();
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
                      "Highest Education: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: edu,
                        focusNode: eduFN,
                        decoration: const InputDecoration(
                          hintText: "12th",
                          border: UnderlineInputBorder(),
                        ),
                        onFieldSubmitted: (value) {
                          eduFN.unfocus();
                          expFN.requestFocus();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Experience: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: exp,
                        focusNode: expFN,
                        decoration: const InputDecoration(
                          hintText: "0",
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {
                          expFN.unfocus();
                          numFN.requestFocus();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact Number: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: num,
                        focusNode: numFN,
                        decoration: const InputDecoration(
                          hintText: "0123456789",
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {
                          numFN.unfocus();
                          emailFN.requestFocus();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: email,
                        focusNode: emailFN,
                        decoration: const InputDecoration(
                          hintText: "xyz@gmail.com",
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          emailFN.unfocus();
                          priceFN.requestFocus();
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price: (for kids of age 1yr - 2yr per month)",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: price,
                        focusNode: priceFN,
                        decoration: const InputDecoration(
                          hintText: "500",
                          border: UnderlineInputBorder(),
                        ),
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (value) {
                            priceFN.unfocus();
                            addFN.requestFocus();
                          }
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Address(State): ",
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
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            emailFN.unfocus();
                            priceFN.requestFocus();
                          }
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                              builder: (context) => const HomeScreen()));
                      String id =
                          DateTime.now().microsecondsSinceEpoch.toString();
                      infoRef
                          .doc(id)
                          .set({
                            'image': imageUrl,
                            'first name': fnm.text,
                            'last name': lnm.text,
                            'age': int.parse(age.text),
                            'education': edu.text,
                            'gender': gender.toString(),
                            'address': add.text,
                            'experience': exp.text,
                            'number': int.parse(num.text),
                            'email': email.text,
                            'price': price.text,
                            'id': id
                          })
                          .then((value) {})
                          .onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                      fnm.clear();
                      lnm.clear();
                      age.clear();
                      add.clear();
                      edu.clear();
                      exp.clear();
                      num.clear();
                      email.clear();
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        )),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
