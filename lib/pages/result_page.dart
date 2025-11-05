import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quiz_model.dart';
import '../providers/quiz_provider.dart';
import '../pages/home_page.dart';

class ResultPage extends StatelessWidget {
  final QuizModel quiz;

  const ResultPage({super.key, required this.quiz});

  int _calculateScore(QuizProvider provider) {
    int score = 0;
    for (var question in quiz.questions) {
      final answer = provider.getAnswer(quiz.id, question.id);
      if (answer == question.correctAnswerIndex) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final score = _calculateScore(provider);
    final totalQuestions = quiz.questions.length;
    final percentage = (score / totalQuestions * 100).toInt();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background dengan circular patterns
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF7B2CBF), // Purple
                  const Color(0xFFE0AAFF).withOpacity(0.3), // Light purple
                ],
              ),
            ),
            child: Stack(
              children: [
                // Circular pattern 1
                Positioned(
                  top: screenHeight * 0.05,
                  right: -screenWidth * 0.1,
                  child: Container(
                    width: screenWidth * 0.5,
                    height: screenWidth * 0.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF9D4EDD).withOpacity(0.2),
                    ),
                  ),
                ),
                // Circular pattern 2
                Positioned(
                  top: screenHeight * 0.15,
                  left: -screenWidth * 0.05,
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenWidth * 0.4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFC77DFF).withOpacity(0.3),
                    ),
                  ),
                ),
                // Circular pattern 3
                Positioned(
                  top: screenHeight * 0.3,
                  right: screenWidth * 0.1,
                  child: Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE0AAFF).withOpacity(0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        percentage >= 70 ? Icons.emoji_events : Icons.school,
                        size: screenWidth * 0.15,
                        color: percentage >= 70 ? Colors.amber : const Color(0xFF7B2CBF),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Text(
                      quiz.title,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.06),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            '$percentage%',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.15,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF7B2CBF), // Purple
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Score: $score / $totalQuestions',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.045,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            percentage >= 70
                                ? 'Selamat! Kamu berhasil! 🎉'
                                : 'Tetap semangat belajar! 💪',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.04,
                              color: Colors.grey.shade600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.resetQuiz(quiz.id);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF7B2CBF), // Purple
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          ),
                        ),
                        child: Text(
                          'Back to Home',
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

