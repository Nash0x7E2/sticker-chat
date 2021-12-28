import 'package:flutter/material.dart';
import 'package:sticker_chat/screens/mobile/message_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticker Chat 😎'),
      ),
      body: ChannelsBloc(
        child: ChannelListView(
          filter:
              Filter.in_('members', [StreamChat.of(context).currentUser!.id]),
          sort: [SortOption('last_message_at')],
          limit: 30,
          channelWidget: Builder(builder: (context) => MessagePage()),
        ),
      ),
    );
  }
}
