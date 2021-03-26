import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:ui_kit/illustrations/undraw.dart';
import 'package:ui_kit/illustrations/undraw_illustrations.dart';
import 'package:ui_kit/typography/heading.dart';
import 'package:ui_kit/typography/heading_type.dart';
import 'package:ui_kit/wizards/wizard_utility_page.dart';
import 'package:ui_kit/wizards/wizard.dart';
import 'package:ui_kit/wizards/wizard_binder.dart';

class WizardStory extends StatelessWidget {
  final WizardBinder binder = WizardBinder();

  @override
  Widget build(BuildContext context) {
    return Wizard(
      intoWidget: _wizardIntro(),
      wizardPages: [
        _wizardPageOne(),
        _wizardPageTwo(),
        _wizardPageThree(),
      ],
      outroWidget: _wizardOutro(),
      binder: binder,
    );
  }

  Widget _wizardIntro() {
    return WizardUtilityPage(
      'Welcome to Wizard',
      'Before you get start with wizard please read this description '
          'because of reasons, may the force be with you.',
      Undraw(
        color: AppColor.blue,
        illustration: UndrawIllustration.mobile_application,
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget _wizardOutro() {
    return WizardUtilityPage(
      'You\'re all set!!',
      'Have fun with the wizard and may the you not slip into the dark side.',
      Undraw(
        color: AppColor.blue,
        illustration: UndrawIllustration.mobile_application,
        width: 285.0,
        height: 215.0,
      ),
    );
  }

  Widget _wizardPageOne() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.centerLeft,
            child: Heading('Mandatory page',
                headingType: HeadingType.HEADING_1, textAlign: TextAlign.left)),
        Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'First name',
                labelStyle:
                    TextStyle(fontSize: 18, color: Colors.black, height: -1.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              autofocus: true,
              onSaved: (String value) {},
            )),
      ],
    );
  }

  Widget _wizardPageTwo() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.centerLeft,
            child: Heading('Do this later',
                headingType: HeadingType.HEADING_1, textAlign: TextAlign.left)),
        Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last name',
                labelStyle:
                    TextStyle(fontSize: 18, color: Colors.black, height: -1.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              autofocus: true,
              onSaved: (String value) {},
            )),
      ],
    );
  }

  Widget _wizardPageThree() {
    return Column(
      children: <Widget>[
        const Align(
            alignment: Alignment.centerLeft,
            child: Heading('Skippable page',
                headingType: HeadingType.HEADING_1, textAlign: TextAlign.left)),
        Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Last name',
                labelStyle:
                    TextStyle(fontSize: 18, color: Colors.black, height: -1.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              autofocus: true,
              onSaved: (String value) {},
            )),
      ],
    );
  }
}
