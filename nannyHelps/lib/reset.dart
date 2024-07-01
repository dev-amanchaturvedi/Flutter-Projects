import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFE5E2EB),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontFamily: 'YoungSerif',
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7E57C2),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                prefixIcon: Icon(Icons.mail_outline, color: Colors.deepPurpleAccent,),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white, // Set text color to white
                shadowColor: Colors.deepPurpleAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(150, 50),
              ),
              onPressed: () async {
                try {
                  await auth.sendPasswordResetEmail(email: emailcontroller.text);
                  Navigator.of(context).pop();
                  child:
                  const Text(
                    "Send Request",
                    style: TextStyle(color: Colors.white),
                  );
                  // Password reset email sent successfully
                } catch (e) {
                  print("Error sending password reset email: $e");
                }
              },
              child: const Text(
                "Send Request",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
