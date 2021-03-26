import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/text/label_text.dart';

import '../color.dart';

class LabelValueEditableField extends StatelessWidget {
  final String labelText;
  final String valueText;
  final Widget value;
  final ValueLabelTextAlign textAlign;
  final bool editable;
  final EdgeInsets padding;
  final String route;
  final Object arguments;

  const LabelValueEditableField(
      {@required this.labelText,
      this.valueText,
      this.editable = false,
      this.textAlign,
      this.value,
      this.padding,
      this.route,
      this.arguments});

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
    return textAlign != null && textAlign == ValueLabelTextAlign.center;
  }

  Widget _buildBody(BuildContext context, Widget value, String data,
      {EdgeInsets padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: _isCenterAligned(textAlign)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Flexible(
              child: value ??
                  Text(data,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Circular',
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold))),
          _buildRoutingIcon(context, data),
        ],
      ),
    );
  }

  Widget _buildRoutingIcon(BuildContext context, String value) {
    if (!editable) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: GestureDetector(
        onTap: () {
          if (arguments != null) {
            Navigator.pushNamed(context, route, arguments: arguments);
          } else {
            Navigator.pushNamed(context, route);
          }
        },
        child: IconTheme(
            data: IconTheme.of(context).copyWith(color: AppColor.blue),
            child: const Icon(
              Icons.create,
              size: 20.0,
            )),
      ),
    );
  }
}

enum ValueLabelTextAlign { center, left }
