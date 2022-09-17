import 'package:flutter/material.dart';
import 'package:ui_kit/layouts/page_template.dart';
import 'package:ui_kit/typography/heading.dart';

import 'app_bar.dart';

class GenericTemplate extends StatelessWidget {
  final Widget? leadingWidget;
  final List<Widget>? tailingWidget;
  final Widget? floatingActionButton;

  final Heading header;
  final Widget child;
  final Widget formSubmitAction;

  const GenericTemplate(
    this.header,
    this.child,
    this.formSubmitAction, {
    this.leadingWidget,
    this.tailingWidget,
    this.floatingActionButton,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: MainAppBar(
        implyLeading: leadingWidget != null,
        leadingWidget: leadingWidget,
        tailingWidget: tailingWidget,
      ),
      floatingActionButton: floatingActionButton,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(alignment: Alignment.centerLeft, child: header),
            ),
            Expanded(flex: 1, child: child),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: formSubmitAction,
            )
          ],
        ),
      ),
    );
  }
}
