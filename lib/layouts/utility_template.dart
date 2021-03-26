import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/layouts/page_template.dart';
import 'package:ui_kit/text.dart';
import 'package:ui_kit/typography/heading.dart';
import 'package:ui_kit/typography/heading_type.dart';

import 'app_bar.dart';

class UtilityTemplate extends StatelessWidget {
  final Widget picture;
  final String heading;
  final String body;
  final Widget action;
  final bool restrictWidth;

  const UtilityTemplate(this.heading, this.body, this.picture, this.action,
      {this.restrictWidth = true})
      : super();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: const MainAppBar(implyLeading: false),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 34.0),
                  child: picture,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Heading(
                      heading,
                      headingType: HeadingType.HEADING_1,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(body,
                          textAlign: TextAlign.center,
                          style:
                              AppText.body1.copyWith(color: AppColor.semiGrey)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: action,
            )
          ],
        ),
      ),
    );
  }
}
