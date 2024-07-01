import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nannyhelps/bottomNavigationBar.dart';

class Detail extends StatefulWidget {
  Detail({Key? key, this.data}) : super(key: key);

  QueryDocumentSnapshot<Map<String, dynamic>>? data;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future<void> deleteDocument() async {
    try {
      await FirebaseFirestore.instance
          .collection("nanny_data")
          .doc(widget
              .data!.id) // Use the document ID of the data you want to delete
          .delete();
      // Navigate back to the previous screen after successful deletion
      Navigator.of(context).pop();
    } catch (e) {
      // Handle any errors that occur during deletion
      print("Error deleting document: $e");
    }
  }

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
      body: SingleChildScrollView(
        child: SafeArea(
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
                          widget.data!['image'],
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            widget.data!['first name'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'YoungSerif',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            widget.data!['last name'],
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.data!['age'].toString(),
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.data!['gender'],
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.data!['education'],
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.data!['experience'],
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.data!['address'],
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.data!['number'].toString(),
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              widget.data!['email'],
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              '${widget.data!['price']}/-',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 32,
                                  fontFamily: 'Unna'),
                            ),
                          ],
                        ),
                      ),
                      // ElevatedButton(onPressed: onPressed, child: child)
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
