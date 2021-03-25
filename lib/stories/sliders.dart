import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_kit/widgets/layout/page_template.dart';
import 'package:ui_kit/widgets/slider/layout/utility_slide.dart';
import 'package:ui_kit/widgets/slider/slider.dart';

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
      'Lorem Ipsum.',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      SvgPicture.asset(
        'assets/card_holder.svg',
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget buildSlideTwo() {
    return UtilitySlide(
      'Lorem Ipsum.',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      SvgPicture.asset(
        'assets/free_trading.svg',
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget buildSlideThree() {
    return UtilitySlide(
      'Lorem Ipsum.',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      SvgPicture.asset(
        'assets/secure_funds.svg',
        width: 285.0,
        height: 215.0,
      ),
    );
  }
}
