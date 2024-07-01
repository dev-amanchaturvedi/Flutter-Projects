import 'package:flutter/material.dart';
import 'package:nannyhelps/loginScreen.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E2EB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Now a day\'s everyone is busy in their world.',
                  style: TextStyle(
                    fontFamily: 'YoungSerif',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7E57C2),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'The most affected persons from this are parents, because they do get to look for their child.',
                  style: TextStyle(
                    fontFamily: 'YoungSerif',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7E57C2),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset('images/StressedParents.jpg', width: 200),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7E57C2),
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Page2(),
          ),
        ),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E2EB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/happyparent.jpg', width: 200),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Nannies provide parents with more free time to spend with their children.',
                  style: TextStyle(
                    fontFamily: 'YoungSerif',
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7E57C2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7E57C2),
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
    );
  }
}
