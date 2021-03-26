import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/illustrations/undraw.dart';
import 'package:ui_kit/illustrations/undraw_illustrations.dart';
import 'package:ui_kit/layouts/page_template.dart';
import 'package:ui_kit/sliders/utility_slide.dart';
import 'package:ui_kit/sliders/slider.dart';

class Sliders extends StatelessWidget {
  static const String sliderRoute = '/slider-page';
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        padding: const EdgeInsets.all(30.0),
        child: AppSlider(
          slides: <Widget>[
            buildSlideOne(),
            buildSlideTwo(),
            buildSlideThree(),
          ],
          pageController: _controller,
        ));
  }

  Widget buildSlideOne() {
    return UtilitySlide(
      'Slide 1 title',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      Undraw(
        color: AppColor.blue,
        illustration: UndrawIllustration.mobile_application,
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget buildSlideTwo() {
    return UtilitySlide(
      'Slide 2 title',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      Undraw(
        color: AppColor.blue,
        illustration: UndrawIllustration.mobile_application,
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget buildSlideThree() {
    return UtilitySlide(
      'Slide 3 title',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      Undraw(
        color: AppColor.blue,
        illustration: UndrawIllustration.mobile_application,
        width: 285.0,
        height: 215.0,
      ),
    );
  }
}
