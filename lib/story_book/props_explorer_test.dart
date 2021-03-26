import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/test_utils/wrap_in_material_app.dart';

import 'props_explorer.dart';

void main() {
  group('PropsExplorer', () {
    testWidgets('renders form and widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(PropsExplorer(
        initialProps: const <String, dynamic>{},
        formBuilder: (context, props, updateProp) => const Text('Form Builder'),
        widgetBuilder: (context, props) => const Text('Widget Builder'),
      )));
      expect(find.text('Form Builder'), findsOneWidget);
      expect(find.text('Widget Builder'), findsOneWidget);
    });

    testWidgets('renders widget with initialProps',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(PropsExplorer(
        initialProps: const <String, dynamic>{'text': 'Initial Prop'},
        formBuilder: (context, props, updateProp) => const Text('Form Builder'),
        widgetBuilder: (context, props) => Text(props['text']),
      )));
      expect(find.text('Form Builder'), findsOneWidget);
      expect(find.text('Initial Prop'), findsOneWidget);
    });

    testWidgets('updateProp updates widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(PropsExplorer(
        initialProps: const <String, dynamic>{},
        formBuilder: (context, props, updateProp) => TextField(
          onChanged: (String value) {
            updateProp('test', value);
          },
        ),
        widgetBuilder: (context, props) => Text('test: ${props['test']}'),
      )));
      await tester.enterText(find.byType(TextField), 'hello world');
      await tester.pump();
      expect(find.text('test: hello world'), findsOneWidget);
    });
  });
}
