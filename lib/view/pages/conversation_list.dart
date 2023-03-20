import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/user.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:pandasenp_flutter/view/widgets/app_base.dart';
import 'package:pandasenp_flutter/view/widgets/user_tile.dart';

class ConversationListPage extends StatefulWidget {
  const ConversationListPage({super.key});

  @override
  State<ConversationListPage> createState() => _ConversationListPageState();
}

class _ConversationListPageState extends State<ConversationListPage> {
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: "Chat",
      index: chatIndex,
      body: FutureBuilder<List<User>>(
        future: userController.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) throw Exception(snapshot.error);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          final List<User> users = snapshot.data!;
          return  ListView.builder( 
            itemCount: users.length,
            itemBuilder: (context, index) {
              return UserTileWidget(user: users[index]);
            },
          );
        },
      ),
    );
  }
}