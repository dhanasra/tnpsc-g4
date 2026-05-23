import 'package:flutter/material.dart';

class ThisWeekCard extends StatelessWidget {
  final String questions;
  final String accuracy;
  final String timeSpent;

  const ThisWeekCard({super.key, 
    required this.questions,
    required this.accuracy,
    required this.timeSpent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _WeekStat(
              value: questions,
              label: 'Questions',
              color: const Color(0xFF3B5BDB)),
          Container(width: 1, height: 36, color: const Color(0xFFE5E5EA)),
          _WeekStat(
              value: accuracy,
              label: 'Accuracy',
              color: const Color(0xFF51CF66)),
          Container(width: 1, height: 36, color: const Color(0xFFE5E5EA)),
          _WeekStat(
              value: timeSpent,
              label: 'Time Spent',
              color: const Color(0xFFCC5DE8)),
        ],
      ),
    );
  }
}

class _WeekStat extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _WeekStat({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF8E8E93),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}