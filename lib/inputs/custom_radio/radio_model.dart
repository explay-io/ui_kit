import 'package:flutter/material.dart';

class RadioModel {
  RadioModel(
    this.text, {
    required this.picture,
    this.isSelected = false,
    required this.textShortform,
  });

  bool isSelected;
  final String text;
  Widget picture;
  final String textShortform;
}
