import 'package:flutter/material.dart';
import 'package:sticker_chat/app/app.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  const STREAM_KEY = String.fromEnvironment('api');
  const USER_TOKEN = String.fromEnvironment('token');

  final client = StreamChatClient(
    STREAM_KEY,
    logLevel: Level.OFF,
  );

  await client.connectUser(
    User(
      id: 'neevash',
      extraData: {
        'image':
            'https://local.getstream.io:9000/random_png/?id=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGVsaWNhdGUtZmlyZS02In0.Yfdnsfkt48g1xv3I77mBjlVISnLwMyVUFobBynTf6Jc&amp;name=nash',
      },
    ),
    USER_TOKEN,
  );

  runApp(StickerChat(client: client));
}
