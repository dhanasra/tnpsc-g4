part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final OverallStats overall;
  final WeeklyStats weekly;

  HomeLoaded({required this.overall, required this.weekly});
}