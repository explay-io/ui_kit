import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_kit/buttons/filled_button.dart';
import 'package:ui_kit/colors/app_color.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ui_kit/inputs/custom_radio/radio_item.dart';
import 'package:ui_kit/inputs/custom_radio/radio_model.dart';

class CustomRadio extends StatefulWidget {
  final List<RadioModel> radioElements;
  const CustomRadio({this.radioElements});

  @override
  CustomRadioState createState() {
    return CustomRadioState(radioElements: radioElements);
  }

  static List<RadioModel> availableRadioModels() {
    final sampleRadioElements = <RadioModel>[];
    sampleRadioElements.add(
      RadioModel(
        'one',
        textShortform: 'any',
        isSelected: false,
        picture: Icon(
          FontAwesome.glass,
          color: AppColor.blue,
        ),
      ),
    );
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
          onPressed: () async {
            print('You selected: $selectedRadioModel');
          },
        ),
      ),
    );
  }
}
