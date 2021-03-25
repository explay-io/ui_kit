import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ui_kit/widgets/custom_radio/radio_model.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  const RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14.00),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 24.0,
            width: 24.0,
            child: _radio(
              _item.isSelected,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.00),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(left: 10.00, right: 10.00),
                    child: _item.picture),
                Padding(
                  padding: const EdgeInsets.only(left: 5.00),
                  child: Text(_item.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _radio(bool isSelected) {
    return isSelected
        ? Container(child: Icon(MaterialIcons.radio_button_checked))
        : Icon(MaterialIcons.radio_button_unchecked);
  }
}
