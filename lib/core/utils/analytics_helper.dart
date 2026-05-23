import '../models/session_result.dart';
import '../storage/hive_service.dart';
import '../storage/storage_keys.dart';

class AnalyticsHelper {

  static const int _maxSessionHistory = 50;

  static Future<void> updateStreak() async {
    final today = dateKey(DateTime.now());
    final lastActive =
        HiveService.get<String>(StorageKeys.lastActiveDate);

    if (lastActive == today) return; // already counted today

    int streak = HiveService.get<int>(StorageKeys.dayStreak) ?? 0;

    if (lastActive != null) {
      final last = DateTime.parse(lastActive);
      final diff = DateTime.now().difference(last).inDays;
      streak = diff <= 1 ? streak + 1 : 1;
    } else {
      streak = 1;
    }

    await HiveService.set(StorageKeys.dayStreak, streak);
    await HiveService.set(StorageKeys.lastActiveDate, today);
  }

  static Future<void> addToWeeklyActivity({
    required DateTime date,
    required int questions,
  }) async {
    final activity = getWeeklyActivity();
    final key = dateKey(date);
    activity[key] = (activity[key] ?? 0) + questions;

    // Prune keys older than 7 days
    final cutoff = DateTime.now().subtract(const Duration(days: 7));
    activity.removeWhere((k, _) => DateTime.parse(k).isBefore(cutoff));

    await HiveService.set(StorageKeys.weeklyActivity, activity);
  }

  static Future<void> updateCumulativeStats(SessionResult s) async {
    final prevQ =
        HiveService.get<int>(StorageKeys.totalQuestionsPracticed) ?? 0;
    final prevCorrect =
        HiveService.get<int>(StorageKeys.totalCorrect) ?? 0;
    final prevTime =
        HiveService.get<int>(StorageKeys.totalTimeSecs) ?? 0;

    await HiveService.set(
        StorageKeys.totalQuestionsPracticed, prevQ + s.totalQuestions);
    await HiveService.set(
        StorageKeys.totalCorrect, prevCorrect + s.correct);
    await HiveService.set(
        StorageKeys.totalTimeSecs, prevTime + s.timeTakenSecs);
  }

  static Future<void> appendSessionHistory(SessionResult session) async {
    final history = loadSessionHistory();
    history.add(session);

    // Keep only the most recent N sessions
    final trimmed = history.length > _maxSessionHistory
        ? history.sublist(history.length - _maxSessionHistory)
        : history;

    final raw = trimmed.map((s) => s.toMap()).toList();
    await HiveService.set(StorageKeys.sessionHistory, raw);
  }

  static List<SessionResult> loadSessionHistory() {
    final raw = HiveService.get<List>(StorageKeys.sessionHistory);
    if (raw == null) return [];
    return raw
        .map((e) => SessionResult.fromMap(e as Map))
        .toList();
  }

  static List<SessionResult> getRecentSessions({required int days}) {
    final cutoff = DateTime.now().subtract(Duration(days: days));
    return loadSessionHistory()
        .where((s) => s.completedAt.isAfter(cutoff))
        .toList();
  }

  static Map<String, int> getWeeklyActivity() {
    final raw =
        HiveService.get<Map>(StorageKeys.weeklyActivity);
    if (raw == null) return {};
    return raw.map((k, v) => MapEntry(k as String, v as int));
  }

  /// Returns a sortable date string like '2026-05-23'.
  static String dateKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

}