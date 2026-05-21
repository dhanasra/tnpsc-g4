
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/extensions/size_extensions.dart';
import '../../../core/extensions/string_extensions.dart';

class RecentActivities extends StatelessWidget {
  final _activities = const [
    _ActivityData(
      topic: 'General Science',
      score: '8/10',
      date: 'Yesterday',
      icon: '🔬',
      percent: 0.8,
    ),
    _ActivityData(
      topic: 'Indian History',
      score: '6/10',
      date: '2 days ago',
      icon: '🏛️',
      percent: 0.6,
    ),
    _ActivityData(
      topic: 'Mathematics',
      score: '9/10',
      date: '3 days ago',
      icon: '📐',
      percent: 0.9,
    ),
  ];

  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Recent Activity'.titleLarge(context, fontWeight: FontWeight.w400),
            TextButton(onPressed: (){}, child: 'View All'.bodyLarge(context))
          ],
        ),
        const SizedBox(height: 12),
        ..._activities.map((a) => _ActivityTile(data: a)),
      ],
    );
  }
}

class _ActivityData {
  final String topic;
  final String score;
  final String date;
  final String icon;
  final double percent;

  const _ActivityData({
    required this.topic,
    required this.score,
    required this.date,
    required this.icon,
    required this.percent,
  });
}

class _ActivityTile extends StatelessWidget {
  final _ActivityData data;
  const _ActivityTile({required this.data});

  Color _scoreColor(ColorScheme colors) {
    if (data.percent >= 0.8) return colors.primary;
    if (data.percent >= 0.6) return colors.tertiary;
    return colors.error;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final scoreColor = _scoreColor(colors);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: colors.outlineVariant.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(data.icon,
                  style: const TextStyle(fontSize: 22)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data.topic.bodyLarge(context),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: data.percent,
                    minHeight: 4,
                    backgroundColor: colors.outlineVariant.withOpacity(0.4),
                    valueColor: AlwaysStoppedAnimation(scoreColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              data.score.bodyLarge(context),
              2.h,
              data.date.labelLarge(context, fontWeight: FontWeight.w400)
            ],
          ),
        ],
      ),
    );
  }
}