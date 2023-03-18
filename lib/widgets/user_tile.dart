import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/auth.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:pandasenp_flutter/pages/chat_screen.dart';

class UserTileWidget extends StatelessWidget {
  UserTileWidget({required this.user, super.key});
  final User user;
  final AuthController auth = AuthController();
  final anonyme = 'Anonyme';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: auth.currentUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            !snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }
        User currentUser = snapshot.data!;
        return GestureDetector(
          onTap: () {
            if (currentUser.id == user.id) return;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  user: user,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              color: Colors.blue,
              margin: const EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
              child: ListTile(
                title: Text(
                    user.firstName ?? user.email ?? anonyme),
                subtitle: const Text("dernière envoi de la conversation"),
              ),
            ),
          ),
        );
      },
    );
  }
}
