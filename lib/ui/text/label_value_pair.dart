import 'package:flutter/material.dart';

import 'copy_to_clipboard.dart';
import 'label_text.dart';

class LabelValuePair extends StatelessWidget {
  final String labelText;
  final String valueText;
  final Widget value;
  final ValueLabelTextAlign textAlign;
  final bool copyToClipboardEnabled;
  final EdgeInsets padding;

  const LabelValuePair({
    @required this.labelText,
    this.valueText,
    this.copyToClipboardEnabled = false,
    this.textAlign,
    this.value,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: _isCenterAligned(textAlign)
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              LabelText(labelText.toUpperCase()),
              _buildBody(context, value, valueText, padding: padding),
            ],
          ),
        ),
      ],
    );
  }

  bool _isCenterAligned(ValueLabelTextAlign textAlign) {
    return textAlign != null && textAlign == ValueLabelTextAlign.center;
  }

  Widget _buildBody(BuildContext context, Widget value, String data, {EdgeInsets padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: _isCenterAligned(textAlign)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Flexible(child: value != null ? value : Text(data)),
          _buildCopyToClipboardIcon(context, data),
        ],
      ),
    );
  }

  Widget _buildCopyToClipboardIcon(BuildContext context, String value) {
    if (!copyToClipboardEnabled) {
      return Container();
    }
    return CopyToClipboard(value: value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LabelValuePair &&
              runtimeType == other.runtimeType &&
              labelText == other.labelText &&
              valueText == other.valueText &&
              value == other.value &&
              textAlign == other.textAlign &&
              copyToClipboardEnabled == other.copyToClipboardEnabled &&
              padding == other.padding;

  @override
  int get hashCode =>
      labelText.hashCode ^
      valueText.hashCode ^
      value.hashCode ^
      textAlign.hashCode ^
      copyToClipboardEnabled.hashCode ^
      padding.hashCode;



}

enum ValueLabelTextAlign { center, left }

