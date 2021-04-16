import 'package:flutter/material.dart' hide TextButton;
import 'package:ui_kit/buttons/simple_button.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';
import 'package:ui_kit/cards/card.dart';
import 'package:ui_kit/cards/news_card.dart';

class AppCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _emptyCardStory(),
            _sampleCardStory(),
            _newsCardStory(),
          ],
        ),
      ),
    );
  }

  Widget _emptyCardStory() {
    return ExpandableStory(
      title: 'Empty Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'elevation': 2.0,
          'margin': 15.0,
          'borderRadius': 4.0,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'elevation',
                  min: 1,
                  max: 4),
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'margin',
                  min: 0,
                  max: 20),
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'borderRadius',
                  min: 0,
                  max: 20)
            ],
          );
        },
        widgetBuilder: (context, props) {
          final double elevation = props['elevation'];
          final double margin = props['margin'];
          final double? borderRadius = props['borderRadius'];

          return AppCard(
            color: AppColor.deepWhite,
            elevation: elevation.toInt(),
            margin: EdgeInsets.all(margin),
            borderRadius: borderRadius,
            child: Container(
              width: 140,
              height: 140,
            ),
          );
        },
      ),
    );
  }

  Widget _sampleCardStory() {
    return ExpandableStory(
      title: 'Sample Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'elevation': 2.0,
          'margin': 15.0,
          'borderRadius': 4.0,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'elevation',
                  min: 1,
                  max: 4),
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'margin',
                  min: 0,
                  max: 20),
              DoublePropUpdater(
                  props: props,
                  updateProp: updateProp,
                  propKey: 'borderRadius',
                  min: 0,
                  max: 20)
            ],
          );
        },
        widgetBuilder: (context, props) {
          final double elevation = props['elevation'];
          final double margin = props['margin'];
          final double? borderRadius = props['borderRadius'];

          return AppCard(
            color: AppColor.deepWhite,
            elevation: elevation.toInt(),
            margin: EdgeInsets.all(margin),
            borderRadius: borderRadius,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle:
                      Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                ButtonBarTheme(
                  data: ButtonBarThemeData(),
                  child: ButtonBar(
                    children: <Widget>[
                      SimpleButton(
                        'BUY TICKETS',
                        onPressed: () async {},
                      ),
                      SimpleButton(
                        'LISTEN',
                        onPressed: () async {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _newsCardStory() {
    return ExpandableStory(
      title: 'News Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'source': 'NewsFeed',
          'time': 0,
          'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          'image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--jh5laibJ--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://thepracticaldev.s3.amazonaws.com/i/mq33e4a63bduhbljfiop.png'
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(
                  props: props, updateProp: updateProp, propKey: 'source'),
              IntPropUpdater(
                  props: props, updateProp: updateProp, propKey: 'time'),
              StringPropUpdater(
                  props: props, updateProp: updateProp, propKey: 'title'),
              StringPropUpdater(
                  props: props, updateProp: updateProp, propKey: 'image')
            ],
          );
        },
        widgetBuilder: (context, props) {
          final String? source = props['source'];
          final int? time = props['time'];
          final String? title = props['title'];
          final String? image = props['image'];

          return NewsCard(
              title: title, image: image, source: source, time: time);
        },
      ),
    );
  }
}
