import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/auth.dart';
import 'package:pandasenp_flutter/model/user.dart';

class UserTileWidget extends StatelessWidget {
  UserTileWidget({required this.user, super.key});
  final User user;
  final AuthController auth = AuthController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData) {
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
            Navigator.pushNamed(
              context,
              '/chat',
              arguments: User(
                id: user.id,
                email: user.email,
                firstName: user.firstName,
                lastName: user.lastName,
                status: user.status,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              margin: const EdgeInsets.only(
                  top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
              child: ListTile(
                title: Text(user.firstName),
                subtitle: const Text("dernière envoi de la conversation"),
              ),
            ),
          ),
        );
      },
      future: auth.currentUser,
    );
  }
}
