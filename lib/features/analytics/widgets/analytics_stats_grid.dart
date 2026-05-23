import 'package:flutter/material.dart';

import '../../../core/models/overall_stats.dart';
import 'stat_card.dart';
import 'target_icon.dart';

class AnalyticsStatsGrid extends StatelessWidget {
  final OverallStats overall;

  const AnalyticsStatsGrid({super.key, required this.overall});

  String _formatHours(double hours) {
    if (hours < 1) return '${(hours * 60).round()}m';
    // Show one decimal only when not a whole number
    return hours % 1 == 0
        ? '${hours.toInt()}h'
        : '${hours.toStringAsFixed(1)}h';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                iconWidget: const Icon(
                  Icons.workspace_premium_rounded,
                  color: Color(0xFFF59F00),
                  size: 26,
                ),
                value: '${overall.totalQuestionsPracticed}',
                label: 'Total Questions',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                iconWidget: const TargetIcon(),
                value: '${overall.avgAccuracyPercent.round()}%',
                label: 'Avg Accuracy',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCard(
                iconWidget: const Icon(
                  Icons.access_time_rounded,
                  color: Color(0xFF3B82F6),
                  size: 26,
                ),
                value: _formatHours(overall.totalStudyHours),
                label: 'Study Time',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                iconWidget: const Icon(
                  Icons.calendar_month_rounded,
                  color: Color(0xFF9C36B5),
                  size: 26,
                ),
                value: '${overall.dayStreak}',
                label: 'Day Streak',
              ),
            ),
          ],
        ),
      ],
    );
  }
}