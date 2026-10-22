import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum NavIcon { home, search, profile, settings }

/// Vector icons drawn on a 24x24 grid, scaled to the widget size.
class NavIconPainter extends CustomPainter {
  NavIconPainter({
    required this.icon,
    required this.color,
    required this.active,
  });

  final NavIcon icon;
  final Color color;
  final bool active;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 24, size.height / 24);

    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fill = Paint()
      ..color = active ? AppColors.accentTint : Colors.transparent
      ..style = PaintingStyle.fill;

    switch (icon) {
      case NavIcon.home:
        final p = Path()
          ..moveTo(4, 11)
          ..lineTo(12, 4)
          ..lineTo(20, 11)
          ..lineTo(20, 20)
          ..lineTo(15, 20)
          ..lineTo(15, 15)
          ..lineTo(9, 15)
          ..lineTo(9, 20)
          ..lineTo(4, 20)
          ..close();
        canvas.drawPath(p, fill);
        canvas.drawPath(p, stroke);
        break;

      case NavIcon.search:
        canvas.drawCircle(const Offset(11, 11), 6, fill);
        canvas.drawCircle(const Offset(11, 11), 6, stroke);
        canvas.drawLine(const Offset(15.5, 15.5), const Offset(20, 20), stroke);
        break;

      case NavIcon.profile:
        canvas.drawCircle(const Offset(12, 8), 4, fill);
        canvas.drawCircle(const Offset(12, 8), 4, stroke);
        final body = Path()
          ..moveTo(4, 20)
          ..cubicTo(4, 16, 7.6, 14, 12, 14)
          ..cubicTo(16.4, 14, 20, 16, 20, 20)
          ..close();
        canvas.drawPath(body, fill);
        canvas.drawPath(body, stroke);
        break;

      case NavIcon.settings:
        for (final y in [6.0, 12.0, 18.0]) {
          canvas.drawLine(Offset(4, y), Offset(20, y), stroke);
        }
        final knobBg = Paint()..color = Colors.white;
        for (final k in const [Offset(9, 6), Offset(15, 12), Offset(8, 18)]) {
          canvas.drawCircle(k, 2.2, knobBg);
          canvas.drawCircle(k, 2.2, fill);
          canvas.drawCircle(k, 2.2, stroke);
        }
        break;
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(NavIconPainter old) =>
      old.icon != icon || old.color != color || old.active != active;
}
