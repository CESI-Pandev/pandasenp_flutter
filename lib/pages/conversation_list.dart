import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/auth.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:pandasenp_flutter/directus/directus.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Future<Widget> build(BuildContext context) async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    final users = await directus?.items('users').readMany();
    final List<User> usersList = [];
    users!.data.forEach((index, element) => usersList[index] = element)
    // final users = Provider.of<List<User>>(context);
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return UserTile(usersList[index]);
        });
  }
}

class UserTile extends StatelessWidget {
  final User user;

  UserTile(this.user);
  final AuthController auth = AuthController();
  @override
  Widget build(BuildContext context) {
    FutureBuilder<User>(
        future: auth.currentUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User currentUser = snapshot.data!;
            return GestureDetector(
              onTap: () {
                if (currentUser.id == user.id) return;
                Navigator.pushNamed(context, '/chat',
                    arguments: User(
                        id: user.id,
                        email: user.email,
                        firstName: user.firstName,
                        lastName: user.lastName,
                        status: user.status));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  margin: const EdgeInsets.only(
                      top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
                  child: ListTile(
                    title: Text(user.firstName),
                    subtitle: const Text('dernière envoi de la conversation'),
                  ),
                ),
              ),
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
