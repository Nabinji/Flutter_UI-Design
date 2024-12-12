import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../Utils/color.dart';

class ArcValueModel {
  final Color color;
  final double value;

  ArcValueModel({required this.color, required this.value});
}

class CustomArc180Painter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double bgWidth;
  final double blurWidth;
  final double space;
  final List<ArcValueModel> drwArcs;

  CustomArc180Painter(
      {required this.drwArcs,
      this.start = 0,
      this.end = 180,
      this.space = 5,
      this.width = 15,
      this.bgWidth = 10,
      this.blurWidth = 4});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width / 2,
    );

    Paint backgroundPaint = Paint();
    backgroundPaint.color = gray60.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startVal = 180.0 + start;
    var drawStart = startVal;
    canvas.drawArc(
      rect,
      radians(startVal),
      radians(180),
      false,
      backgroundPaint,
    );

    for (var arcObj in drwArcs) {
      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..color = arcObj.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      //Draw Shadow Arc
      Path path = Path();
      path.addArc(
        rect,
        radians(drawStart),
        radians(arcObj.value - space),
      );
      canvas.drawPath(path, shadowPaint);

      canvas.drawArc(
        rect,
        radians(drawStart),
        radians(arcObj.value - space),
        false,
        activePaint,
      );

      drawStart = drawStart + arcObj.value + space;
    }
  }

  @override
  bool shouldRepaint(CustomArc180Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArc180Painter oldDelegate) => false;
}
