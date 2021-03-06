import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class DotsIndicator extends AnimatedWidget {
  static void defaultOnPageSelected(_) {}

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;

  final double distanceBetweenCenterOfDots;
  final double dotSize;

  const DotsIndicator(
      {required this.controller,
      required this.itemCount,
      this.onPageSelected = defaultOnPageSelected,
      this.dotSize = 8.0,
      this.distanceBetweenCenterOfDots = 20.0})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List<Widget>.generate(itemCount, buildDot),
      ),
    );
  }

  Widget buildDot(int index) {
    final selectedPage = (controller.page ?? controller.initialPage).round();
    final color =
        (selectedPage == index) ? AppColor.darkerBlue : AppColor.semiGrey;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Dot(
          color: color, onTap: () => onPageSelected(index), dotSize: dotSize),
    );
  }
}

class Dot extends StatelessWidget {
  final Color color;
  final double dotSize;
  final Function onTap;

  const Dot({required this.color,required this.dotSize,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }
}
