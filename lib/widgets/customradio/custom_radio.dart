import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/color.dart';
import 'package:ui_kit/widgets/customradio/radio_item.dart';
import 'package:ui_kit/widgets/customradio/radio_model.dart';
import 'package:ui_kit/widgets/filled_button.dart';

class CustomRadio extends StatefulWidget {
  final List<RadioModel> radioElements;
  const CustomRadio({this.radioElements});

  @override
  CustomRadioState createState() {
    return CustomRadioState(radioElements: radioElements);
  }

  static List<RadioModel> availableRadioModels() {
    final sampleRadioElements = <RadioModel>[];
    sampleRadioElements.add(RadioModel('one',
        textShortform: 'any',
        isSelected: false,
        svgPicture:
            SvgPicture.asset('assets/save_as_you_pay.svg', height: 30.0, width: 30.0)));
    return sampleRadioElements;
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> radioElements;
  CustomRadioState({this.radioElements});
  String selectedRadioModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: radioElements.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: AppColor.darkerBlue,
            onTap: () {
              setState(() {
                radioElements.forEach((element) => element.isSelected = false);
                radioElements[index].isSelected = true;
                selectedRadioModel = radioElements[index].textShortform;
              });
            },
            child: RadioItem(radioElements[index]),
          );
        },
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: FilledButton(
            'Next',
            fullWidth: true,
            onPressed: () {
              print('You selected: $selectedRadioModel');
            },
          )),
    );
  }
}
