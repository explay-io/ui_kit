import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ui_kit/buttons/button_common.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/text.dart';

class SwitcherButton extends StatefulWidget {
  static void defaultOnSwitch(int index) {}

  final List<String> labels;
  final Function(int) onSwitch;
  final bool showLabel;

  SwitcherButton({
    this.labels = const [],
    this.onSwitch = defaultOnSwitch,
    this.showLabel = true,
 });

  @override
  _SwitcherButtonState createState() => _SwitcherButtonState();
}

class _SwitcherButtonState extends State<SwitcherButton> {
  List<String> get labels => widget.labels;

  Function(int) get onSwitch => widget.onSwitch;

  String get currentLabel {
    if (labels.isEmpty) return '';
    if (_currentIndex >= labels.length) return labels.last;

    return labels[_currentIndex];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ).copyWith(
        overlayColor: stateColor(pressed: AppColor.grey, disabled: null),
        shape: ButtonStyleConstants.rounded,
      ),
      onPressed: _switch,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesome.exchange),
          const SizedBox(height: 8),
          widget.showLabel
              ? Text(currentLabel, style: AppText.body3)
              : Container(),
        ],
      ),
    );
  }

  void _switch() {
    setState(() {
      _currentIndex = _currentIndex >= labels.length - 1 ? 0 : _currentIndex + 1;
      onSwitch(_currentIndex);
    });
  }
}
