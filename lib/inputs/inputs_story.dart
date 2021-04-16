import 'package:flutter/material.dart';
import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';
import 'package:ui_kit/inputs/email_input.dart';

class Inputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_emailStory()],
      ),
    );
  }

  Widget _emailStory() {
    return ExpandableStory(
      title: 'Email',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{'error': false, 'errorText': ''},
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'error',
              ),
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'errorText',
              )
            ],
          );
        },
        widgetBuilder: (context, props) {
          return EmailInput(
              errorText: props['error'] ? props['errorText'] : null);
        },
      ),
    );
  }
}
