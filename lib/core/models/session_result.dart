class SessionResult {
  final String id;
  final int correct;
  final int wrong;
  final int totalQuestions;
  final int timeTakenSecs;
  final DateTime completedAt;
  final String quizType; // 'previous_year' | 'random' | 'daily_quiz'
  final String? paperCode;

  const SessionResult({
    required this.id,
    required this.correct,
    required this.wrong,
    required this.totalQuestions,
    required this.timeTakenSecs,
    required this.completedAt,
    required this.quizType,
    this.paperCode,
  });

  double get accuracy => totalQuestions == 0 ? 0 : (correct / totalQuestions) * 100;
  int get score => accuracy.round();

  Map<String, dynamic> toMap() => {
        'id': id,
        'correct': correct,
        'wrong': wrong,
        'totalQuestions': totalQuestions,
        'timeTakenSecs': timeTakenSecs,
        'completedAt': completedAt.toIso8601String(),
        'quizType': quizType,
        'paperCode': paperCode,
      };

  factory SessionResult.fromMap(json) => SessionResult(
        id: json['id'] as String,
        correct: json['correct'] as int,
        wrong: json['wrong'] as int,
        totalQuestions: json['totalQuestions'] as int,
        timeTakenSecs: json['timeTakenSecs'] as int,
        completedAt: DateTime.parse(json['completedAt'] as String),
        quizType: json['quizType'] as String,
        paperCode: json['paperCode'] as String?,
      );
}