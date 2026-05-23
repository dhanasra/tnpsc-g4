part of 'previous_year_bloc.dart';

@immutable
sealed class PreviousYearState {}

final class PreviousYearInitial extends PreviousYearState {}

class PreviousYearLoading extends PreviousYearState {}

class PreviousYearLoaded extends PreviousYearState {
  final List<ExamPaper> papers;
  PreviousYearLoaded(this.papers);
}

class PreviousYearError extends PreviousYearState {
  final String message;
  PreviousYearError(this.message);
}