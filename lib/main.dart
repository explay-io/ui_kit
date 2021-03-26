import 'package:ui_kit/stories/animations.dart';
import 'package:ui_kit/stories/badges.dart';
import 'package:ui_kit/stories/custom_label_value.dart';
import 'package:ui_kit/stories/buttons.dart';
import 'package:ui_kit/stories/cards.dart';
import 'package:ui_kit/stories/checkboxes.dart';
import 'package:ui_kit/stories/colors.dart';
import 'package:ui_kit/stories/currency_displays.dart';
import 'package:ui_kit/stories/illustrations.dart';
import 'package:ui_kit/stories/indicators.dart';
import 'package:ui_kit/stories/info_box.dart';
import 'package:ui_kit/stories/inputs.dart';
import 'package:ui_kit/stories/layouts.dart';
import 'package:ui_kit/stories/loader.dart';
import 'package:ui_kit/stories/numpads.dart';
import 'package:ui_kit/stories/pin_views.dart';
import 'package:ui_kit/stories/popover.dart';
import 'package:ui_kit/stories/sliders.dart';
import 'package:ui_kit/stories/typography.dart';
import 'package:ui_kit/stories/custom_icons.dart';
import 'package:ui_kit/stories/wizard.dart';
import 'package:ui_kit/story_book/story_book.dart';
import 'package:ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/custom_date_picker.dart';
import 'package:ui_kit/widgets/custom_radio/custom_radio.dart';
import 'package:ui_kit/widgets/layout/sliver_template.dart';
import 'package:ui_kit/widgets/sliver_widgets.dart';
import 'package:ui_kit/stories/progress_indicators.dart';
import 'package:ui_kit/stories/password_validators.dart';

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
          SliverTemplate(
              content: SliverWidgets().content(),
              sliverList: SliverWidgets().buildSliverList(),
              pinWidget: SliverWidgets().bottomButton()),
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
