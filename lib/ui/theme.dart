
import 'package:flutter/material.dart';
import 'package:ui_kit/text.dart';
import 'package:ui_kit/theme.dart' as ui_kit;

import 'colors.dart';

final ThemeData theme = ui_kit.theme.copyWith(
    inputDecorationTheme: _inputDecorationTheme,
    iconTheme: _iconTheme,
    toggleableActiveColor: AppColors.primary,
    textTheme: const TextTheme(
      headline6: _headingStyle,
      bodyText2: _bodyStyle,
      bodyText1: _bodyStyle2,
      button: _buttonTextStyle,
      caption: _captionTextStyle,
      headline4: _appBarTitleStyle,
      headline3: AppText.header2,
      headline2: AppText.header1,
      subtitle1: _bodyStyle,
    )
);

const _buttonTextStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
);

const _iconTheme = IconThemeData(size: 36.0);

const _textDisplayColor = Color(0xFF9B9B9B);

const _headingStyle = TextStyle(
  fontSize: 28,
  fontFamily: 'Circular',
  fontWeight: FontWeight.w800,
  letterSpacing: 0,
  height: 0.7,
);

const TextStyle subHeadingStyle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
);

const _bodyStyle = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
);

const _bodyStyle2 = TextStyle(
  color: Colors.black,
  fontSize: 11.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
);

const _captionTextStyle = TextStyle(
  color: _textDisplayColor,
  fontSize: 11.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
  letterSpacing: 0.5,
);

const _appBarTitleStyle = TextStyle(
  color: AppColors.primary,
  fontSize: 11.8,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);

const _inputStyle = TextStyle(
  fontSize: 12.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.bold,
);

const _inputHintStyle = TextStyle(
  color: AppColors.hint,
  fontSize: 18.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
);

const _inputHelperStyle = TextStyle(
  color: AppColors.hint,
  fontSize: 12.0,
  fontFamily: 'Circular',
  fontWeight: FontWeight.normal,
);

const _inputDecorationTheme = InputDecorationTheme(
    labelStyle: _inputStyle,
    hintStyle: _inputHintStyle,
    helperStyle: _inputHelperStyle,
    prefixStyle: _bodyStyle,
    suffixStyle: _bodyStyle,
    contentPadding:
        EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0));
