import 'package:pandasenp_flutter/model/category.dart';
import 'package:pandasenp_flutter/model/comment.dart';
import 'package:pandasenp_flutter/model/ressource_type.dart';
import 'package:pandasenp_flutter/model/status.dart';
import 'package:pandasenp_flutter/model/user.dart';

class Ressource {
  final int id;
  final Status status;
  final User userCreated;
  final User userUpdated;
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final RessourceType type;
  final Category category;
  final String title;
  final String content;
  final List<Comment> comments;

  Ressource({
    required this.id,
    required this.status,
    required this.userCreated,
    required this.userUpdated,
    required this.dateCreated,
    required this.dateUpdated,
    required this.type,
    required this.category,
    required this.title,
    required this.content,
    this.comments = const [],
  });

  factory Ressource.fromJson(Map<String, dynamic> json) {
    return Ressource(
      id: json['id'],
      status: statusFromString[json['status']]!,
      userCreated: User.fromJson(json['user_created']),
      userUpdated: User.fromJson(json['user_updated']),
      dateCreated: DateTime.parse(json['date_created']),
      dateUpdated: DateTime.parse(json['date_updated']??json['date_created']),
      type: RessourceType.fromJson(json['type']),
      category: Category.fromJson(json['category']),
      title: json['title'],
      content: json['content'],
      comments: json['comments'] != null
        ? (json['comments'] as List).map<Comment>((comment) => Comment.fromJson(comment)).toList()
        : [],
    );
  }
}