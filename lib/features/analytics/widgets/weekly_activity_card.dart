import 'package:flutter/material.dart';

import '../../../core/models/weekly_stats.dart';

class WeeklyActivityCard extends StatelessWidget {
  final WeeklyStats weekly;

  const WeeklyActivityCard({super.key, required this.weekly});

  @override
  Widget build(BuildContext context) {
    final maxVal = weekly.dailyQuestions.isEmpty
        ? 1
        : weekly.dailyQuestions.reduce((a, b) => a > b ? a : b);

    // Avoid division by zero when all values are 0
    final effectiveMax = maxVal == 0 ? 1 : maxVal;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Weekly Activity',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C1C1E),
                  letterSpacing: -0.3,
                ),
              ),
              Text(
                '${weekly.totalQuestions} questions',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8E8E93),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(weekly.dailyQuestions.length, (i) {
                final count = weekly.dailyQuestions[i];
                final ratio = count / effectiveMax;
                final isToday = i == weekly.dailyQuestions.length - 1;

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Question count on top of bar
                        if (count > 0)
                          Text(
                            '$count',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: isToday
                                  ? const Color(0xFF7C3AED)
                                  : const Color(0xFF8E8E93),
                            ),
                          ),
                        const SizedBox(height: 4),
                        // Bar
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutCubic,
                          height: 110 * ratio,
                          decoration: BoxDecoration(
                            color: isToday
                                ? const Color(0xFF7C3AED)
                                : const Color(0xFF7C3AED).withOpacity(0.45),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Day label
                        Text(
                          weekly.dayLabels[i],
                          style: TextStyle(
                            fontSize: 11,
                            color: isToday
                                ? const Color(0xFF7C3AED)
                                : const Color(0xFF8E8E93),
                            fontWeight: isToday
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}