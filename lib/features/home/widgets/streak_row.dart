// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/extensions/string_extensions.dart';

class StreakRow extends StatelessWidget {
  const StreakRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            _StreakStat(
              icon: '🔥',
              value: '12',
              label: 'Day Streak',
              color: colors.error,
            ),
            VerticalDivider(
              width: 1,
              thickness: 0.5,
              indent: 14,
              endIndent: 14,
              color: colors.outlineVariant,
            ),
            _StreakStat(
              icon: '✅',
              value: '248',
              label: 'Quizzes Done',
              color: colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _StreakStat extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  final Color color;

  const _StreakStat({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 6),
            value.titleLarge(context),
            const SizedBox(height: 3),
            label.bodyLarge(context),
          ],
        ),
      ),
    );
  }
}