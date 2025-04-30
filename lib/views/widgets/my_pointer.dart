import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyPointer extends CustomPainter {
  final DateTime date;

  MyPointer(this.date);
  @override
  void paint(Canvas canvas, Size size) {
    final second = date.second;
    final minute = date.minute;
    final hour = date.hour % 12;
    final center = Offset(size.width / 2, size.height / 2);
    var fillCircle =
        Paint()
          ..color = Colors.blueGrey
          ..style = PaintingStyle.fill
          ..strokeWidth = 2;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 150, fillCircle);
    final hourArrow = Paint();
    hourArrow.color = Colors.pink;
    hourArrow.style = PaintingStyle.stroke;
    hourArrow.strokeWidth = 15;

    final hourAngle = ((hour + minute / 60) * 30) * math.pi / 180;
    final hourRadius = 80;
    final endHourX = center.dx + hourRadius * math.sin(hourAngle);
    final endHoury = center.dy - hourRadius * math.cos(hourAngle);
    canvas.drawLine(center, Offset(endHourX, endHoury), hourArrow);

    final minutArrow = Paint();
    minutArrow.color = Colors.blue;
    minutArrow.style = PaintingStyle.stroke;
    minutArrow.strokeWidth = 10;

    final minuteAngle = ((minute + second / 60) * 6) * math.pi / 180;
    final minuteRadius = 100;
    final endMinuteX = center.dx + minuteRadius * math.sin(minuteAngle);
    final endMinutey = center.dy - minuteRadius * math.cos(minuteAngle);

    canvas.drawLine(center, Offset(endMinuteX, endMinutey), minutArrow);

    final secondArrow = Paint();
    secondArrow.color = Colors.yellow;
    secondArrow.style = PaintingStyle.stroke;
    secondArrow.strokeWidth = 5;

    final secondAngle = (second * 6) * math.pi / 180;
    final secondRadius = 130.0;

    final endSecondX = center.dx + secondRadius * math.sin(secondAngle);
    final endSecondY = center.dy - secondRadius * math.cos(secondAngle);

    canvas.drawLine(center, Offset(endSecondX, endSecondY), secondArrow);

    var strokeCircle =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 30;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      150,
      strokeCircle,
    );
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 1; i <= 12; i++) {
      final angle = (i * 30) * math.pi / 180;
      final radius = 150.0;
      final x = size.width / 2 + radius * math.sin(angle);
      final y = size.height / 2 - radius * math.cos(angle);

      textPainter.text = TextSpan(
        text: '$i',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

      textPainter.layout();

      final offset = Offset(
        x - textPainter.width / 2,
        y - textPainter.height / 2,
      );

      textPainter.paint(canvas, offset);
    }

    var centerCircle =
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill
          ..strokeWidth = 10;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      15,
      centerCircle,
    );
  }

  @override
  bool shouldRepaint(covariant MyPointer oldPainter) {
    return true;
  }
}
