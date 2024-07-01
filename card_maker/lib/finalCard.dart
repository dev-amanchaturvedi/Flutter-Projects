import 'package:card_maker/screens/home_screen.dart';
import 'package:card_maker/screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'insert.dart';

class FinalCard extends StatefulWidget {
  FinalCard({
    Key? key,
    this.data,
  }) : super(key: key);

  QueryDocumentSnapshot<Map<String, dynamic>>? data;

  @override
  State<FinalCard> createState() => _FinalCardState();
}

class _FinalCardState extends State<FinalCard> {
  // var firestoreDB = FirebaseFirestore.instance.collection("info").snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your Card'),
          backgroundColor: Colors.deepPurpleAccent.shade700,
        ),
        drawer: Drawer(
          backgroundColor: Colors.deepPurpleAccent,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Center(
                  child: Text('Hello',
                      style: TextStyle(
                        fontSize: 40,
                      )),
                ),
                decoration:
                BoxDecoration(color: Colors.deepPurpleAccent.shade700,border: Border(bottom: BorderSide(width: 2))),

              ),
              ListTile(
                title: Center(child: const Text('Home')),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                },
              ),
              ListTile(
                title: Center(child: const Text('Add')),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Insert(),));
                },
              ),
              ListTile(
                title: Center(child: const Text('Logout')),
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
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
            child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0,
            ),
            color: Colors.purple[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          widget.data!['image'],
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10 , 10 , 0),
                      child: Text(
                        widget.data!['name'],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    SizedBox(width: 80,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.data!['address'],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                          Text(
                            widget.data!['number'].toString(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                  width: 300,
                  child: Divider(
                    color: Colors.blueGrey,
                    thickness: 2.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age : ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            widget.data!['age'].toString(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 32,
                                fontFamily: 'Pacifico'
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Expertise : ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            widget.data!['expertise'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 32,
                                fontFamily: 'Pacifico'
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Experience : ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            widget.data!['experience'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 32,
                                fontFamily: 'Pacifico'
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Qualification : ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            widget.data!['qualification'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 32,
                                fontFamily: 'Pacifico'
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Looking For : ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            widget.data!['looking'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 32,
                                fontFamily: 'Pacifico'
                            ),
                          ),
                        ],
                      ),
                      // ElevatedButton(onPressed: onPressed, child: child)
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
        // });
      ),
    );
  }
}
