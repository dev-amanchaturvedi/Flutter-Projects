import 'package:flutter/material.dart';
import 'package:nannyhelps/editProfile.dart';
import 'package:nannyhelps/userDetail.dart';

class LookingFor extends StatefulWidget {
  const LookingFor({Key? key}) : super(key: key);

  @override
  State<LookingFor> createState() => _LookingForState();
}

class _LookingForState extends State<LookingFor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E2EB),
      body: AlertDialog(
        title: const Text("Looking For"),
        content: const Text("What do you want to do?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Apply for nanny"),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserDetail()));
            },
          ),
          TextButton(
            child: const Text("Edit Profile"),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EditProfile()));
            },
          ),
        ],
      ),
    );
  }
}
