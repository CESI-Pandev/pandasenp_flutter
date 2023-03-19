import 'package:pandasenp_flutter/model/user.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as ui;
import 'package:uuid/uuid.dart';
import 'package:pandasenp_flutter/controllers/user.dart';

class Message {
  final User author;
  final User recipient;
  final int? createdAt;
  final String id;
  final String? status;
  final int? updatedAt;
  final String? text;
  final String type = 'text';

  Message({
    required this.author,
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
        author =  userController.getJsonById(json['author']),
        createdAt = json['createdAt'],
        recipient = userController.getJsonById(json['recipient']),
        status = json['status'],
        text = json['text'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'recipient': recipient,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'status': status,
        'text': text,
      };

  ui.TextMessage toTypeMessage() {
    return ui.TextMessage(
      id: const Uuid().v4(),
      author: ui.User(
        id: author.id,
        firstName: author.firstName,
        lastName: author.lastName,
        imageUrl: author.avatar,
      ),
      text: text ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
