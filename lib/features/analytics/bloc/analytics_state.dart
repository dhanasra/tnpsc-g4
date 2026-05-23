part of 'analytics_bloc.dart';

@immutable
sealed class AnalyticsState {}

final class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}
 
class AnalyticsLoaded extends AnalyticsState {
  final OverallStats overall;
  final WeeklyStats weekly;
 
  AnalyticsLoaded({required this.overall, required this.weekly});
}
 
class AnalyticsError extends AnalyticsState {
  final String message;
  AnalyticsError(this.message);
}