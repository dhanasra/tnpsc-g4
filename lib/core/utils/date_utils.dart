import 'package:easy_localization/easy_localization.dart';

class AppDateUtils {
  /// Format: 20 May 2026
  static String formatDate(
    DateTime date,
  ) {
    return DateFormat(
      'dd MMM yyyy',
    ).format(date);
  }

  /// Format: 20 May 2026, 10:30 PM
  static String formatDateTime(
    DateTime date,
  ) {
    return DateFormat(
      'dd MMM yyyy, hh:mm a',
    ).format(date);
  }

  /// Format: 10:30 PM
  static String formatTime(
    DateTime date,
  ) {
    return DateFormat(
      'hh:mm a',
    ).format(date);
  }

  /// API date parsing
  static DateTime parse(
    String date,
  ) {
    return DateTime.parse(date);
  }

  /// Convert to API format
  static String toApiFormat(
    DateTime date,
  ) {
    return DateFormat(
      'yyyy-MM-dd',
    ).format(date);
  }

  /// Relative time
  static String timeAgo(
    DateTime date,
  ) {
    final difference =
        DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    }

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} hrs ago';
    }

    if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    return formatDate(date);
  }
}