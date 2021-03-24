import 'package:flutter/material.dart';
import 'package:ui_kit/story_book/expandable_story.dart';
import 'package:ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:ui_kit/story_book/props_explorer.dart';
import 'package:ui_kit/widgets/security_info_box.dart';

class InfoBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(child: _story()));
  }
}

Widget _story() {
  return Container(
      child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _securedInfoBoxStory(),
              ]
          )
      ));
}

Widget _securedInfoBoxStory() {
  return ExpandableStory(
      title: 'Security Info Box',
      child: PropsExplorer(
          initialProps: const <String, dynamic>{
            'assetName': 'assets/convert_is_secured.svg',
            'infoHeader': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            'infoBody': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada dui non egestas semper. Donec sit amet orci metus. Nam sit amet velit in ipsum lacinia suscipit. Duis quis erat convallis, vulputate neque nec, feugiat enim. Fusce laoreet, risus quis commodo tincidunt, nibh tortor dapibus neque, eget aliquet odio magna non leo. Cras viverra laoreet ante, a placerat purus fermentum sed. Cras lobortis blandit dolor, sed vestibulum purus faucibus id. Duis congue imperdiet erat consequat posuere. Quisque vel lorem odio. Nullam non diam ultrices, aliquet elit eget, viverra lorem. Donec vitae maximus lectus, eget pulvinar lacus. Nullam in tortor nisl. Aenean in blandit diam, nec cursus sem. Mauris eget rutrum nunc.'
          },
          formBuilder: (context, props, updateProp) {
            return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  StringPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'infoHeader',
                  ),
                  StringPropUpdater(
                    props: props,
                    updateProp: updateProp,
                    propKey: 'infoBody',
                  ),
                ]);
          },
          widgetBuilder: (context, props) {
            return Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  child: Center(
                    child: SecurityInfoBox(
                        props['assetName'],
                        props['infoHeader'],
                        props['infoBody']),
                  ))]);
          }));
}
