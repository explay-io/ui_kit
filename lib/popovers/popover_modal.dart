import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_color.dart';

import 'high_popover_modal.dart';

class PopoverModal {
  Future<T> showPopover<T>(
    BuildContext context,
    Widget child,
  ) {
    return showModalBottomSheetCustom<T>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: const Color(0xFF737373),
            child: Container(
                decoration: const BoxDecoration(color: AppColor.deepWhite),
                child: child),
          );
        });
  }
}
