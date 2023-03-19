import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/view/pages/profile.dart';
import 'package:pandasenp_flutter/view/pages/ressource_list.dart';
import 'package:pandasenp_flutter/pages/conversation_list.dart';

class AppBase extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? floatingActionButton;
  const AppBase({
    super.key,
    required this.body,
    required this.title,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, int> pageIndexes = {
      "Ressources": 0,
      "Chat": 1,
      "Profile": 2,
    };
    
    return Scaffold(
      floatingActionButton: floatingActionButton,
      backgroundColor: const Color(0xFFEDECF2),

      appBar: AppBar(
        title: Text("Pandasenp - $title"),
        backgroundColor: Colors.black.withOpacity(0.7),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndexes[title] ?? 0,
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
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RessourceListPage(),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserList(),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
