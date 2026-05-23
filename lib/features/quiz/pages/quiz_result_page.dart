import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnpsc_g4/app/routes/app_routes.dart';
import 'package:tnpsc_g4/app/routes/route_names.dart';

import '../bloc/quiz_bloc.dart';
import '../widgets/performance_card.dart';
import '../widgets/result_header.dart';
import '../widgets/score_card.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        // Kick off save as soon as we land here with a finished quiz
        if (state is QuizFinished) {
          context.read<QuizBloc>().add(SaveSession());
        }
      },
      builder: (context, state) {
        // Saving in progress
        if (state is QuizSaving || state is QuizFinished) {
          final data = state is QuizSaving ? state.finished : state as QuizFinished;
          return _ResultScaffold(
            correct: data.correct,
            wrong: data.wrong,
            total: data.total,
            timeTakenSeconds: data.timeTakenSeconds,
            isSaving: true,
          );
        }

        // Saved — show full result with actions enabled
        if (state is QuizSaved) {
          final s = state.session;
          return _ResultScaffold(
            correct: s.correct,
            wrong: s.wrong,
            total: s.totalQuestions,
            timeTakenSeconds: s.timeTakenSecs,
            isSaving: false,
          );
        }

        // Fallback
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _ResultScaffold extends StatelessWidget {
  final int correct;
  final int wrong;
  final int total;
  final int timeTakenSeconds;
  final bool isSaving;

  const _ResultScaffold({
    required this.correct,
    required this.wrong,
    required this.total,
    required this.timeTakenSeconds,
    required this.isSaving,
  });

  int get score => total == 0 ? 0 : ((correct / total) * 100).round();

  String get timeTakenString {
    final m = timeTakenSeconds ~/ 60;
    final s = timeTakenSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get avgTimePerQuestion {
    if (total == 0) return '0:00';
    final avg = timeTakenSeconds ~/ total;
    final m = avg ~/ 60;
    final s = avg % 60;
    return m > 0 ? '$m:${s.toString().padLeft(2, '0')}' : '0:${s.toString().padLeft(2, '0')}';
  }

  String get performanceLabel {
    if (score >= 90) return 'Excellent!';
    if (score >= 75) return 'Great effort!';
    if (score >= 50) return 'Keep practising!';
    return "Don't give up!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: Column(
        children: [
          ResultHeader(performanceLabel: performanceLabel, score: score),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -36),
                    child: ScoreCard(
                      correct: correct,
                      total: total,
                      score: score,
                      timeTaken: timeTakenString,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Column(
                      children: [
                        PerformanceCard(
                          correct: correct,
                          wrong: wrong,
                          avgTime: avgTimePerQuestion,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
            child: _PrimaryButton(
              label: isSaving ? 'Saving results…' : 'Go To Home',
              isLoading: isSaving,
              onTap: isSaving ? null : ()=>AppRoutes.pushAndRemoveUntil(context, RouteNames.home),
            ),
          ),
        ],
      ),
    );
  }
}


class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isLoading;

  const _PrimaryButton({
    required this.label,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isLoading
                ? [const Color(0xFF8899DD), const Color(0xFF99AAEE)]
                : [const Color(0xFF3B5BDB), const Color(0xFF4C6EF5)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isLoading
              ? []
              : [
                  BoxShadow(
                    color: const Color(0xFF3B5BDB).withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: -0.2,
                ),
              ),
      ),
    );
  }
}