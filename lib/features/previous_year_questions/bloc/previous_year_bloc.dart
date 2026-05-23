import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/models/exam_paper_model.dart';
import '../../../core/services/questions_service.dart';

part 'previous_year_event.dart';
part 'previous_year_state.dart';

class PreviousYearBloc extends Bloc<PreviousYearEvent, PreviousYearState> {
  final QuizService _quizService;

  PreviousYearBloc({QuizService? quizService})
      : _quizService = quizService ?? QuizService(),
        super(PreviousYearInitial()) {
    on<FetchPreviousYearExams>(_onFetchExams);
  }

  Future<void> _onFetchExams(
    FetchPreviousYearExams event,
    Emitter<PreviousYearState> emit,
  ) async {
    emit(PreviousYearLoading());
    try {
      final response = await _quizService.getPreviousYearExams();
      final body = response.data as Map<String, dynamic>;

      if (body['status'] == 'success') {
        final rawList = body['data']['papers'] as List<dynamic>;
        final papers = rawList
            .map((e) => ExamPaper.fromJson(e as Map<String, dynamic>))
            .toList();
        emit(PreviousYearLoaded(papers));
      } else {
        emit(PreviousYearError(body['message'] ?? 'Something went wrong'));
      }
    } catch (e) {
      emit(PreviousYearError(e.toString()));
    }
  }
}
