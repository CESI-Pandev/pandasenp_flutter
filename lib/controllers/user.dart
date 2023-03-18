import 'dart:async';

import 'package:directus/directus.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/user.dart';

class UserController {
  Future<List<User>> getAll() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    List<User> users;
    try {
       users = (await directus!.users.readMany()).data.map((e) => User.fromJson(e.toJson())).toList();
      // var usersJson = await directus!.items('directus_user').readMany();
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }
    return users;
  }
}
