import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class CopyToClipboard extends StatelessWidget {
  final String value;

  const CopyToClipboard({this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(text: value));
          const snackBar =
              SnackBar(content: Text('Copied to clipboard'));
          ScaffoldMessenger.showSnackBar(snackBar);
        },
        child: IconTheme(
            data: IconTheme.of(context).copyWith(color: AppColors.secondary),
            child: const Icon(
              Icons.content_copy,
              size: 20.0,
            )),
      ),
    );
  }
}
