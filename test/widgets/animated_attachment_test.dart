import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sticker_chat/widgets/animated_attachment.dart';

import '../testing_utils.dart';

void main() {
  group(
    "Test Animated Attachment interactivity",
    () {
      testWidgets(
        "verify onTap returns sticker URL",
        (WidgetTester tester) async {
          const _mockPath = "assets/478-978-message-icon.riv";
          String? stickerUrl;

          var widget = makeWidgetTestable(
            AnimatedAttachment(
              sticker: _mockPath,
              onItemTap: (sticker) {
                stickerUrl = sticker;
              },
            ),
          );

          await tester.pumpWidget(widget);

          final finder = find.byWidget(widget);
          await tester.tap(finder);

          expect(stickerUrl, isNotNull);
          expect(stickerUrl, equals(_mockPath));
        },
      );
      testWidgets(
        "verify widget is not clickable when onTap is null",
        (WidgetTester tester) async {
          const _mockPath = "assets/478-978-message-icon.riv";

          var widget = makeWidgetTestable(
            AnimatedAttachment(
              sticker: _mockPath,
            ),
          );

          await tester.pumpWidget(widget);

          final finder = find.byType(InkWell);
          final InkWell attachmentInkWell = tester.widget(finder);

          expect(attachmentInkWell.onTap, isNull);
        },
      );
    },
  );
  group(
    "Test Animated Attachment layout",
    () {
      testWidgets(
        "verify widget border radius",
        (WidgetTester tester) async {
          const _mockPath = "assets/478-978-message-icon.riv";

          var widget = makeWidgetTestable(
            AnimatedAttachment(
              sticker: _mockPath,
            ),
          );

          await tester.pumpWidget(widget);

          final finder = find.byType(Material);
          final _widgetMaterial = (tester.widget(finder) as Material);

          expect(_widgetMaterial.shape, isA<RoundedRectangleBorder>());
          expect(
            (_widgetMaterial.shape as RoundedRectangleBorder).borderRadius,
            equals(BorderRadius.circular(12.0)),
          );
        },
      );
    },
  );
}
