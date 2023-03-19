import 'package:pandasenp_flutter/model/user.dart';

class Message {
  final User author;
  final User recipient;
  final int? createdAt;
  final String id;
  final String? status;
  final int? updatedAt;
  final String? text;
  final String type = 'text';

  const Message({
    required this.author,
    this.createdAt,
    required this.id,
    required this.recipient,
    this.status,
    this.text,
    this.updatedAt,
  });

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        author = json['author'],
        createdAt = json['createdAt'],
        recipient = json['recipient'],
        status = json['status'],
        text = json['text'],
        updatedAt = json['updatedAt'];
  // != null ? DateTime.parse(json['last_access']) : DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'recipient': recipient,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'status': status,
        'text': text,
      };
}
