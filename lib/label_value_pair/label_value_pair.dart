import 'package:flutter/material.dart';

import 'copy_to_clipboard.dart';
import 'label_text.dart';

class LabelValuePair extends StatelessWidget {
  final String labelText;
  final String valueText;
  final Widget? value;
  final ValueLabelTextAlign textAlign;
  final bool copyToClipboardEnabled;
  final EdgeInsets padding;

  const LabelValuePair(
      {required this.labelText,
      this.valueText = '',
      this.copyToClipboardEnabled = false,
      this.textAlign = ValueLabelTextAlign.left,
      this.value,
      this.padding = const EdgeInsets.only(bottom: 16.0)});

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
              LabelText(labelText),
              _buildBody(context, value, valueText, padding: padding),
            ],
          ),
        ),
      ],
    );
  }

  bool _isCenterAligned(ValueLabelTextAlign textAlign) {
    return  textAlign == ValueLabelTextAlign.center;
  }

  Widget _buildBody(BuildContext context, Widget? value, String data,
      {required EdgeInsets padding}) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: _isCenterAligned(textAlign)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: value ??
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Circular',
                    color: Colors.black,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
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
}

enum ValueLabelTextAlign { center, left }
