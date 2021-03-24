import 'package:flutter/material.dart' hide TextButton;
import 'package:flutter_svg/svg.dart';
import 'package:ui_kit/widgets/customradio/custom_radio.dart';
import 'package:ui_kit/widgets/filled_button.dart';
import 'package:ui_kit/widgets/layout/generic_template.dart';
import 'package:ui_kit/widgets/layout/information_template.dart';
import 'package:ui_kit/widgets/layout/titled_generic_template.dart';
import 'package:ui_kit/widgets/layout/utility_template.dart';
import 'package:ui_kit/widgets/text/heading.dart';
import 'package:ui_kit/widgets/text/heading_type.dart';
import 'package:ui_kit/widgets/text/label_value_pair.dart';
import 'package:ui_kit/widgets/text_button.dart';

import '../color.dart';

class Layouts extends StatelessWidget {
  static const String informationLayoutRoute = '/information-layout-page';
  static const String utilityLayoutRoute = '/utility-layout-page';
  static const String dismissibleLayoutRoute = '/dismissible-layout-page';
  static const String infoLayoutRoute = '/info-layout-page';
  static const String paymentMethodLayout = '/payment-method';
  static const String buySellLayout = '/buy-sell';
  static const String cameraLayoutRoute = '/camera-screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _informationLayout(context),
            _utilityLayout(context),
            _dismissibleLayout(context),
            _infoLayout(context),
            _paymentMethod(context),
            _landingPage(context),
          ],
        ),
      ),
    );
  }

  Widget _utilityLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'I\'m all about that utility',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: utilityLayoutRoute),
                    builder: (_) => UtilityTemplate(
                        'Lorem ipsum dolor sit amet.',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada dui non egestas semper. Donec sit amet orci metus. Nam sit amet velit in ipsum lacinia suscipit. Duis quis erat convallis, vulputate neque nec, feugiat enim.',
                        SvgPicture.asset(
                          'assets/update-app.svg',
                          width: 285.0,
                          height: 215.0,
                        ),
                        FilledButton(
                          'Update app',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          fullWidth: true,
                          narrow: false,
                        ))));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _informationLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'I\'m all about that txt txt pic',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: informationLayoutRoute),
                    builder: (_) => InformationTemplate(
                          'Information template',
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada dui non egestas semper. Donec sit amet orci metus. Nam sit amet velit in ipsum lacinia suscipit. Duis quis erat convallis, vulputate neque nec, feugiat enim.',
                          SvgPicture.asset(
                            'assets/update-app.svg',
                            width: 200.0,
                            height: 200.0,
                          ),
                          FilledButton(
                            'Back',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            fullWidth: true,
                            narrow: false,
                          ),
                          leadingWidget: const BackButton(),
                        )));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _dismissibleLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'I\'m all about that close button',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: dismissibleLayoutRoute),
                    builder: (_) => GenericTemplate(
                        const Heading('How can we make app better?',
                            headingType: HeadingType.HEADING_1,
                            textAlign: TextAlign.left),
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Give us your feedback',
                                labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    height: -1.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                              autofocus: true,
                              onSaved: (String value) {},
                            )),
                        FilledButton('SEND', fullWidth: true, onPressed: () {
                          print('you clicked send');
                        }),
                        leadingWidget: const CloseButton())));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }

  Widget _infoLayout(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child:
                FilledButton('I\'m all about that info button', onPressed: () {
          Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                settings: const RouteSettings(name: infoLayoutRoute),
                builder: (_) => GenericTemplate(
                    const Heading(
                        'Lorem ipsum dolor sit amet.',
                        headingType: HeadingType.HEADING_2,
                        textAlign: TextAlign.left),
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(children: <Widget>[
                          const LabelValuePair(
                              labelText: 'Invite Link',
                              valueText: 'link.com/r/2415',
                              copyToClipboardEnabled: true),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              'assets/referral-screen.svg',
                              width: 285.0,
                              height: 215.0,
                            ),
                          ),
                        ])),
                    FilledButton('Invite friends', fullWidth: true,
                        onPressed: () {
                      print('you clicked invite friends');
                    }),
                    tailingWidget: [
                      IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ]),
              ));
        })));
  }

  Widget _paymentMethod(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: FilledButton('I\'m all about that payment methods',
                onPressed: () {
          Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                settings: const RouteSettings(name: infoLayoutRoute),
                builder: (_) => GenericTemplate(
                    const Heading('Lorem ipsum',
                        headingType: HeadingType.HEADING_2,
                        textAlign: TextAlign.left),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 60.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .body2
                                            .copyWith(
                                                color: AppColor.semiGrey)),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body2
                                          .copyWith(color: AppColor.semiGrey))),
                              Expanded(
                                  flex: 1,
                                  child: CustomRadio(
                                    radioElements:
                                        CustomRadio.availableRadioModels(),
                                  )),
                            ])),
                    const SizedBox.shrink(),
                    leadingWidget: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
              ));
        })));
  }

  Widget _landingPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FilledButton(
          'I\'m all about landing page',
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                    settings: const RouteSettings(name: dismissibleLayoutRoute),
                    builder: (_) => TitledGenericTemplate(
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const Heading(
                                  'Lorem ipsum dolor sit amet.',
                                  headingType: HeadingType.HEADING_1,
                                  textAlign: TextAlign.left),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                      style: Theme.of(context).textTheme.body1),
                                ),
                              ),
                              const SizedBox(
                                height: 33,
                              ),
                              Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'assets/update-app.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  new RichText(
                                    textAlign: TextAlign.left,
                                    text: new TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Lorem ipsum dolor sit amet.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .body2
                                              .copyWith(
                                                  color: AppColor.semiGrey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(children: <Widget>[
                            FilledButton(
                              'Accept',
                              onPressed: () {
                                print('Test');
                              },
                              fullWidth: true,
                              narrow: false,
                            ),
                            TextButton(
                              'Cancel',
                              onPressed: () {
                                print('Test');
                              },
                            ),
                          ]),
                          leadingWidget: const CloseButton(),
                          title: const Text(
                            'Title',
                          ),
                          picture: SvgPicture.asset(
                            'assets/update-app.svg',
                            width: 285.0,
                            height: 215.0,
                          ),
                        )));
          },
          fullWidth: false,
          narrow: false,
        ),
      ),
    );
  }
}
