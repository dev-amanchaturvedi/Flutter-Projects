import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannyhelps/bottomNavigationBar.dart';
import 'package:nannyhelps/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var firestoreDB =
      FirebaseFirestore.instance.collection("nanny_data").snapshots();

  CollectionReference cref =
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
              style: TextStyle(fontSize: 20.0, fontFamily: 'Unna'),
            ),
            Text('Look for your child',
                style: TextStyle(
                  fontFamily: 'YoungSerif',
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
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white)),
                  height: 180,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[900]),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Detail(data: snapshot.data!.docs[index]),
                          ));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          child: SizedBox(
                            width: 90,
                            height: 100, // Image radius
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(3, 8, 3, 8),
                              child: Image(
                                image: NetworkImage(
                                    snapshot.data!.docs[index]['image']),
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 8, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Name: ",
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['first name'],
                                    style: const TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      fontFamily: 'YoungSerif',
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['last name'],
                                    style: const TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      fontFamily: 'YoungSerif',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Gender: ",
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['gender'],
                                    style: const TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      fontFamily: 'YoungSerif',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Price: ",
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,

                                    ),
                                  ),
                                  Text(
                                    '${snapshot.data!.docs[index]['price']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      fontFamily: 'YoungSerif',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
