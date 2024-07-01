import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nannyhelps/home.dart';
import 'package:nannyhelps/loginScreen.dart';
import 'package:nannyhelps/lookingFor.dart';
import 'package:nannyhelps/profile.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF7E57C2),
      onTap: (int index) {
        setState(() {
          selectedIndex = index;
        });

        switch (selectedIndex) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Profile(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LookingFor(),
              ),
            );
            break;
          case 3:
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            });
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: selectedIndex == 0 ? Colors.white : Colors.yellow,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: selectedIndex == 1 ? Colors.white : Colors.yellow,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: selectedIndex == 2 ? Colors.white : Colors.yellow,
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.logout_outlined,
            color: selectedIndex == 3 ? Colors.white : Colors.yellow,
          ),
          label: 'Logout',
        ),
      ],
    );
  }
}


