import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/models/overall_stats.dart';
import '../../../core/models/weekly_stats.dart';
import '../../../core/services/analytics_service.dart';

part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(AnalyticsInitial()) {
    on<AnalyticsLoadRequested>(_onLoad);
  }
 
  Future<void> _onLoad(
    AnalyticsLoadRequested event,
    Emitter<AnalyticsState> emit,
  ) async {
    emit(AnalyticsLoading());
    try {
      final overall = AnalyticsService.getOverallStats();
      final weekly = AnalyticsService.getWeeklyStats();
      emit(AnalyticsLoaded(overall: overall, weekly: weekly));
    } catch (e) {
      emit(AnalyticsError(e.toString()));
    }
  }
}