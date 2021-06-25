import 'package:flutter/material.dart';
import 'package:sticker_chat/widgets/widgets.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({
    Key? key,
    this.showBackButton = true,
  }) : super(key: key);

  final bool showBackButton;

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  GlobalKey<MessageInputState> _messageInputKey = GlobalKey();

  Future<void> _showStickerModal() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ChatStickerDialog(),
    );
    _addAttachment(result);
  }

  void _addAttachment(String? selectedSticker) {
    if (selectedSticker != null) {
      _messageInputKey.currentState?.addAttachment(
        Attachment(
          type: 'animated.sticker',
          uploadState: UploadState.success(),
          extraData: {
            'sticker_url': selectedSticker,
          },
        ),
      );
    }
  }

  Widget _buildAnimatedMessage(
    BuildContext context,
    Message details,
    List<Attachment> _,
  ) {
    final url = details.attachments.first.extraData['sticker_url'] as String;
    return SizedBox(
      height: 250.0,
      width: 250.0,
      child: AnimatedAttachment(
        sticker: url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChannelHeader(
        showBackButton: widget.showBackButton,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              customAttachmentBuilders: {
                'animated.sticker': _buildAnimatedMessage,
              },
            ),
          ),
          MessageInput(
            key: _messageInputKey,
            attachmentThumbnailBuilders: {
              'animated.sticker': (context, attachment) => AnimatedAttachment(
                    sticker: attachment.extraData['sticker_url'] as String,
                  ),
            },
            actions: [
              IconButton(
                onPressed: _showStickerModal,
                icon: Icon(Icons.add_box_rounded),
              )
            ],
          ),
        ],
      ),
    );
  }
}
