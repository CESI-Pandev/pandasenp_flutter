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
      users = (await directus!.users.readMany())
          .data
          .map((user) => User.fromJson(user.toJson()))
          .toList();
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }

    return users;
  }

  Future<User> getOneById(id) async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    User user;
    try {
      var directusUser = (await directus!.users.readOne(id)).data;
      user = User.fromJson(directusUser.toJson());
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }

    return user;
  }

   getJsonById(id) {
    final user = getOneById(id);
    user.then((e) => e.toJson());
    return user ;
  }

  dynamic directusToJson(DirectusUser instance) {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', instance.id);
    writeNotNull('first_name', instance.firstName);
    writeNotNull('last_name', instance.lastName);
    writeNotNull('email', instance.email);
    writeNotNull('password', instance.password);
    writeNotNull('location', instance.location);
    writeNotNull('title', instance.title);
    writeNotNull('description', instance.description);
    writeNotNull('tags', instance.tags);
    writeNotNull('avatar', instance.avatar);
    writeNotNull('language', instance.language);
    writeNotNull('theme', instance.theme);
    writeNotNull('status', instance.status);
    writeNotNull('role', instance.role);
    return val;
  }
}
