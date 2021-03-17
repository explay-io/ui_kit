import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/list_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';
import 'package:ui_kit/widgets/filled_button.dart';
import 'package:ui_kit/widgets/outlined_button.dart';
import 'package:flutter/material.dart' hide OutlinedButton, TextButton;
import 'package:ui_kit/widgets/switcher_button.dart';
import 'package:ui_kit/widgets/text_button.dart';
import 'package:ui_kit/widgets/two_states_button.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _filledButtonStory(),
          _outlinedButtonStory(),
          _textButtonStory(),
          _switcherButtonStory(),
          _twoStatesButtonStory()
        ],
      ),
    );
  }

  Widget _filledButtonStory() {
    return ExpandableStory(
      title: 'Filled Button',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'text': 'Activate',
          'enabled': true,
          'fullWidth': false,
          'narrow': false,
          'taskDuration': 300,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'text',
              ),
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'taskDuration',
                hintText: 'Simulate task with duration in milliseconds',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'enabled',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'fullWidth',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'narrow',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          Function onPressed = () {};

          if (props['enabled'] == false) {
            onPressed = null;
          }

          if (props['taskDuration'] != null && props['enabled'] != false) {
            onPressed = () async {
              await Future<void>.delayed(
                  Duration(milliseconds: props['taskDuration']));
            };
          }

          return FilledButton(
            props['text'],
            onPressed: onPressed,
            fullWidth: props['fullWidth'],
            narrow: props['narrow'],
          );
        },
      ),
    );
  }

  Widget _outlinedButtonStory() {
    return ExpandableStory(
      title: 'Outlined Button',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'text': 'Activate',
          'enabled': true,
          'fullWidth': false,
          'narrow': false,
          'taskDuration': 300,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'text',
              ),
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'taskDuration',
                hintText: 'Simulate task with duration in milliseconds',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'enabled',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'fullWidth',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'narrow',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          Function onPressed = () {};

          if (props['enabled'] == false) {
            onPressed = null;
          }

          if (props['taskDuration'] != null && props['enabled'] != false) {
            onPressed = () async {
              await Future<void>.delayed(
                  Duration(milliseconds: props['taskDuration']));
            };
          }

          return OutlinedButton(
            props['text'],
            onPressed: onPressed,
            fullWidth: props['fullWidth'],
            narrow: props['narrow'],
          );
        },
      ),
    );
  }

  Widget _textButtonStory() {
    return ExpandableStory(
      title: 'Text Button',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'text': 'Activate',
          'enabled': true,
          'taskDuration': 300,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'text',
              ),
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'taskDuration',
                hintText: 'Simulate task with duration in milliseconds',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'enabled',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          Function onPressed = () {};

          if (props['enabled'] == false) {
            onPressed = null;
          }

          if (props['taskDuration'] != null && props['enabled'] != false) {
            onPressed = () async {
              await Future<void>.delayed(
                  Duration(milliseconds: props['taskDuration']));
            };
          }

          return TextButton(
            props['text'],
            onPressed: onPressed,
          );
        },
      ),
    );
  }

  Widget _switcherButtonStory() {
    // ignore: prefer_function_declarations_over_variables
    final listToTextConverter = <String>(List<String> list) => list.join(',');
    // ignore: prefer_function_declarations_over_variables
    final textToListConverter = (String text) => text.split(',');

    return ExpandableStory(
      title: 'Switcher button',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'buttonLabels': <String>['BTC','EUR','ETH'],
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              ListPropUpdater<String>(
                props: props,
                updateProp: updateProp,
                propKey: 'buttonLabels',
                listToTextConverter: listToTextConverter,
                textToListConverter: textToListConverter,
                hintText: 'comma-separated list of strings e.g EUR,BTC,USD',
              )
            ],
          );
        },
        widgetBuilder: (context, props) {
          final List<String> labels = props['buttonLabels'];
          return Column(
            children: <Widget>[
              SwitcherButton(
                labels: labels,
                onSwitch: (index) => print('Switched to index $index'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _twoStatesButtonStory() {
    return ExpandableStory(
      title: 'Button changes it\'s state buy timer',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'initialText': 'Confirm buy',
          'finalText': 'Refresh rate',
          'timeIntervalInSec': 3,
          'enabled': true,
          'fullWidth': false,
          'narrow': false,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'initialText',
              ),
              StringPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'finalText',
              ),
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'timeIntervalInSec',
                hintText: 'Switch state timer with duration in seconds',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'enabled',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'fullWidth',
              ),
              BoolPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'narrow',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          Function onPressed = () {};
          Function onRefreshRate = () {};

          if (props['enabled'] == false) {
            onPressed = null;
            onRefreshRate = null;
          }

          return TwoStatesButton(
            props['initialText'],
            props['finalText'],
            props['timeIntervalInSec'],
            onPressed: onPressed,
            onButtonCallback: onRefreshRate,
            fullWidth: props['fullWidth'],
            narrow: props['narrow'],
          );
        },
      ),
    );
  }
}
