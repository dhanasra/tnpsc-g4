class WeeklyStats {
  final List<int> dailyQuestions;
  final List<String> dayLabels;

  final int totalQuestions;
  final int totalCorrect;
  final int totalTimeSecs;

  WeeklyStats({
    required this.dailyQuestions,
    required this.dayLabels,
    required this.totalQuestions,
    required this.totalCorrect,
    required this.totalTimeSecs,
  });

  double get accuracy =>
      totalQuestions == 0 ? 0 : (totalCorrect / totalQuestions) * 100;

  double get timeSpentHours => totalTimeSecs / 3600;
}