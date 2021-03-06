import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/inputs/custom_checkbox.dart';
import 'package:mockito/mockito.dart';

import '../test_utils/wrap_in_material_app.dart';

class OnCheckboxChangedMock extends Mock implements Function {
  // ignore: avoid_positional_boolean_parameters
  void call(bool value) {
    // ignore: invalid_use_of_visible_for_testing_member
    return super.noSuchMethod(Invocation.method(#call, []));
  }
}

void main() {
  group('Checkboxes', () {
    testWidgets('renders simple checkbox widget', (WidgetTester tester) async {
      await tester.pumpWidget(wrapInMaterialApp(CustomCheckbox(
        isChecked: true,
        label: const Text('Sample Checkbox'),
        errorText: 'Error message',
        onChanged: (checked) {},
      )));

      expect(find.text('Sample Checkbox'), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
      expect(find.byIcon(MaterialIcons.check_box), findsOneWidget);
    });
  });

  testWidgets('calls onChanged with new value', (WidgetTester tester) async {
    final onCheckboxChanged = OnCheckboxChangedMock().call;

    await tester.pumpWidget(wrapInMaterialApp(CustomCheckbox(
      isChecked: true,
      label: const Text('Sample Checkbox'),
      errorText: 'Error message',
      onChanged: onCheckboxChanged,
    )));

    await tester.tap(find.text('Sample Checkbox'));
    await tester.pump();
    verify(onCheckboxChanged(false)).called(1);
  });
}
