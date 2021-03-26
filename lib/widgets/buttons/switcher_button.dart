import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ui_kit/color.dart';
import 'package:ui_kit/text.dart';

class SwitcherButton extends StatefulWidget {
  final List<String> labels;
  final Function(int) onSwitch;
  final bool showLabel;

  SwitcherButton({@required this.labels, this.onSwitch, this.showLabel = true});

  @override
  _SwitcherButtonState createState() => _SwitcherButtonState();
}

class _SwitcherButtonState extends State<SwitcherButton> {
  List<String> get labels => widget.labels;

  Function(int) get onSwitch => widget.onSwitch;

  String get currentLabel {
    if (labels.isEmpty) {
      _currentIndex = 0;
      return '';
    }
    if (_currentIndex >= labels.length) {
      _currentIndex = labels.length - 1;
    }
    return labels[_currentIndex];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
        // splashColor: AppColor.grey,
      ).copyWith(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          // if (states.contains(MaterialState.focused)) return Colors.red;
          // if (states.contains(MaterialState.hovered)) return Colors.green;
          if (states.contains(MaterialState.pressed)) AppColor.grey;
          return null; // Defer to the widget's default.
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      onPressed: _switch,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
      if (_currentIndex == labels.length - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex++;
      }

      if (onSwitch != null) {
        onSwitch(_currentIndex);
      }
    });
  }
}
