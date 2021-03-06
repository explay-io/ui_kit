import 'package:flutter/material.dart';
import 'package:ui_kit/buttons/filled_button.dart';
import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';

import 'shaker.dart';

class Animations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            _ShakerStory(),
          ],
        ),
      ),
    );
  }
}

class _ShakerStory extends StatefulWidget {
  const _ShakerStory();

  @override
  __ShakerStoryState createState() => __ShakerStoryState();
}

class __ShakerStoryState extends State<_ShakerStory> {
  bool canShake = false;

  @override
  Widget build(BuildContext context) {
    return ExpandableStory(
      title: 'Shaker',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'durationMs': 400,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              IntPropUpdater(
                props: props,
                updateProp: updateProp,
                propKey: 'durationMs',
              ),
            ],
          );
        },
        widgetBuilder: (context, props) {
          final int durationMs = props['durationMs'];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Shaker(
                canShake: canShake,
                shakeDuration: Duration(milliseconds: durationMs),
                child: const Text('Tap the button to shake me!'),
              ),
              const SizedBox(height: 10),
              FilledButton(
                'Shake',
                onPressed: () async {
                  setState(() {
                    canShake = !canShake;
                  });
                },
                fullWidth: false,
                narrow: true,
              )
            ],
          );
        },
      ),
    );
  }
}
