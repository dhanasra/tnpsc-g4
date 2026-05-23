class QuizQuestion {
  final String id;
  final String questionText;
  final String? questionImage;
  final Map<String, QuizOption> options;
  final String correctAnswer;
  final String? explanationText;
  final String? explanationImage;
  final String difficulty;

  const QuizQuestion({
    required this.id,
    required this.questionText,
    this.questionImage,
    required this.options,
    required this.correctAnswer,
    this.explanationText,
    this.explanationImage,
    required this.difficulty,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    final rawOptions = json['options'] as Map<String, dynamic>;
    final options = rawOptions.map(
      (key, value) => MapEntry(
        key,
        QuizOption.fromJson(value as Map<String, dynamic>),
      ),
    );

    return QuizQuestion(
      id: json['_id'] as String,
      questionText: (json['question'] as Map<String, dynamic>)['text'] as String,
      questionImage: (json['question'] as Map<String, dynamic>)['image'] as String?,
      options: options,
      correctAnswer: json['correctAnswer'] as String,
      explanationText: json['explanation']?['text'] as String?,
      explanationImage: json['explanation']?['image'] as String?,
      difficulty: json['difficulty'] as String? ?? 'easy',
    );
  }

  /// Returns option keys in insertion order: ['A', 'B', 'C', 'D']
  List<String> get optionKeys => options.keys.toList();
}

class QuizOption {
  final String text;
  final String? image;

  const QuizOption({required this.text, this.image});

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      text: json['text'] as String,
      image: json['image'] as String?,
    );
  }
}

enum QuizType { previousYear, random, dailyQuiz }