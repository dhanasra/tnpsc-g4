class ExamPaper {
  final String id;
  final String title;
  final String paperCode;
  final int year;
  final String medium;
  final bool isPremium;
  final bool isActive;

  const ExamPaper({
    required this.id,
    required this.title,
    required this.paperCode,
    required this.year,
    required this.medium,
    required this.isPremium,
    required this.isActive,
  });

  factory ExamPaper.fromJson(Map<String, dynamic> json) {
    return ExamPaper(
      id: json['_id'] as String,
      title: json['title'] as String,
      paperCode: json['paperCode'] as String,
      year: json['year'] as int,
      medium: json['medium'] as String,
      isPremium: json['isPremium'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
    );
  }
}