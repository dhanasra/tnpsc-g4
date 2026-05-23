part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class StartQuiz extends QuizEvent {
  final QuizType type;
  final String? paperCode;

  StartQuiz({required this.type, this.paperCode});
}

class SelectOption extends QuizEvent {
  final String optionKey;
  SelectOption(this.optionKey);
}

class NextQuestion extends QuizEvent {}

class SaveSession extends QuizEvent {}