import 'dart:async' show Future;

import 'package:directus/directus.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/message.dart';
import 'package:pandasenp_flutter/model/user.dart';

class MessageController {
  Future<List<Message>> getMessageByConversation(
      {required User sender, required User recipient}) async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    List<Map<String, dynamic>> messagesJson;
    try {
      messagesJson = await directus!
          .items('message')
          .readMany(
            filters: Filters({
              'user_created': Filter.isIn([sender.id, recipient.id]),
            }),
          )
          .then((value) => value.data);
      messagesJson = await Future.wait(
        messagesJson.map(
          (messagesJson) async {
            messagesJson['user_created'] = await directus!.users
                .readOne(
                  messagesJson['user_created'],
                )
                .then(
                  (value) => value.data.toJson(),
                );
            messagesJson['recipient'] = await directus!.users
                .readOne(
                  messagesJson['recipient'],
                )
                .then(
                  (value) => value.data.toJson(),
                );
            return messagesJson;
          },
        ),
      );
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }
    return messagesJson.map((e) => Message.fromJson(toJson(e))).toList();
  }

  Future<void> sendMessage({
    required User sender,
    required User recipient,
    required String message,
  }) async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    try {
      await directus!.items('message').createOne({
        'user_created': sender.id,
        'recipient': recipient.id,
        'text': message,
      });
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }
  }

  Map<String, dynamic> toJson(instance) {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', instance['id']);
    writeNotNull('user_created', instance['user_created']);
    writeNotNull('recipient', instance['recipient']);
    writeNotNull('createdAt', instance['createdAt']);
    writeNotNull('updatedAt', instance['updatedAt']);
    writeNotNull('status', instance['status']);
    writeNotNull('text', instance['text']);
    return val;
  }
}
