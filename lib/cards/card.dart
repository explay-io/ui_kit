import 'package:flutter/material.dart';

import '../colors/app_color.dart';

const _elevationToShadow = <int, BoxShadow?>{
  1: null,
  2: BoxShadow(
      color: AppColor.shadowColor,
      offset: Offset(0.0, 3.0),
      blurRadius: 5.0,
      spreadRadius: 0.0),
  3: BoxShadow(
      color: AppColor.shadowColor,
      offset: Offset(0.0, 5.0),
      blurRadius: 15.0,
      spreadRadius: 0.0),
  4: BoxShadow(
      color: AppColor.shadowColor,
      offset: Offset(0.0, 10.0),
      blurRadius: 25.0,
      spreadRadius: 0.0)
};

class AppCard extends StatelessWidget {
  const AppCard(
      {Key? key,
      required this.child,
      this.margin = const EdgeInsets.all(0.0),
      this.color = AppColor.deepWhite,
      this.elevation = 2,
      this.borderRadius = 4.0})
      : assert(elevation >= 1 && elevation <= 4),
        super(key: key);

  final Color color;
  final int elevation;
  final EdgeInsetsGeometry margin;
  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final boxShadow = _elevationToShadow[elevation];
    return Material(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
            color: AppColor.deepWhite,
            border: null,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            boxShadow: boxShadow == null ? null : [boxShadow]),
        child: child,
      ),
    );
  }
}
