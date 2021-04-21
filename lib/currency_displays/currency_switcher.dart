import 'package:flutter/material.dart';
import 'package:ui_kit/buttons/switcher_button.dart';
import 'package:ui_kit/currency_displays/currency_display.dart';

class CurrencyInfo {
  final String symbol;
  final String label;
  final bool prefix;
  final String amount;

  CurrencyInfo(
      {required this.symbol,
      required this.label,
      this.amount = '0',
      this.prefix = false});

  CurrencyInfo copyWith({
      required String symbol,
      required String label,
      bool prefix = false,
      String amount = '0'
  }) {
    return CurrencyInfo(
      symbol: symbol,
      label: label,
      prefix: prefix,
      amount: amount
    );
  }
}

class CurrencySwitcher extends StatefulWidget {
  final List<CurrencyInfo> currencyInfoList;
  final List<String> amounts;
  final Function(int) onSwitch;

  static void defaultOnSwitch(int index) {}

  CurrencySwitcher({
    required this.currencyInfoList,
    required this.amounts,
    this.onSwitch = defaultOnSwitch,
  })
      : assert(currencyInfoList.length == 2);

  @override
  _CurrencySwitcherState createState() => _CurrencySwitcherState();
}

class _CurrencySwitcherState extends State<CurrencySwitcher> {
  List<String> get amounts => widget.amounts;
  List<CurrencyInfo> get infoList => widget.currencyInfoList;

  Function(int) get onSwitch => widget.onSwitch;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: _buildDisplay(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SwitcherButton(
                labels: [infoList[0].label, infoList[1].label],
                onSwitch: _switch,
              ),
            ),
          ],
        ));
  }

  Widget _buildDisplay() {
    if (amounts.isEmpty) {
      return CurrencyDisplay(
          currencySymbol: infoList[_currentIndex == 0 ? 1 : 0].symbol);
    }

    Widget first = Container();
    Widget second = Container();

    if (amounts.isNotEmpty) {
      first = CurrencyDisplay(
          displayAsPrefix: infoList[1].prefix,
          currencySymbol: infoList[1].symbol,
          amount: amounts[1],
          showCursor: _currentIndex == 0,
          size: _currentIndex == 0
              ? CurrencyDisplaySize.large
              : CurrencyDisplaySize.small);
    }
    if (amounts.length > 1) {
      second = CurrencyDisplay(
          displayAsPrefix: infoList[0].prefix,
          currencySymbol: infoList[0].symbol,
          amount: amounts[0],
          showCursor: _currentIndex == 1,
          size: _currentIndex == 1
              ? CurrencyDisplaySize.large
              : CurrencyDisplaySize.small);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _currentIndex == 0
          ? [
              first,
              const SizedBox(
                height: 6,
              ),
              second
            ]
          : [
              second,
              const SizedBox(
                height: 6,
              ),
              first
            ],
    );
  }

  void _switch(int index) {
    setState(() {
      _currentIndex = index;
      onSwitch(index);
    });
  }
}
