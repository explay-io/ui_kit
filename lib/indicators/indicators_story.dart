import 'package:flutter/material.dart';
import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';
import 'package:ui_kit/indicators/gauge_indicator.dart';

class Indicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: _indicatorsStory()));
  }
}

Widget _indicatorsStory() {
  return Container(
      child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [_gaugeIndicatorStory()])));
}

Widget _gaugeIndicatorStory() {
  return ExpandableStory(
      title: 'Gauge Indicator',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'dangerThreshold': 40.0,
            'safeThreshold': 60.0,
            'score': 75.0
          },
          formBuilder: (context, props, updateProp) {
            return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  DoublePropUpdater(
                      props: props,
                      updateProp: updateProp,
                      propKey: 'dangerThreshold',
                      min: 0.0,
                      max: 45.0),
                  DoublePropUpdater(
                      props: props,
                      updateProp: updateProp,
                      propKey: 'safeThreshold',
                      min: 55.0,
                      max: 100.0),
                  DoublePropUpdater(
                      props: props,
                      updateProp: updateProp,
                      propKey: 'score',
                      min: 0.0,
                      max: 100.0),
                ]);
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  child: Center(
                      child: GaugeIndicator(
                          width: 200,
                          dangerThreshold: props['dangerThreshold'] / 100.0,
                          safeThreshold: props['safeThreshold'] / 100.0,
                          score: props['score'] / 100.0))),
            ]);
          }));
}
