import 'dart:async';

import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/user.dart';

class UserController {
  Future<List<User>> getAll() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    var usersJson = await directus!.items('user').readMany();
    List<User> users = usersJson.data.map((userJson) => User.fromJson(userJson)).toList();

    return users;
  }
}