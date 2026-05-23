import 'package:flutter/material.dart';

class PerformanceCard extends StatelessWidget {
  final int correct;
  final int wrong;
  final String avgTime;

  const PerformanceCard({super.key, 
    required this.correct,
    required this.wrong,
    required this.avgTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.trending_up_rounded,
                  color: Color(0xFF3B5BDB), size: 20),
              SizedBox(width: 8),
              Text(
                'Performance',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C1C1E),
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFF2F2F7)),
          const SizedBox(height: 14),
          _PerformanceRow(
            label: 'Correct Answers',
            value: '$correct',
            valueColor: const Color(0xFF2F9E44),
          ),
          const SizedBox(height: 14),
          _PerformanceRow(
            label: 'Wrong Answers',
            value: '$wrong',
            valueColor: const Color(0xFFFA5252),
          ),
          const SizedBox(height: 14),
          _PerformanceRow(
            label: 'Avg. Time per Question',
            value: avgTime,
            valueColor: const Color(0xFF1C1C1E),
          ),
        ],
      ),
    );
  }
}

class _PerformanceRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _PerformanceRow({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF3A3A3C),
                fontWeight: FontWeight.w400)),
        Text(value,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: valueColor)),
      ],
    );
  }
}