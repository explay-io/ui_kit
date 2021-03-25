import 'package:flutter/material.dart';
import 'package:ui_kit/widgets/change_progress_dialog.dart';

CustomProgressDialog pr;

class Loaders extends StatefulWidget {
  @override
  _LoadersState createState() => _LoadersState();
}

class _LoadersState extends State<Loaders> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    pr = CustomProgressDialog(context);

    pr.style(progressWidget:const CircularProgressIndicator());

    return Scaffold(
      body: Center(,child: Text(
              'Show loader',
              style: TextStyle(color: Colors.white),
            ),
        child: RaisedButton(
            color: Colors.blue,
            onPressed: () {
              pr.show();
            })
            
      ),
    );
  }
}
