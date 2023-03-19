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

}