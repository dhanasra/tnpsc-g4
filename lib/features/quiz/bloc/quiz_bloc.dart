import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/models/quiz_question.dart';
import '../../../core/models/session_result.dart';
import '../../../core/services/analytics_service.dart';
import '../../../core/services/questions_service.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizService _quizService;

  final Map<int, String> _answers = {};
  int _startTimestamp = 0;
  QuizType _quizType = QuizType.random;
  String? _paperCode;

  QuizBloc({QuizService? quizService})
      : _quizService = quizService ?? QuizService(),
        super(QuizInitial()) {
    on<StartQuiz>(_onStartQuiz);
    on<SelectOption>(_onSelectOption);
    on<NextQuestion>(_onNextQuestion);
    on<SaveSession>(_onSaveSession);
  }

  Future<void> _onStartQuiz(StartQuiz event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
    _answers.clear();
    _quizType = event.type;
    _paperCode = event.paperCode;

    try {
      final response = await _fetchQuestions(event);
      final body = response.data as Map<String, dynamic>;

      if (body['status'] != 'success') {
        emit(QuizError(body['message'] ?? 'Failed to load questions'));
        return;
      }

      final rawList = body['data']['questions'] as List<dynamic>;
      if (rawList.isEmpty) {
        emit(QuizError('No questions available'));
        return;
      }

      final questions = rawList
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList();

      _startTimestamp = DateTime.now().millisecondsSinceEpoch;
      emit(QuizInProgress(questions: questions, currentIndex: 0));
    } catch (e) {
      emit(QuizError(e.toString()));
    }
  }

  void _onSelectOption(SelectOption event, Emitter<QuizState> emit) {
    final current = state;
    if (current is! QuizInProgress || current.answered) return;

    _answers[current.currentIndex] = event.optionKey;
    emit(current.copyWith(selectedOption: event.optionKey, answered: true));
  }

  void _onNextQuestion(NextQuestion event, Emitter<QuizState> emit) {
    final current = state;
    if (current is! QuizInProgress || !current.answered) return;

    if (current.isLastQuestion) {
      final elapsed =
          (DateTime.now().millisecondsSinceEpoch - _startTimestamp) ~/ 1000;

      emit(QuizFinished(
        questions: current.questions,
        answers: Map.unmodifiable(_answers),
        timeTakenSeconds: elapsed,
        quizType: _quizType,
        paperCode: _paperCode,
      ));
      return;
    }

    emit(current.copyWith(
      currentIndex: current.currentIndex + 1,
      selectedOption: null,
      answered: false,
    ));
  }

  Future<void> _onSaveSession(
      SaveSession event, Emitter<QuizState> emit) async {
    final finished = state;
    if (finished is! QuizFinished) return;

    emit(QuizSaving(finished));

    final session = SessionResult(
      id: '${finished.quizType.name}_${DateTime.now().millisecondsSinceEpoch}',
      correct: finished.correct,
      wrong: finished.wrong,
      totalQuestions: finished.total,
      timeTakenSecs: finished.timeTakenSeconds,
      completedAt: DateTime.now(),
      quizType: finished.quizType.name,
      paperCode: finished.paperCode,
    );

    await AnalyticsService.recordSession(session);
    emit(QuizSaved(session));
  }

  Future _fetchQuestions(StartQuiz event) {
    switch (event.type) {
      case QuizType.previousYear:
        assert(event.paperCode != null,
            'paperCode is required for previousYear quiz');
        return _quizService.startPreviousYearQuiz(
            paperCode: event.paperCode!);
      case QuizType.random:
        return _quizService.startRandomQuiz();
      case QuizType.dailyQuiz:
        return _quizService.startDailyQuiz();
    }
  }
}