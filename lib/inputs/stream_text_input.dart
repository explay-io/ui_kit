import 'dart:async';

import 'package:flutter/material.dart';

typedef OnChange = void Function(String value);
void defaultOnChange(value) {
  print('value has changed $value');
}

class StreamTextInput extends StatefulWidget {
  final Stream<String> value$;
  final OnChange onChange;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextAlign align;

  const StreamTextInput({
    Key? key,
    required this.value$,
    this.onChange = defaultOnChange,
    this.hintText,
    this.keyboardType,
    this.align,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _StreamTextInputState createState() => _StreamTextInputState();
}

class _StreamTextInputState extends State<StreamTextInput> {
  final _controller = TextEditingController();
  late StreamSubscription<String> _value$Subscription;

  @override
  void initState() {
    super.initState();
    _value$Subscription = widget.value$.listen((value) {
      _controller.text = value;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _value$Subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.value$,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: widget.keyboardType,
          textAlign: widget.align,
          textCapitalization: TextCapitalization.none,
          autocorrect: false,
          controller: _controller,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey),
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
          autofocus: true,
          onChanged: widget.onChange,
          obscureText: widget.obscureText,
        );
      },
    );
  }
}
