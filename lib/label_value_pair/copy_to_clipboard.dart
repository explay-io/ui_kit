import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/colors/app_color.dart';

class CopyToClipboard extends StatelessWidget {
  final String? value;

  const CopyToClipboard({this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(text: value));
          const snackBar = SnackBar(content: Text('Copied to clipboard'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: IconTheme(
            data: IconTheme.of(context).copyWith(color: AppColor.blue),
            child: const Icon(
              Icons.content_copy,
              size: 20.0,
            )),
      ),
    );
  }
}
