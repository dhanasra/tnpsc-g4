part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}


class QuizLoading extends QuizState {}

class QuizError extends QuizState {
  final String message;
  QuizError(this.message);
}

class QuizInProgress extends QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final String? selectedOption;
  final bool answered;

  QuizInProgress({
    required this.questions,
    required this.currentIndex,
    this.selectedOption,
    this.answered = false,
  });

  QuizQuestion get currentQuestion => questions[currentIndex];
  int get totalQuestions => questions.length;
  double get progress => (currentIndex + 1) / totalQuestions;
  bool get isLastQuestion => currentIndex == totalQuestions - 1;
  bool get isCorrect =>
      answered && selectedOption == currentQuestion.correctAnswer;

  QuizInProgress copyWith({
    int? currentIndex,
    String? selectedOption,
    bool? answered,
  }) =>
      QuizInProgress(
        questions: questions,
        currentIndex: currentIndex ?? this.currentIndex,
        selectedOption: selectedOption ?? this.selectedOption,
        answered: answered ?? this.answered,
      );
}

class QuizFinished extends QuizState {
  final List<QuizQuestion> questions;
  final Map<int, String> answers;
  final int timeTakenSeconds;
  final QuizType quizType;
  final String? paperCode;

  QuizFinished({
    required this.questions,
    required this.answers,
    required this.timeTakenSeconds,
    required this.quizType,
    this.paperCode,
  });

  int get total => questions.length;
  int get correct => answers.entries
      .where((e) => e.value == questions[e.key].correctAnswer)
      .length;
  int get wrong => total - correct;
}

class QuizSaved extends QuizState {
  final SessionResult session;
  QuizSaved(this.session);
}

class QuizSaving extends QuizState {
  final QuizFinished finished; // keep data accessible during save
  QuizSaving(this.finished);
}