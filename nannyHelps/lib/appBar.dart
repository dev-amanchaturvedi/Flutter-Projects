import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
