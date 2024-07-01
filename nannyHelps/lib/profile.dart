import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannyhelps/bottomNavigationBar.dart';
import 'package:nannyhelps/editNannyDetail.dart';
import 'package:nannyhelps/editProfile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var firestoreDB =
      FirebaseFirestore.instance.collection("profile_data").snapshots();

  CollectionReference cref =
      FirebaseFirestore.instance.collection('profile_data');

  var firestoreDB1 =
  FirebaseFirestore.instance.collection("nanny_data").snapshots();

  CollectionReference cref1 =
  FirebaseFirestore.instance.collection('nanny_data');

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
      body: StreamBuilder(
        stream: firestoreDB,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, int index) {
                return SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.purple[900],
                      child: Image(
                        width: double.infinity,
                        height: double.infinity,
                        image:
                            NetworkImage(snapshot.data!.docs[index]['image']),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(snapshot.data!.docs[index]['name'],
                        style: const TextStyle(
                            fontSize: 40.0,
                            fontFamily: 'LibreBaskerville',
                            letterSpacing: 1.0)),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20.0,
                      width: double.infinity,
                      child: Divider(
                        color: Colors.blueGrey,
                        thickness: 2.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(children: [
                        const Text("Gender: ",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0)),
                        Text(snapshot.data!.docs[index]['gender'],
                            style: const TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'LibreBaskerville',
                                letterSpacing: 1.0)),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(children: [
                        const Text("Age: ",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0)),
                        Text(snapshot.data!.docs[index]['age'].toString(),
                            style: const TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'LibreBaskerville',
                                letterSpacing: 1.0)),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(children: [
                        const Text("Address: ",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0)),
                        Text(snapshot.data!.docs[index]['address'],
                            style: const TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'LibreBaskerville',
                                letterSpacing: 1.0)),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
                          child: SizedBox(
                            width: 150.0,
                            child: ElevatedButton(
                              onPressed: () {
                                String profileDocumentId = snapshot.data!.docs[index].id;
                                deleteProfileDocument(profileDocumentId);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const EditProfile()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color(0xFF7E57C2), // Text color
                              ),
                              child: const Text("Edit Profile"),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 30.0, 0, 10.0),
                          child: SizedBox(
                            width: 150.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditNannyDetail(data: snapshot.data!.docs[index])),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color(0xFF7E57C2), // Text color
                              ),
                              child: const Text("Edit Nanny Detail"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              });
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  void deleteProfileDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("profile_data")
          .doc(documentId)
          .delete();
    } catch (e) {
      print("Error deleting profile document: $e");
    }
  }

}
