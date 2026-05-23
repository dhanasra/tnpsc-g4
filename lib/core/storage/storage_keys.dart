class StorageKeys {
  static const isDarkMode = 'is_dark_mode';
  static const languageCode = 'language_code';

  // Streak
  static const dayStreak = 'day_streak';
  static const lastActiveDate = 'last_active_date'; // ISO8601 date string
 
  // Cumulative stats
  static const totalQuestionsPracticed = 'total_questions_practiced';
  static const totalCorrect = 'total_correct';
  static const totalTimeSecs = 'total_time_secs'; // all-time study seconds
 
  // Weekly activity — stored as a Map<String, int> { 'YYYY-MM-DD': questionsCount }
  // Kept rolling: only the last 7 days matter
  static const weeklyActivity = 'weekly_activity';
 
  // Per-session history — stored as List<Map> (last 50 sessions)
  static const sessionHistory = 'session_history';
}