import 'package:flutter/foundation.dart';
import '../models/quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  final Map<String, QuizProgress> _quizProgress = {};

  Map<String, QuizProgress> get quizProgress => _quizProgress;

  void saveAnswer(String quizId, String questionId, int answerIndex) {
    if (_quizProgress.containsKey(quizId)) {
      final progress = _quizProgress[quizId]!;
      final updatedAnswers = Map<String, int?>.from(progress.answers);
      updatedAnswers[questionId] = answerIndex;
      
      _quizProgress[quizId] = progress.copyWith(
        answers: updatedAnswers,
      );
    } else {
      _quizProgress[quizId] = QuizProgress(
        quizId: quizId,
        answers: {questionId: answerIndex},
        currentQuestionIndex: 0,
      );
    }
    notifyListeners();
  }

  void setCurrentQuestionIndex(String quizId, int index) {
    if (_quizProgress.containsKey(quizId)) {
      final progress = _quizProgress[quizId]!;
      _quizProgress[quizId] = progress.copyWith(
        currentQuestionIndex: index,
      );
    } else {
      _quizProgress[quizId] = QuizProgress(
        quizId: quizId,
        answers: {},
        currentQuestionIndex: index,
      );
    }
    notifyListeners();
  }

  int? getAnswer(String quizId, String questionId) {
    return _quizProgress[quizId]?.answers[questionId];
  }

  int getCurrentQuestionIndex(String quizId) {
    return _quizProgress[quizId]?.currentQuestionIndex ?? 0;
  }

  void resetQuiz(String quizId) {
    _quizProgress.remove(quizId);
    notifyListeners();
  }
}

