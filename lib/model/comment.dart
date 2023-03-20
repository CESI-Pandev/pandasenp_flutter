import 'package:pandasenp_flutter/model/status.dart';
import 'package:pandasenp_flutter/model/user.dart';

class Comment {
  final int id;
  final Status status;
  final String content;
  final User userCreated;
  final User userUpdated;
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final int ressource;

  Comment({
    required this.id,
    required this.status,
    required this.content,
    required this.userCreated,
    required this.userUpdated,
    required this.dateCreated,
    required this.dateUpdated,
    required this.ressource,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      status: statusFromString[json['status']]!,
      content: json['content'],
      userCreated: User.fromJson(json['user_created']),
      userUpdated: User.fromJson(json['user_updated']),
      dateCreated: DateTime.parse(json['date_created']),
      dateUpdated: DateTime.parse(json['date_updated']),
      ressource: json['ressource'],
    );
  }
}