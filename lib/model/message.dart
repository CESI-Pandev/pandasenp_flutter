import 'package:pandasenp_flutter/model/user.dart';

class Message {
  final User author;
  final User recipient;
  final int? createdAt;
  final String id;
  final String? status;
  final int? updatedAt;
  final String? text;
  final String  type = 'text';

  const Message({
    required this.author,
    this.createdAt,
    required this.id,
    required this.recipient,
    this.status,
    this.text,
    this.updatedAt,
  });
}
