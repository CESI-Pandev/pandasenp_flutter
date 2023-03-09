import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
      body: const Text(
        "Voici la home page !!"
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black.withOpacity(0.9),
        unselectedItemColor: Colors.grey,
        iconSize: 20,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.publish_rounded),
              label: 'Publish',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'chat',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
          ),
        ],
      ),
    );
  }

}