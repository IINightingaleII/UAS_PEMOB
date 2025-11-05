class QuizModel {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  QuizModel({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });
}

class Question {
  final String id;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizProgress {
  final String quizId;
  final Map<String, int?> answers; // questionId -> selectedAnswerIndex
  final int currentQuestionIndex;

  QuizProgress({
    required this.quizId,
    required this.answers,
    required this.currentQuestionIndex,
  });

  QuizProgress copyWith({
    String? quizId,
    Map<String, int?>? answers,
    int? currentQuestionIndex,
  }) {
    return QuizProgress(
      quizId: quizId ?? this.quizId,
      answers: answers ?? this.answers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
}

