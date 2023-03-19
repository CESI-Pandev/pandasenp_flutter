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
    List<Message> messages;
    try {
      messages = (await directus!.items('message').readMany(
              // filter: Filters({'id': Filter.isIn(['1', '2'])})
              ))
          .data
          .map((e) => Message.fromJson(toJson(e)))
          .toList();
      // var messagesJson = await directus!.items('directus_message').readMany();
    } on DirectusError catch (e) {
      throw Exception(e.message);
    }
    return messages;
  }

  Map<String, dynamic> toJson(instance) {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    
    writeNotNull('id', instance['id']);
    writeNotNull('author', instance['author']);
    writeNotNull('recipient', instance['recipient']);
    writeNotNull('createdAt', instance['createdAt']);
    writeNotNull('updatedAt', instance['updatedAt']);
    writeNotNull('status', instance['status']);
    writeNotNull('text', instance['text']);
    return val;
  }
}
