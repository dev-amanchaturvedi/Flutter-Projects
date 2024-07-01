import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannyhelps/bottomNavigationBar.dart';
import 'package:nannyhelps/home.dart';
import 'package:nannyhelps/userDetail.dart';

class EditNannyDetail extends StatefulWidget {
  EditNannyDetail({Key? key, this.data}) : super(key: key);

  QueryDocumentSnapshot<Map<String, dynamic>>? data;

  @override
  State<EditNannyDetail> createState() => _EditNannyDetailState();
}

class _EditNannyDetailState extends State<EditNannyDetail> {
  var firestoreDB =
  FirebaseFirestore.instance.collection("nanny_data").snapshots();

  //int selectedIndex = -1;

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
              final nannyData = snapshot.data!.docs[index];
              return SafeArea(
                child: Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    color: Colors.purple[900],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 70.0,
                                backgroundImage: NetworkImage(
                                    snapshot.data!.docs[index]['image']),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    snapshot.data!.docs[index]['first name'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'YoungSerif',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text(
                                    snapshot.data!.docs[index]['last name'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'YoungSerif',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 300,
                          child: Divider(
                            color: Colors.blueGrey,
                            thickness: 2.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Age : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['age']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Gender : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                            ['gender'],
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Education : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                            ['education'],
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Experience : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                            ['experience'],
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Address : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                            ['address'],
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Number : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['number']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'E-mail : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['email'],
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Price : ',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]['price']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 32,
                                                fontFamily: 'Unna'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
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
                                        deleteDocument(nannyData.id);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                                      },
                                      child: const Text('Delete'),
                                    ),
                                    ElevatedButton(
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
                                        deleteDocument(nannyData.id);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDetail()));
                                      },
                                      child: const Text('Update'),
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
              );
            },
          );
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  // Function to delete a document
  Future<void> deleteDocument(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection("nanny_data")
          .doc(documentId)
          .delete();
    } catch (e) {
      print("Error deleting document: $e");
    }
  }
}

// bottomNavigationBar: BottomNavigationBar(
// type: BottomNavigationBarType.fixed,
// backgroundColor: const Color(0xFF7E57C2),
// onTap: (int index) {
// setState(() {
// selectedIndex = index;
// });
//
// if (selectedIndex == 0) {
// // Handle the "Update" action here
// // You can navigate to an update screen or perform your update logic
// } else if (selectedIndex == 1) {
// // Handle the "Delete" action here
// // You can show a confirmation dialog or directly call the delete function
// }
// },
// items: [
// BottomNavigationBarItem(
// icon: Icon(
// Icons.edit,
// color: selectedIndex == 0 ? Colors.white : Colors.yellow,
// ),
// label: 'Update',
// ),
// BottomNavigationBarItem(
// icon: Icon(
// Icons.delete,
// color: selectedIndex == 1 ? Colors.white : Colors.yellow,
// ),
// label: 'Delete',
// ),
// ],
// ),