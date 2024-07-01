import 'package:card_maker/finalCard.dart';
import 'package:card_maker/screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../insert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var firestoreDB = FirebaseFirestore.instance.collection("info").snapshots();

  CollectionReference cref = FirebaseFirestore.instance.collection('info');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Colors.deepPurpleAccent.shade700,
          ),
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
                  title: const Text('Add'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Insert(),
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
                            builder: (context) => const SignInScreen(),
                          ));
                    });
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Insert()));
              },
              child: const Icon(Icons.add)),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder(
              stream: firestoreDB,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 53,
                              width: 310,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 115, vertical: 15),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FinalCard(
                                          data: snapshot.data!.docs[index]),
                                    ),
                                  );
                                },
                                child: Text(
                                  snapshot.data!.docs[index]['name'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 53,
                              width: 65,
                              decoration: const BoxDecoration(color: Colors.blueGrey),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      backgroundColor: Colors.blueGrey),
                                  onPressed: () {
                                    cref
                                        .doc(snapshot.data!.docs[index]['id']
                                            .toString())
                                        .delete();
                                  },
                                  child: const Icon(
                                    Icons.delete_outlined,
                                  )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ));
  }
}
