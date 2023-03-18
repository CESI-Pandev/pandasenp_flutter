import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/user.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:pandasenp_flutter/widgets/user_tile.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  _UserListState createState() => _UserListState();
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class _UserListState extends State<UserList> {
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: userController.getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            !snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // final users =  directus?.items('user').readMany();
        final List<User> usersList = snapshot.data!;
        return ListView.builder(
          itemCount: usersList.length,
          itemBuilder: (context, index) {
            return UserTileWidget(user: usersList[index]);
          },
        );
      },
    );
  }
}