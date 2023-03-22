import 'package:pandasenp_flutter/controllers/auth.dart';
import 'package:pandasenp_flutter/controllers/message.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:pandasenp_flutter/view/widgets/app_base.dart';
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  final User recipient;
  const ChatPage({super.key, required this.recipient});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  AuthController auth = AuthController();
  MessageController messageController = MessageController();

  @override
  void initState() {
    super.initState();
    _getMessages().then((value) {
      setState(() {
        messages = value;
      });
    });
  }

  List<types.Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: "Chating with ${widget.recipient.firstName}",
      index: chatIndex,
      body: FutureBuilder(
        future: auth.currentUser,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          User currentUser = snapshot.data!;

          final chatCurrentUser = types.User(
            id: currentUser.id,
          );

          return Chat(
            messages: messages,

            onSendPressed: (types.PartialText message) {
              messages = _handleSendPressed(message, chatCurrentUser, messages);
              messageController
                  .sendMessage(
                sender: currentUser,
                recipient: widget.recipient,
                message: message.text,
              )
                  .then((_) {
                _getMessages().then((values) {
                  setState(() {
                    messages = values;
                  });
                });
              });
            },
            showUserAvatars: false, //TODO
            showUserNames: true,
            user: chatCurrentUser,
          );
        },
      ),
    );
  }

  List<types.Message> _addMessage(
      types.Message message, List<types.Message> messages) {
    messages.insert(0, message);
    return messages;
  }

  List<types.Message> _handleSendPressed(types.PartialText message,
      types.User user, List<types.Message> messages) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    return _addMessage(textMessage, messages);
  }

  Future<List<types.Message>> _getMessages() async {
    if (!auth.isLoggedIn) {
      throw Exception("User not logged in");
    }
    final messages = await messageController.getMessageByConversation(
      sender: await auth.currentUser!,
      recipient: widget.recipient,
    );
    List<types.Message> typedMessages =
        messages.map<types.Message>((e) => e.toTypeMessage()).toList();
    return typedMessages;
  }
}
