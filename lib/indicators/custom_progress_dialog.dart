import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool _isShowing = false;
bool _showLogs = false;

Widget _progressWidget = Image.asset(
  'assets/double_ring_loading_io.gif',
  package: 'progress_dialog',
);

late BuildContext _dismissingContext;

class CustomProgressDialog {
  static const double defaultDialogElevation = 8.0;
  static const double defaultBorderRadius = 8.0;
  static const Color defaultBackgroundColor = Colors.white;
  static const Curve defaultInsetAnimCurve = Curves.easeInOut;

  double _dialogElevation = defaultDialogElevation;
  double _borderRadius = defaultBorderRadius;
  Color _backgroundColor = defaultBackgroundColor;
  Curve _insetAnimCurve = defaultInsetAnimCurve;

  late _Body _dialog;
  late BuildContext _context;
  bool _barrierDismissible = true;

  CustomProgressDialog(BuildContext context,
      {bool isDismissible = true, bool showLogs = false}) {
    _context = context;
    _barrierDismissible = isDismissible;
    _showLogs = showLogs;
  }

  void style({
    required Widget progressWidget,
    Color backgroundColor = defaultBackgroundColor,
    double elevation = defaultDialogElevation,
    double borderRadius = defaultBorderRadius,
    Curve insetAnimCurve = defaultInsetAnimCurve,
  }) {
    if (_isShowing) return;

    _progressWidget = progressWidget;
    _backgroundColor = backgroundColor;
    _dialogElevation = elevation;
    _borderRadius = borderRadius;
    _insetAnimCurve = insetAnimCurve;
  }

  void update({required Widget progressWidget}) {
    _progressWidget = _progressWidget;

    if (_isShowing) {
      _dialog.update();
    }
  }

  bool isShowing() {
    return _isShowing;
  }

  void dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop();
          if (_showLogs) {
            debugPrint('ProgressDialog dismissed');
          }
        } else {
          if (_showLogs) {
            debugPrint('Cant pop ProgressDialog');
          }
        }
      } on Exception catch (_) {}
    } else {
      if (_showLogs) {
        debugPrint('ProgressDialog already dismissed');
      }
    }
  }

  Future<bool> hide() {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop(true);
        if (_showLogs) {
          debugPrint('ProgressDialog dismissed');
        }
        return Future.value(true);
      } on Exception catch (_) {
        return Future.value(false);
      }
    } else {
      if (_showLogs) {
        debugPrint('ProgressDialog already dismissed');
      }
      return Future.value(false);
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = _Body();
      _isShowing = true;

      if (_showLogs) {
        debugPrint('ProgressDialog shown');
      }

      showDialog<dynamic>(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _dismissingContext = context;
          return WillPopScope(
            onWillPop: () {
              return Future.value(_barrierDismissible);
            },
            child: Dialog(
                backgroundColor: _backgroundColor,
                insetAnimationCurve: _insetAnimCurve,
                insetAnimationDuration: const Duration(milliseconds: 100),
                elevation: _dialogElevation,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(_borderRadius))),
                child: _dialog),
          );
        },
      );
    } else {
      if (_showLogs) {
        debugPrint('ProgressDialog already shown/showing');
      }
    }
  }
}

class _Body extends StatefulWidget {
  final _BodyState _dialog = _BodyState();

  void update() {
    _dialog.update();
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  void update() {}

  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs) {
      debugPrint('ProgressDialog dismissed by back button');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0,
      child: SizedBox(
        width: 60.0,
        height: 60.0,
        child: _progressWidget,
      ),
    );
  }
}
