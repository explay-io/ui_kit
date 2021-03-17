import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

typedef Callback = void Function(DateTime value);

class CustomDatePicker extends StatelessWidget {
  final _format = 'dd-MM-yyyy';
  final _dayCtrl = TextEditingController();
  final _monthCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();
  final Callback onChange;
  final DateTime dateTime;

  CustomDatePicker({@required this.onChange, this.dateTime});

  @override
  Widget build(BuildContext context) {
    if (dateTime != null) {
      updateState(dateTime);
    }
    return
        Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          new Flexible(
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
                            hintStyle: const TextStyle(color: Colors.white30),
                          ),
                          onTap: () {
                            _showDatePicker(context);
                          }))),
          new Flexible(
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
                      hintStyle: const TextStyle(color: Colors.black26),
                    ),
                    onTap: () {
                      _showDatePicker(context);
                    },
                  ))),
          new Flexible(
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
                      hintStyle: const TextStyle(color: Colors.black26),
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
      initialDateTime: dateTime == null ? DateTime.now() : dateTime,
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
    _dayCtrl.text =
        dateTime != null ? dateTime.day.toString().padLeft(2, '0') : dateTime;
    _monthCtrl.text =
        dateTime != null ? dateTime.month.toString().padLeft(2, '0') : dateTime;
    _yearCtrl.text = dateTime != null ? dateTime.year.toString() : dateTime;
  }
}

class DisabledFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}