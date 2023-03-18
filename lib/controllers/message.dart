import 'dart:async';

import 'package:directus/directus.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/message.dart';

class UserController {
  Future<List<Message>> getMessageByUser() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    List<Message> messages;
    try {
       messages = (await directus!.items('users').readMany(
      filter: Filters({'id': Filter.isIn(['1', '2'])})
    )).data.map((e) => message.fromJson(e.toJson())).toList();
      // var messagesJson = await directus!.items('directus_message').readMany();
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }
    return messages;
  }
}
