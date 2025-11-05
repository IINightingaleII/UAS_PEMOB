import 'package:flutter/material.dart';
import '../utils/quiz_data.dart';
import '../widgets/quiz_card.dart';
import '../widgets/quiz_icon.dart';
import 'quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = QuizData.getQuizzes();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Purple section with QUIZ icon
            Expanded(
              flex: 2,
              child: CircularPatternBackground(
                child: Center(
                  child: QuizIconWidget(),
                ),
              ),
            ),
            // White section with quiz cards
            Expanded(
              flex: 1,
              child: Transform.translate(
                offset: Offset(0, -screenHeight * 0.04), // Geser ke atas dengan Transform
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F9FA), // Light background
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02,
                    ),
                    itemCount: quizzes.length,
                    itemBuilder: (context, index) {
                      final quiz = quizzes[index];
                      return QuizCard(
                        title: quiz.title,
                        description: quiz.description,
                        questionCount: quiz.questions.length,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage(quiz: quiz),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

