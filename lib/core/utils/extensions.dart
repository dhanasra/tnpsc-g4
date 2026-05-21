extension StringExtension on String {
  bool get isEmail {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(this);
  }

  bool get isNotNullOrEmpty {
    return trim().isNotEmpty;
  }
}