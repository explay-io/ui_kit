import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/layouts/page_template.dart';
import 'package:ui_kit/text.dart';
import 'package:ui_kit/typography/heading.dart';
import 'package:ui_kit/typography/heading_type.dart';

import 'app_bar.dart';

class InformationTemplate extends StatelessWidget {
  final Widget? leadingWidget;
  final List<Widget>? tailingWidget;
  final Widget picture;
  final String heading;
  final String body;
  final Widget action;

  const InformationTemplate(this.heading, this.body, this.picture, this.action,
      {this.leadingWidget, this.tailingWidget})
      : super();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: MainAppBar(
        implyLeading: leadingWidget != null,
        leadingWidget: leadingWidget,
        tailingWidget: tailingWidget,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Heading(
                      heading,
                      headingType: HeadingType.HEADING_2,
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Text(body,
                          textAlign: TextAlign.left,
                          style:
                              AppText.body2.copyWith(color: AppColor.semiGrey)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 120.0),
                      child: picture,
                    ))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: action,
            ),
          ],
        ),
      ),
    );
  }
}
