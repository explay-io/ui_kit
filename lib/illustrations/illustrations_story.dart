import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Illustrations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://undraw.co/illustrations',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
