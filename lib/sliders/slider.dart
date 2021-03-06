import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'dots_indicator.dart';

class AppSlider extends StatelessWidget {
  final List<Widget> slides;
  final PageController pageController;

  final EdgeInsetsGeometry dotsPadding;
  final double dotSize;
  final double distanceBetweenCenterOfDots;

  const AppSlider(
      {required this.slides,
      required this.pageController,
      this.dotsPadding = const EdgeInsets.all(20.0),
      this.dotSize = 0.0,
      this.distanceBetweenCenterOfDots = 0.0});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [buildSlidePageViews(), buildDots()]);
  }

  Widget buildSlidePageViews() {
    return PageView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: pageController,
        itemCount: slides.length,
        itemBuilder: (BuildContext context, int index) {
          return slides.elementAt(index);
        });
  }

  Widget buildDots() {
    return Container(
      padding: dotsPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DotsIndicator(
            controller: pageController,
            itemCount: slides.length,
            onPageSelected: (int page) {
              pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 100),
                curve: Curves.ease,
              );
            },
          )
        ],
      ),
    );
  }
}
