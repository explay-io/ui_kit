import 'package:flutter/material.dart';

typedef Callback = void Function(String value);

class EmailInput extends StatelessWidget {
  static void defaultOnChanged (_) {}

  final String errorText;
  final Callback onChanged;
  late final TextEditingController controller;

  EmailInput({
    this.errorText = '',
    controller,
    this.onChanged = defaultOnChanged
  }) {
    this.controller = controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        key: const Key('email'),
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        controller: controller,
        decoration: InputDecoration(
            labelText: 'Email Address',
            labelStyle: const TextStyle(fontSize: 18, height: -1.0),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            hintStyle: const TextStyle(color: Colors.white30),
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red)),
        autofocus: true,
        onChanged: onChanged);
  }
}
