import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnpsc_g4/app/routes/app_routes.dart';
import 'package:tnpsc_g4/app/routes/route_names.dart';
import 'package:tnpsc_g4/core/ads/widgets/banner_ad_widget.dart';

import '../../../core/ads/widgets/interstitial_ad_service.dart';
import '../../../core/models/quiz_question.dart';
import '../bloc/home_bloc.dart';
import '../widgets/daily_challenge_card.dart';
import '../widgets/header.dart';
import '../widgets/practice_mode_card.dart';
import '../widgets/week_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    InterstitialAdService.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      bottomNavigationBar: BannerAdWidget(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          final streak = state is HomeLoaded
              ? '${state.overall.dayStreak}'
              : '—';
          final totalQ = state is HomeLoaded
              ? '${state.overall.totalQuestionsPracticed}'
              : '—';
          final weekQuestions = state is HomeLoaded
              ? '${state.weekly.totalQuestions}'
              : '—';
          final weekAccuracy = state is HomeLoaded
              ? '${state.weekly.totalQuestions == 0 ? 0 : ((state.weekly.totalCorrect / state.weekly.totalQuestions) * 100).round()}%'
              : '—';
          final weekHours = state is HomeLoaded
              ? _formatHours(state.weekly.totalTimeSecs)
              : '—';

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(streak: streak, totalQuestions: totalQ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: DailyChallengeCard(),
                ),

                const SizedBox(height: 28),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Practice Modes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1C1C1E),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PracticeModeCard(
                    icon: Icons.menu_book_rounded,
                    iconBg: const Color(0xFFEEF2FF),
                    iconColor: const Color(0xFF3B5BDB),
                    title: 'Previous Year Questions',
                    subtitle: 'Practice by year & subject',
                    onTap: () => AppRoutes.push(
                      context,
                      RouteNames.previousYearQuestions,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PracticeModeCard(
                    icon: Icons.track_changes_rounded,
                    iconBg: const Color(0xFFF3E8FF),
                    iconColor: const Color(0xFF9333EA),
                    title: 'Random Practice',
                    subtitle: 'Mixed questions from all topics',
                    onTap: () => AppRoutes.push(
                      context,
                      RouteNames.quiz,
                      arguments: {'type': QuizType.random},
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'This Week',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1C1C1E),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ThisWeekCard(
                    questions: weekQuestions,
                    accuracy: weekAccuracy,
                    timeSpent: weekHours,
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatHours(int totalSecs) {
    if (totalSecs >= 3600) {
      final h = totalSecs / 3600;
      return '${h.toStringAsFixed(1)}h';
    }
    final m = totalSecs ~/ 60;
    return '${m}m';
  }
}