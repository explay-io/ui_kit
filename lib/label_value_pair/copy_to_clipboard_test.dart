import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/test_utils/test_method_channel.dart';

import 'copy_to_clipboard.dart';

void main() {
  group('Copy To Clipboard', () {
    testWidgets('renders icon', (tester) async {
      await tester.pumpWidget(const Directionality(
          textDirection: TextDirection.ltr,
          child: CopyToClipboard(value: '123456')));
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('copies on tap', (tester) async {
      setUpTestMethodChannel('flutter/platform', const JSONMethodCodec());
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: CopyToClipboard(value: '123456')),
      ));
      await tester.tap(find.byType(Icon));
      expectMethodCall('Clipboard.setData', (arguments: <String, dynamic>{
        'text': '123456',
      }) as Map<String, Object>?);
    });
  });
}
