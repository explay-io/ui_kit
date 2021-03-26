import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/cards/news_card.dart';

import '../test_utils/wrap_in_material_app.dart';

void main() {
  group('News card create test', () {
    testWidgets('renders news card widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(const NewsCard(
          title:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          source: 'Lorem')));
      expect(find.byType(NewsCard), findsOneWidget);
      expect(find.text('Lorem'), findsOneWidget);
      expect(
          find.text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
          findsOneWidget);
    });
  });
}
