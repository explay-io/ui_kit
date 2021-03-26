import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://oblador.github.io/react-native-vector-icons/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
