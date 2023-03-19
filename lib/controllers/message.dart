import 'dart:async' show Future;

import 'package:directus/directus.dart';
import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/message.dart';

class MessageController {
  Future<List<Message>> getMessageByUser() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    List<Map<String, dynamic>> messagesJson;
    try {
      messagesJson = await Future.wait(
        (await directus!.items('message').readMany()).data.map(
          (messagesJson) async {
            messagesJson['user_created'] =
                (await directus!.users.readOne(messagesJson['user_created']))
                    .data
                    .toJson();
            messagesJson['recipient'] =
                (await directus!.users.readOne(messagesJson['recipient']))
                    .data
                    .toJson();
            return messagesJson;
          },
        ),
      );
      // messages = (await directus!.items('message').readMany(
      //         // filter: Filters({'id': Filter.isIn(['1', '2'])})
      //         ))
      //     .data
      //     ;
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }
    return messagesJson.map((e) => Message.fromJson(toJson(e))).toList();
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
