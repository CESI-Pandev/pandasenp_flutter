import 'package:pandasenp_flutter/model/user.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as ui;
import 'package:uuid/uuid.dart';
import 'package:pandasenp_flutter/controllers/user.dart';

class Message {
  final User userCreated;
  final User recipient;
  final int? createdAt;
  final String id;
  final String? status;
  final int? updatedAt;
  final String? text;
  final String type = 'text';

  Message({
    required this.userCreated,
    this.createdAt,
    required this.id,
    required this.recipient,
    this.status,
    this.text,
    this.updatedAt,
  });

  static UserController userController = UserController();

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        userCreated = User.fromJson(json['user_created']),
        createdAt = json['createdAt'],
        recipient = User.fromJson(json['recipient']),
        status = json['status'],
        text = json['text'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_created': userCreated,
        'recipient': recipient,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'status': status,
        'text': text,
      };

  ui.TextMessage toTypeMessage() {
    return ui.TextMessage(
      id: const Uuid().v4(),
      author: ui.User(
        id: userCreated.id,
        firstName: userCreated.firstName,
        lastName: userCreated.lastName,
        imageUrl: userCreated.avatar,
      ),
      text: text ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
