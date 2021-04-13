import 'package:flutter/material.dart';
import 'package:ui_kit/indicators/custom_progress_dialog.dart';

late CustomProgressDialog pr;

class Loaders extends StatefulWidget {
  @override
  _LoadersState createState() => _LoadersState();
}

class _LoadersState extends State<Loaders> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    pr = CustomProgressDialog(context);

    pr.style(progressWidget: const CircularProgressIndicator());

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            pr.show();
          },
          child: Text(
            'Show loader',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
