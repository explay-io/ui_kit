import 'dart:math';

import 'package:flutter/material.dart';

class GaugeIndicator extends StatelessWidget {
  final double width;
  final double dangerThreshold;
  final double safeThreshold;
  final double score;

  const GaugeIndicator({
    @required this.width,
    @required this.dangerThreshold,
    @required this.safeThreshold,
    @required this.score
  })
      :assert(width > 0),
       assert(dangerThreshold >= 0 && dangerThreshold < 1),
       assert(safeThreshold > 0 && safeThreshold <= 1 && safeThreshold > dangerThreshold),
       assert(score >= 0 && score <= 1);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: width / 2,
      child: Stack(
        children: <Widget>[
          _gauge(context)
        ],
      ));
  }

  Widget _gauge(BuildContext context) {
    return Container(
        width: width,
        height: width / 2,
        child: CustomPaint(
          painter: _GaugePainter(width, width / 2, score, dangerThreshold, safeThreshold),
        )
    );
  }
}

class _GaugePainter extends CustomPainter {

  final double width;
  final double height;
  final double score;
  final double dangerThreshold;
  final double safeThreshold;

  _GaugePainter(this.width, this.height, this.score, this.dangerThreshold, this.safeThreshold);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..isAntiAlias = true;


    final gaugeCenter = Offset(width/2, height);

    final bgDiameter = width * 0.92;
    final bgRadius = bgDiameter / 2;
    final bgOffset = (width - bgDiameter) / 2;
    final bgRect = Rect.fromCircle(center: gaugeCenter, radius: bgRadius);
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [const Color(0x2172efdb), const Color(0x003edbb5)]
    );
    final bgPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(Rect.fromLTWH(bgOffset, bgOffset, bgDiameter, bgRadius));

    canvas.drawArc(bgRect, pi, pi, true, bgPaint);

    final rect = Rect.fromCircle(center: gaugeCenter, radius: width / 2);
    const delta = 0.05;

    paint.color = const Color(0xffff6b6b);
    canvas.drawArc(rect, pi, pi * dangerThreshold - delta, false, paint);

    paint.color = const Color(0xff9da0a6);
    canvas.drawArc(rect, pi + pi * dangerThreshold, pi * (safeThreshold - dangerThreshold), false, paint);

    paint.color = const Color(0xff4ce2a7);
    canvas.drawArc(rect, 2 * pi - pi * (1 - safeThreshold) + delta, pi * (1 - safeThreshold) - delta, false, paint);

    final pointerCenter = gaugeCenter.translate(0, -7);
    paint.color = Colors.black;
    canvas.drawCircle(pointerCenter, 4.5, paint);

    final dx = cos(score * pi);
    final dy = sin(score * pi);
    final from = pointerCenter.translate(-8 * dx, -8 * dy);
    final to = pointerCenter.translate(-0.7 * height * dx, -0.7 * height * dy);
    canvas.drawLine(from, to, paint);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}
