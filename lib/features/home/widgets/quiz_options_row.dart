
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/extensions/string_extensions.dart';

class QuizOptionsRow extends StatelessWidget {
  const QuizOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: _QuizCard(
            icon: Icons.shuffle_rounded,
            title: 'Random\nQuiz',
            subtitle: '500+ topics',
            containerColor: colors.primaryContainer,
            accentColor: colors.onPrimaryContainer,
            badge: 'Popular',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuizCard(
            icon: Icons.history_edu_rounded,
            title: 'Previous\nYear Qs',
            subtitle: '2015 – 2024',
            containerColor: colors.secondaryContainer,
            accentColor: colors.onSecondaryContainer,
            badge: 'New',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _QuizCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color containerColor;
  final Color accentColor;
  final String badge;
  final VoidCallback onTap;

  const _QuizCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.containerColor,
    required this.accentColor,
    required this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: accentColor, size: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            title.titleMedium(context),
            const SizedBox(height: 3),
            subtitle.bodyLarge(context),
          ],
        ),
      ),
    );
  }
}

