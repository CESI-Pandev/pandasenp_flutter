import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:pandasenp_flutter/view/pages/chat.dart';

class ChatTileWidget extends StatelessWidget {
  const ChatTileWidget({required this.user, super.key});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.7),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                recipient: user,
              ),
            ),
          );
        },
        title: Text(
          user.identifier,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: const Text(
          "dernière envoi de la conversation",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
