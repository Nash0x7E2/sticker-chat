import 'package:flutter/material.dart';
import 'package:sticker_chat/screens/mobile/channel_page.dart';
import 'package:sticker_chat/screens/desktop/desktop_layout.dart';
import 'package:sticker_chat/widgets/widgets.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StickerChat extends StatelessWidget {
  const StickerChat({Key? key, required this.client}) : super(key: key);
  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticker Chat 😎',
      builder: (context, widget) {
        return StreamChat(
          child: widget!,
          client: client,
        );
      },
      home: ResponsiveBuilder(
        smallScreen: (context) => ChannelListPage(),
        largeScreen: (context) => Material(child: DesktopLayout()),
      ),
    );
  }
}
