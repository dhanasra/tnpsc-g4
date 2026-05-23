import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';

class QuizService {
  final ApiClient _apiClient = ApiClient();

  Future<Response> getPreviousYearExams() async {
    return await _apiClient.get(
      '/previous-year/exams',
    );
  }

  Future<Response> startPreviousYearQuiz({
    required String paperCode,
  }) async {
    return await _apiClient.post(
      '/previous-year/start',
      data: {
        'paperCode': paperCode,
      },
    );
  }

  Future<Response> startRandomQuiz() async {
    return await _apiClient.get(
      '/random/start',
    );
  }

  Future<Response> startDailyQuiz() async {
    return await _apiClient.get(
      '/daily-quiz/start',
    );
  }
}