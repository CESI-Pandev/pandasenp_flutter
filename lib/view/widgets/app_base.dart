import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/view/pages/conversation_list.dart';
import 'package:pandasenp_flutter/view/pages/profile.dart';
import 'package:pandasenp_flutter/view/pages/ressource_list.dart';

const ressourceListIndex = 0;
const chatIndex = 1;
const profileIndex = 2;

class AppBase extends StatelessWidget {
  final Widget body;
  final String title;
  final int index;
  final Widget? floatingActionButton;
  const AppBase({
    super.key,
    required this.body,
    required this.title,
    required this.index,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
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
        currentIndex: index,
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
            case ressourceListIndex:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RessourceListPage(),
                ),
              );
              break;
            case chatIndex:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConversationListPage(),
                ),
              );
              break;
            case profileIndex:
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
