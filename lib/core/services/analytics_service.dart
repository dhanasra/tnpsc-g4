import '../models/overall_stats.dart';
import '../models/session_result.dart';
import '../models/weekly_stats.dart';
import '../storage/hive_service.dart';
import '../storage/storage_keys.dart';
import '../utils/analytics_helper.dart';

class AnalyticsService {

  static Future<void> recordSession(SessionResult session) async {
    await AnalyticsHelper.updateStreak();
    await AnalyticsHelper.addToWeeklyActivity(
      date: session.completedAt,
      questions: session.totalQuestions,
    );
    await AnalyticsHelper.updateCumulativeStats(session);
    await AnalyticsHelper.appendSessionHistory(session);
  }

  /// Stats shown on the dashboard (streak, questions practiced).
  static OverallStats getOverallStats() {
    final streak = HiveService.get<int>(StorageKeys.dayStreak) ?? 0;
    final totalQ =
        HiveService.get<int>(StorageKeys.totalQuestionsPracticed) ?? 0;
    final totalCorrect =
        HiveService.get<int>(StorageKeys.totalCorrect) ?? 0;
    final totalTimeSecs =
        HiveService.get<int>(StorageKeys.totalTimeSecs) ?? 0;

    final accuracy =
        totalQ == 0 ? 0.0 : (totalCorrect / totalQ) * 100;

    return OverallStats(
      dayStreak: streak,
      totalQuestionsPracticed: totalQ,
      avgAccuracyPercent: accuracy,
      totalStudyHours: totalTimeSecs / 3600,
    );
  }

  /// Stats shown on the Statistics / "This Week" section.
  static WeeklyStats getWeeklyStats() {
    final activity = AnalyticsHelper.getWeeklyActivity();
    final now = DateTime.now();

    final List<int> dailyQ = [];
    final List<String> labels = [];
    final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    int weekTotal = 0;
    int weekCorrect = 0;
    int weekTimeSecs = 0;

    for (int i = 6; i >= 0; i--) {
      final day = now.subtract(Duration(days: i));
      final key = AnalyticsHelper.dateKey(day);
      final q = activity[key] ?? 0;
      dailyQ.add(q);
      weekTotal += q;
      // label by weekday (1=Mon … 7=Sun)
      labels.add(dayNames[day.weekday - 1]);
    }

    // Derive weekly correct + time from session history
    final sessions = AnalyticsHelper.getRecentSessions(days: 7);
    for (final s in sessions) {
      weekCorrect += s.correct;
      weekTimeSecs += s.timeTakenSecs;
    }

    return WeeklyStats(
      dailyQuestions: dailyQ,
      dayLabels: labels,
      totalQuestions: weekTotal,
      totalCorrect: weekCorrect,
      totalTimeSecs: weekTimeSecs,
    );
  }

  /// All stored sessions, newest first.
  static List<SessionResult> getAllSessions() {
    return AnalyticsHelper.loadSessionHistory().reversed.toList();
  }

  /// Reset everything (for testing or account wipe).
  static Future<void> clearAll() async {
    await HiveService.delete(StorageKeys.dayStreak);
    await HiveService.delete(StorageKeys.lastActiveDate);
    await HiveService.delete(StorageKeys.totalQuestionsPracticed);
    await HiveService.delete(StorageKeys.totalCorrect);
    await HiveService.delete(StorageKeys.totalTimeSecs);
    await HiveService.delete(StorageKeys.weeklyActivity);
    await HiveService.delete(StorageKeys.sessionHistory);
  }
}