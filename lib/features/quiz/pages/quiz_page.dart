import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/routes/route_names.dart';
import '../../../core/models/quiz_question.dart';
import '../bloc/quiz_bloc.dart';
import '../widgets/option_tile.dart';

class QuizPage extends StatelessWidget {
  final QuizType quizType;
  final String? paperCode;

  const QuizPage({
    super.key,
    required this.quizType,
    this.paperCode,
  });

  @override
  Widget build(BuildContext context) {
    return const _QuizView();
  }
}

class _QuizView extends StatefulWidget {
  const _QuizView();

  @override
  State<_QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<_QuizView> {
  int _secondsLeft = 890;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _timeString {
    final m = _secondsLeft ~/ 60;
    final s = _secondsLeft % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  bool get _isLowTime => _secondsLeft < 60;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizFinished) {
          AppRoutes.pushAndRemoveUntil(context, RouteNames.quizResult, arguments: context);
        }
      },
      builder: (context, state) {
        if (state is QuizLoading || state is QuizInitial) {
          return const Scaffold(
            backgroundColor: Color(0xFFF2F2F7),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is QuizError) {
          return Scaffold(
            backgroundColor: const Color(0xFFF2F2F7),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 48, color: Color(0xFFAEAEB2)),
                    const SizedBox(height: 12),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xFF8E8E93), fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      onPressed: () => context
                          .read<QuizBloc>()
                          .add(StartQuiz(type: QuizType.random)),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is QuizInProgress) {
          return _QuizContent(
            state: state,
            timeString: _timeString,
            isLowTime: _isLowTime,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

// ── Quiz Content ──────────────────────────────────────────────────────────────

class _QuizContent extends StatelessWidget {
  final QuizInProgress state;
  final String timeString;
  final bool isLowTime;

  const _QuizContent({
    required this.state,
    required this.timeString,
    required this.isLowTime,
  });

  Color _optionBg(String key) {
    if (!state.answered) return Colors.white;
    if (key == state.currentQuestion.correctAnswer) return const Color(0xFFDCF5E4);
    if (key == state.selectedOption) return const Color(0xFFFFE3E3);
    return Colors.white;
  }

  Color _optionBorder(String key) {
    if (!state.answered) {
      return key == state.selectedOption
          ? const Color(0xFF3B5BDB)
          : const Color(0xFFE5E5EA);
    }
    if (key == state.currentQuestion.correctAnswer) return const Color(0xFF2F9E44);
    if (key == state.selectedOption) return const Color(0xFFFA5252);
    return const Color(0xFFE5E5EA);
  }

  Color _radioColor(String key) {
    if (!state.answered) {
      return key == state.selectedOption
          ? const Color(0xFF3B5BDB)
          : const Color(0xFFAEAEB2);
    }
    if (key == state.currentQuestion.correctAnswer) return const Color(0xFF2F9E44);
    if (key == state.selectedOption) return const Color(0xFFFA5252);
    return const Color(0xFFAEAEB2);
  }

  @override
  Widget build(BuildContext context) {
    final q = state.currentQuestion;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: SafeArea(
        child: Column(
          children: [
            // ── Top Bar ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_back_rounded,
                          size: 20, color: Color(0xFF1C1C1E)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time_rounded,
                            size: 15,
                            color: isLowTime
                                ? const Color(0xFFE8590C)
                                : const Color(0xFFE8590C)),
                        const SizedBox(width: 5),
                        Text(
                          timeString,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isLowTime
                                ? const Color(0xFFE8590C)
                                : const Color(0xFFE8590C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ── Progress ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question ${state.currentIndex + 1} of ${state.totalQuestions}',
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6C6C70),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${(state.progress * 100).round()}%',
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6C6C70),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: LinearProgressIndicator(
                      value: state.progress,
                      minHeight: 6,
                      backgroundColor: const Color(0xFFE5E5EA),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF3B5BDB)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ── Content ──────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Question card
                    Container(
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              q.questionText,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1C1C1E),
                                letterSpacing: -0.3,
                                height: 1.4,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.flag_outlined,
                              size: 20, color: Color(0xFFAEAEB2)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Options
                    Expanded(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: q.optionKeys.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, i) {
                          final key = q.optionKeys[i];
                          final option = q.options[key]!;
                          return OptionTile(
                            optionKey: key,
                            label: option.text,
                            isSelected: state.selectedOption == key,
                            bgColor: _optionBg(key),
                            borderColor: _optionBorder(key),
                            radioColor: _radioColor(key),
                            onTap: () => context
                                .read<QuizBloc>()
                                .add(SelectOption(key)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Next Button ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              child: GestureDetector(
                onTap: state.answered
                    ? () => context.read<QuizBloc>().add(NextQuestion())
                    : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: state.answered
                        ? const Color(0xFF3B5BDB)
                        : const Color(0xFFE5E5EA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    state.isLastQuestion ? 'Finish Quiz' : 'Next Question',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: state.answered
                          ? Colors.white
                          : const Color(0xFFAEAEB2),
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}