import 'package:ui_kit/animations/animations_story.dart';
import 'package:ui_kit/badges/badges_story.dart';
import 'package:ui_kit/inputs/custom_label_value_story.dart';
import 'package:ui_kit/buttons/buttons.dart';
import 'package:ui_kit/cards/cards_story.dart';
import 'package:ui_kit/inputs/checkboxes_story.dart';
import 'package:ui_kit/colors/colors_story.dart';
import 'package:ui_kit/currency_displays/currency_displays_story.dart';
import 'package:ui_kit/illustrations/illustrations_story.dart';
import 'package:ui_kit/indicators/indicators_story.dart';
import 'package:ui_kit/cards/info_box_story.dart';
import 'package:ui_kit/inputs/custom_radio/custom_radio.dart';
import 'package:ui_kit/inputs/inputs_story.dart';
import 'package:ui_kit/layouts/layouts_story.dart';
import 'package:ui_kit/indicators/loaders_story.dart';
import 'package:ui_kit/numpads/numpads_story.dart';
import 'package:ui_kit/inputs/pin_views_story.dart';
import 'package:ui_kit/popovers/popovers_story.dart';
import 'package:ui_kit/sliders/sliders_story.dart';
import 'package:ui_kit/typography/typography_story.dart';
import 'package:ui_kit/icons/custom_icons_story.dart';
import 'package:ui_kit/wizards/wizards_story.dart';
import 'package:ui_kit/story_book/story_book.dart';
import 'package:ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/layouts/custom_date_picker.dart';
import 'package:ui_kit/indicators/progress_indicators_story.dart';
import 'package:ui_kit/inputs/password_validators_story.dart';

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      home: StoryBook(
        title: 'UI Components',
        pages: [
          Animations(),
          AppColors(),
          AppTypography(),
          Inputs(),
          Buttons(),
          Badges(),
          NumPads(),
          AppCards(),
          Popover(),
          Layouts(),
          ProgressIndicators(),
          PasswordValidators(),
          CustomIcons(),
          Illustrations(),
          Sliders(),
          WizardStory(),
          CustomDatePicker(onChange: (dateTime) {}),
          CustomRadio(radioElements: CustomRadio.availableRadioModels()),
          Checkboxes(),
          CustomLabelValue(),
          CurrencyDisplays(),
          InfoBoxes(),
          Indicators(),
          PinViews(),
          Loaders(),
        ],
      ),
    ),
  );
}
