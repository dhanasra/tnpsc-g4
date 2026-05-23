import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/models/overall_stats.dart';
import '../../../core/models/weekly_stats.dart';
import '../../../core/services/analytics_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeStats>(_onLoad);
  }

  void _onLoad(LoadHomeStats event, Emitter<HomeState> emit) {
    final overall = AnalyticsService.getOverallStats();
    final weekly = AnalyticsService.getWeeklyStats();
    emit(HomeLoaded(overall: overall, weekly: weekly));
  }
}
