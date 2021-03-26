import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/custom_label_value_field.dart';

class CustomLabelValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const LabelValueEditableField(
        labelText: 'First Name',
        valueText: 'John',
        editable: true,
      ),
    );
  }
}
