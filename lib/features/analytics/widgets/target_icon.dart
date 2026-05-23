import 'package:flutter/material.dart';

class TargetIcon extends StatelessWidget {
  final Color color;

  const TargetIcon({super.key, this.color = const Color(0xFF2F9E44)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26,
      height: 26,
      child: CustomPaint(painter: _TargetPainter(color: color)),
    );
  }
}

class _TargetPainter extends CustomPainter {
  final Color color;
  const _TargetPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;

    canvas.drawCircle(c, size.width / 2, stroke);
    canvas.drawCircle(c, size.width / 3.2, stroke);
    canvas.drawCircle(c, size.width / 6.5, stroke);
    canvas.drawCircle(c, 2.2, stroke..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(_) => false;
}