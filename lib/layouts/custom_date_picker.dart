import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

typedef Callback = void Function(DateTime value);

class CustomDatePicker extends StatelessWidget {
  final _format = 'dd-MM-yyyy';
  final _dayCtrl = TextEditingController();
  final _monthCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();
  final Callback onChange;
  late final DateTime dateTime;

  CustomDatePicker({
    required this.onChange,
    dateTime,
  }) {
    this.dateTime = dateTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    updateState(dateTime);
    return
        Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Flexible(
                  child: Container(
                      width: 75,
                      child: TextField(
                          focusNode: DisabledFocusNode(),
                          controller: _dayCtrl,
                          key: const Key('day-of-birth'),
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            labelText: 'Day',
                            hintText: 'DD',
                            hintStyle: TextStyle(color: Colors.white30),
                          ),
                          onTap: () {
                            _showDatePicker(context);
                          }))),
          Flexible(
              child: Container(
                  width: 75,
                  child: TextField(
                    focusNode: DisabledFocusNode(),
                    controller: _monthCtrl,
                    key: const Key('month-of-birth'),
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Month',
                      hintText: 'MM',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                    onTap: () {
                      _showDatePicker(context);
                    },
                  ))),
          Flexible(
              child: Container(
                  width: 75,
                  child: TextField(
                    focusNode: DisabledFocusNode(),
                    controller: _yearCtrl,
                    key: const Key('year-of-birth'),
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      labelText: 'Year',
                      hintText: 'YYYY',
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                    onTap: () {
                      _showDatePicker(context);
                    },
                  )))
        ]));
  }

  void _showDatePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      initialDateTime: dateTime,
      dateFormat: _format,
      onCancel: () {
        updateState(dateTime);
      },
      onChange: (dateTime, List<int> index) {
        updateState(dateTime);
        onChange(dateTime);
      },
      onConfirm: (_dateTime, List<int> index) {
        updateState(_dateTime);
        onChange(_dateTime);
      },
    );
  }

  void updateState(DateTime dateTime) {
    _dayCtrl.text = dateTime.day.toString().padLeft(2, '0');
    _monthCtrl.text = dateTime.month.toString().padLeft(2, '0');
    _yearCtrl.text = dateTime.year.toString();
  }
}

class DisabledFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
