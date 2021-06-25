import 'package:flutter/material.dart';
import 'package:sticker_chat/models/models.dart';
import 'package:sticker_chat/utils/extensions.dart';

import 'animated_attachment.dart';

class ChatStickerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 40.0 : 400.0,
        vertical:context.isMobile ? 80.0 : 150.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                ),
                itemCount: kAssets.length,
                itemBuilder: (context, index) {
                  return AnimatedAttachment(
                    sticker: kAssets[index].assetPath,
                    onItemTap: (item) {
                      Navigator.of(context).pop(item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
