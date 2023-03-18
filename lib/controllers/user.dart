import 'dart:async';

import 'package:directus/directus.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/user.dart';

class UserController {
  Future<List<User>> getAll() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    List<User>? users;
    try {
      users = (await directus!.users.readMany()).data.map((user) => User.fromJson(user.toJson())).toList();
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }

    return users;
  }
}