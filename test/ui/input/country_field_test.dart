import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/ui/input/country_field.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  group('Country Text Field', () {
    BehaviorSubject<String> value;
    MaterialApp widget;

    setUp(() {
      value = BehaviorSubject<String>();
      widget = MaterialApp(
        home: Scaffold(
          body: StreamCountryTextField(
            value: value,
            onChanged: value.add,
            labelText: 'Field',
          ),
        ),
      );
    });

    tearDown(() {
      value.close();
    });

    testWidgets('chooses country', (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(StreamCountryTextField));
      await tester.pump();
      await tester.tap(find.text('Afghanistan'));
      await tester.pumpAndSettle();
      value.listen(expectAsync1((country) {
        expect(country, 'Afghanistan');
      }));
    });

    testWidgets('shows EU countries if onlyEUCountries is true',
        (WidgetTester tester) async {
      widget = MaterialApp(
        home: Scaffold(
          body: StreamCountryTextField(
            value: value,
            onChanged: value.add,
            labelText: 'Field',
            onlyEEACountries: true,
          ),
        ),
      );
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(StreamCountryTextField));
      await tester.pump();
      expect(find.text('Afghanistan'), findsNothing);
      await tester.tap(find.text('Austria'));
      await tester.pumpAndSettle();
      value.listen(expectAsync1((country) {
        expect(country, 'Austria');
      }));
    });

    testWidgets('hides strict jurisdiction countries',
        (WidgetTester tester) async {
      widget = MaterialApp(
        home: Scaffold(
          body: StreamCountryTextField(
            value: value,
            onChanged: value.add,
            labelText: 'Field',
            hideStrictJurisdictionCountries: true,
          ),
        ),
      );
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(StreamCountryTextField));
      await tester.pump();
      expect(find.text('United States'), findsNothing);
    });
  });
}
