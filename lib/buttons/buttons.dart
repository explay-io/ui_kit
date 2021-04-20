import 'dart:async';

import 'package:ui_kit/buttons/simple_button.dart';
import 'package:ui_kit/buttons/switcher_button.dart';
import 'package:ui_kit/buttons/two_states_button.dart';
import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/list_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';
import 'package:flutter/material.dart';

import 'contour_button.dart';
import 'filled_button.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _filledButtonStory(),
          _contourButtonStory(),
          _simpleButtonStory(),
          _switcherButtonStory(),
          _twoStatesButtonStory(),
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
          FutureOr<void> Function() onPressed = () {};

          if (props['taskDuration'] != null && props['enabled'] != false) {
            onPressed = () async {
              await Future<void>.delayed(
                  Duration(milliseconds: props['taskDuration']));
            };
          }

          return FilledButton(
            props['text'],
            enabled: props['enabled'],
            onPressed: onPressed,
            fullWidth: props['fullWidth'],
            narrow: props['narrow'],
          );
        },
      ),
    );
  }

  Widget _contourButtonStory() {
    return ExpandableStory(
      title: 'Contour Button',
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
          FutureOr<void> Function() onPressed = () {};

          if (props['taskDuration'] != null && props['enabled'] != false) {
            onPressed = () async {
              await Future<void>.delayed(
                  Duration(milliseconds: props['taskDuration']));
            };
          }

          return ContourButton(
            props['text'],
            enabled: props['enabled'],
            onPressed: onPressed,
            fullWidth: props['fullWidth'],
            narrow: props['narrow'],
          );
        },
      ),
    );
  }

  Widget _simpleButtonStory() {
    return ExpandableStory(
      title: 'Simple Button',
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
          FutureOr<void> Function() onPressed = () {};

          if (props['taskDuration'] != null && props['enabled'] != false) {
            onPressed = () async {
              await Future<void>.delayed(
                  Duration(milliseconds: props['taskDuration']));
            };
          }

          return SimpleButton(
            props['text'],
            enabled: props['enabled'],
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
          'buttonLabels': <String>['EUR', 'USD'],
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
                hintText: 'comma-separated list of strings e.g EUR,USD',
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
          'initialText': 'Confirm',
          'finalText': 'Refresh',
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
          FutureOr<void> Function() onPressed = () {};
          Function? onRefreshRate = () {};

          return TwoStatesButton(
            props['initialText'],
            props['finalText'],
            props['timeIntervalInSec'],
            enabled: props['enabled'],
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
