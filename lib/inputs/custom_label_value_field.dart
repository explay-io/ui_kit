import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/app_color.dart';
import '../label_value_pair/label_text.dart';

class LabelValueEditableField extends StatelessWidget {
  final String labelText;
  final String valueText;
  final Widget? value;
  final ValueLabelTextAlign textAlign;
  final bool editable;
  final EdgeInsets padding;
  final String route;
  final Object? arguments;

  const LabelValueEditableField(
      {required this.labelText,
      this.valueText = '',
      this.editable = false,
      this.textAlign = ValueLabelTextAlign.left,
      this.value,
      this.padding = const EdgeInsets.only(bottom: 16.0),
      required this.route,
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
    return textAlign == ValueLabelTextAlign.center;
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
                  Text(data,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Circular',
                          color: Colors.black,
                          height: 1.5,
                          fontWeight: FontWeight.bold))),
          _buildRoutingIcon(context),
        ],
      ),
    );
  }

  Widget _buildRoutingIcon(BuildContext context) {
    if (!editable) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route, arguments: arguments);
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
