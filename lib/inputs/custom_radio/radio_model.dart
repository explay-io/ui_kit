import 'package:flutter/material.dart';

class RadioModel {
  RadioModel(
    this.text, {
    this.picture,
    this.isSelected,
    this.textShortform,
  });

  bool? isSelected;
  final String text;
  Widget? picture;
  final String? textShortform;
}
