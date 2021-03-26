import 'package:flutter/material.dart' hide TextButton;
import 'package:ui_kit/widgets/filled_button.dart';
import 'package:ui_kit/widgets/popover_modal.dart';
import 'package:ui_kit/widgets/text/heading.dart';
import 'package:ui_kit/widgets/text/heading_type.dart';
import 'package:ui_kit/widgets/text_button.dart';

class Popover extends StatelessWidget {
  final PopoverModal popover = PopoverModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _popoverExampleOne(context),
            _popoverExampleTwo(context),
            _popoverExampleThree(context)
          ],
        ),
      ),
    );
  }

  Widget _popoverExampleOne(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'Show Large Popover',
          onPressed: () async {
            _onExampleOnePressed(context);
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _popoverExampleTwo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'Show Small Popover',
          onPressed: () async {
            _onExampleTwoPressed(context);
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _popoverExampleThree(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'Show Action Popover',
          onPressed: () async {
            _onExampleThreePressed(context);
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  void _onExampleOnePressed(BuildContext context) {
    popover.showPopover<void>(
        context,
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: const <Widget>[
              Heading('Example Header',
                  headingType: HeadingType.HEADING_2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }

  void _onExampleTwoPressed(BuildContext context) {
    popover.showPopover<void>(
        context,
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Heading('Example Header',
                  headingType: HeadingType.HEADING_2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }

  void _onExampleThreePressed(BuildContext context) {
    final result = popover.showPopover<String>(
        context,
        Padding(
          padding: const EdgeInsets.only(
              left: 30.0, top: 30.0, bottom: 5.0, right: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Heading('Example Header',
                  headingType: HeadingType.HEADING_2),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  'Ok',
                  onPressed: () async {
                    Navigator.pop(context, 'Ok button');
                  },
                  fullWidth: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton('Cancel', onPressed: () async {
                  Navigator.pop(context, 'Cancel button');
                }),
              )
            ],
          ),
        ));

    result.then((value) {
      value ??= 'Nothing';
      showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('You clicked'),
              content: Text(value),
              actions: <Widget>[
                TextButton('Thats nice',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    });
  }
}
