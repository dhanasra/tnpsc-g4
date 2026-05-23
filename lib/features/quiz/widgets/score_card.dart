import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final int correct;
  final int total;
  final int score;
  final String timeTaken;

  const ScoreCard({super.key, 
    required this.correct,
    required this.total,
    required this.score,
    required this.timeTaken,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '$correct/$total',
            style: const TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1C1C1E),
              letterSpacing: -2,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$score% Score',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2F9E44),
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _MiniStatBox(
                  iconWidget: _TargetIcon(color: const Color(0xFF2F9E44)),
                  value: '$score%',
                  label: 'Accuracy',
                  bgColor: const Color(0xFFDCF5E4),
                  valueColor: const Color(0xFF2F9E44),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MiniStatBox(
                  iconWidget: const Icon(
                    Icons.access_time_rounded,
                    color: Color(0xFF9C36B5),
                    size: 24,
                  ),
                  value: timeTaken,
                  label: 'Time Taken',
                  bgColor: const Color(0xFFF3D9FA),
                  valueColor: const Color(0xFF9C36B5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStatBox extends StatelessWidget {
  final Widget iconWidget;
  final String value;
  final String label;
  final Color bgColor;
  final Color valueColor;

  const _MiniStatBox({
    required this.iconWidget,
    required this.value,
    required this.label,
    required this.bgColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          iconWidget,
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: valueColor,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6C6C70),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TargetIcon extends StatelessWidget {
  final Color color;
  const _TargetIcon({required this.color});

  @override
  Widget build(BuildContext context) =>
      SizedBox(width: 24, height: 24, child: CustomPaint(painter: _TargetPainter(color: color)));
}

class _TargetPainter extends CustomPainter {
  final Color color;
  const _TargetPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;
    canvas.drawCircle(c, size.width / 2, paint);
    canvas.drawCircle(c, size.width / 3.2, paint);
    canvas.drawCircle(c, size.width / 6.5, paint);
    canvas.drawCircle(c, 2.2, paint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(_) => false;
}