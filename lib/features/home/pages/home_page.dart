// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/extensions/size_extensions.dart';
import '../../../core/extensions/string_extensions.dart';
import '../widgets/daily_quiz_banner.dart';
import '../widgets/quiz_options_row.dart';
import '../widgets/recent_activities.dart';
import '../widgets/streak_row.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Good Morning 👋'.titleLarge(context),
            'Let\'s keep the streak going!'.bodyLarge(context),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings_outlined, color: colors.primary),
              iconSize: 20,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StreakRow(),
          16.h,
          DailyQuizBanner(),
          16.h,
          QuizOptionsRow(),
          16.h,
          RecentActivities(),
        ],
      ),
    );
  }
}
