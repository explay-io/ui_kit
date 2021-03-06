import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/text.dart';
import 'package:ui_kit/typography/heading.dart';
import 'package:ui_kit/typography/heading_type.dart';

class WizardUtilityPage extends StatelessWidget {
  final Widget picture;
  final String heading;
  final String body;

  const WizardUtilityPage(this.heading, this.body, this.picture) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ],
        ));
  }
}
