import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/bool_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/dropdown_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';
import 'package:ui_kit/widgets/time_frame_selector.dart';
import 'package:ui_kit/widgets/graph.dart';

import '../color.dart';

math.Random random = new math.Random();

class Graphs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      child: SingleChildScrollView(
        child: _graphsStory()
      )
    );
  }

  Widget _graphsStory() {

    List<double> _generateRandomData(int count) {
      final result = <double>[];
      for (var i = 0; i < count; i++) {
        result.add(random.nextDouble() * 10000);
      }
      return result;
    }
    final data = _generateRandomData(100);
    void onChangeTextField(String value) {
      _generateRandomData(1000);
    }

    final colorList = ['Red', 'Green'];

    return Container(
      child: SingleChildScrollView(
        child: ExpandableStory(
          title: 'Graph Line',
          child: PropsExplorer(
            initialProps: const <String, dynamic>{
              'enableMaxMin': true,
              'labelPrefix': '€',
              'enableGradient': true,
              'lineColor': 'Green',
              'showTimeFrameSelector': true,
              'defaultTimeFrame': '1D',
              'maxTimeFrame': '1Y'

            },
            formBuilder: (context, props, updateProp) {
              final timeFrames = <String>[];
              for (var timeFrame in TimeFrame.values) {
                timeFrames.add(TimeFrameHelper.getValue(timeFrame));
              }
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  BoolPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'enableMaxMin',
                  ),
                  BoolPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'enableGradient',
                  ),
                  BoolPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'showTimeFrameSelector',
                  ),
                  DropdownPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'lineColor',
                    options: colorList,
                  ),
                  StringPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'labelPrefix',
                  ),
                  DropdownPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'defaultTimeFrame',
                    options: timeFrames,
                  ),
                  DropdownPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'maxTimeFrame',
                    options: timeFrames,
                  ),
                ]
              );
            },
            widgetBuilder: (context, props) {
              return Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height:180.0,
                  child: Center(
                      child: Graph(
                          data: data,
                          labelPrefix: props['labelPrefix'],
                          enableMaxMin: props['enableMaxMin'],
                          enableGradient: props['enableGradient'],
                          lineColor: _optionToColor(props['lineColor']),
                      )
                  )
                ),
                Container(
                    height: 35.0,
                    child: Center(
                      child: props['showTimeFrameSelector'] ? TimeFrameSelector(
                          defaultTimeFrame: TimeFrameHelper.getKey(
                              props['defaultTimeFrame']),
                          maxTimeFrame: TimeFrameHelper.getKey(
                              props['maxTimeFrame']),
                          onChange: onChangeTextField) : Container(),
                    )
                ),
              ]);
            }
          )
        )
      )
    );
  }

  Color _optionToColor(String optionSelected) {
    switch (optionSelected) {
      case 'Red':
        return AppColor.red;
      default:
        return AppColor.blue;
    }
  }
}
