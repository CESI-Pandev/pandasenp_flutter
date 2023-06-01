import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/auth.dart';
import 'package:pandasenp_flutter/controllers/user.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:pandasenp_flutter/view/widgets/app_base.dart';
import 'package:pandasenp_flutter/view/widgets/chat_tile.dart';

const String kConversationListPageRoute = '/conversation_list';
const String kConversationListPageTitle = 'Chat';

class ConversationListPage extends StatefulWidget {
  const ConversationListPage({super.key});

  @override
  State<ConversationListPage> createState() => _ConversationListPageState();
}

class _ConversationListPageState extends State<ConversationListPage> {
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    final AuthController auth = AuthController();
    return AppBase(
      title: kConversationListPageTitle,
      index: kChatIndex,
      body: FutureBuilder<User>(
          future: auth.currentUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) throw Exception(snapshot.error);

            final User currentUser = snapshot.data!;

            return FutureBuilder<List<User>>(
              future: userController.getAll(),
              builder: (context, snapshot) {
                if (snapshot.hasError) throw Exception(snapshot.error);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final List<User> users = snapshot.data!
                    .where((element) => element.id != currentUser.id)
                    .toList();
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: index == users.length - 1 ? 16 : 0,
                        right: 16,
                        left: 16,
                      ),
                      child: ChatTileWidget(user: users[index]),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
