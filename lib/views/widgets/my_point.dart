import 'package:flutter/material.dart';

class MyPoint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paintRect =
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10;
    paintRect.strokeCap = StrokeCap.butt;
    var rect = Rect.fromLTWH(0, 0, 100, 100);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(10)),
      paintRect,
    );

    var paintRectt =
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill
          ..strokeWidth = 10;
    var rectt = Rect.fromLTWH(200, 0, 100, 100);
    canvas.drawRect(rectt, paintRectt);

    var textPaint = TextPainter(
      text: TextSpan(
        text: 'Hello World',
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),

      textDirection: TextDirection.ltr,
    );
    textPaint.layout(maxWidth: size.width, minWidth: 0);
    textPaint.paint(canvas, Offset(180, 30));

    final paint = Paint();

    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 10;

    canvas.drawLine(
      Offset(size.width - 10, size.height / 2),
      Offset(10, size.height / 2),
      paint,
    );

    var paintCircle =
        Paint()
          ..color = Colors.yellow
          ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(150, 300), 100, paintCircle);
  }

  @override
  bool shouldRepaint(covariant MyPoint oldDelegate) {
    return false;
  }
}
