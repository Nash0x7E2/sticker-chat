import 'package:flutter/material.dart';
import 'package:sticker_chat/screens/mobile/message_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class DesktopLayout extends StatefulWidget {
  @override
  _DesktopLayoutState createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  Channel? selectedChannel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _DesktopChannelList(onChannelTap: (channel) {
          setState(() {
            selectedChannel = channel;
          });
        }),
        if (selectedChannel == null) _GettingStartedPlaceholder(),
        if (selectedChannel != null)
          _DesktopChatView(
            selectedChannel: selectedChannel!,
          )
      ],
    );
  }
}

class _DesktopChannelList extends StatelessWidget {
  const _DesktopChannelList({
    Key? key,
    required this.onChannelTap,
  }) : super(key: key);
  final ValueChanged<Channel> onChannelTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            height: 150.0,
            color: Colors.blueAccent.withOpacity(0.34),
            child: Center(
              child: Text(
                "Sticker Chat 😎",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ChannelsBloc(
              child: ChannelListView(
                onChannelTap: (channel, _) => onChannelTap(channel),
                filter:
                    Filter.in_('members', [StreamChat.of(context).user!.id]),
                sort: [SortOption('last_message_at')],
                pagination: PaginationParams(
                  limit: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopChatView extends StatelessWidget {
  const _DesktopChatView({Key? key, required this.selectedChannel})
      : super(key: key);
  final Channel selectedChannel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: StreamChannel(
        channel: selectedChannel,
        child: MessagePage(showBackButton: false),
      ),
    );
  }
}

class _GettingStartedPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.blueAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(rect),
                child: Icon(
                  Icons.chat,
                  size: 32.0,
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Select a chat to get the conversation going...',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
