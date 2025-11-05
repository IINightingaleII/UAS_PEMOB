import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quiz_model.dart';
import '../providers/quiz_provider.dart';
import '../widgets/answer_button.dart';
import '../widgets/quiz_page_header.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  final QuizModel quiz;

  const QuizPage({super.key, required this.quiz});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool _showResult = false;
  int _timeRemaining = 15;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<QuizProvider>(context, listen: false);
    provider.setCurrentQuestionIndex(
      widget.quiz.id,
      provider.getCurrentQuestionIndex(widget.quiz.id),
    );
    _startTimer();
  }

  void _startTimer() {
    _timeRemaining = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      
      if (_showResult) {
        // Pause timer saat hasil ditampilkan
        return;
      }
      
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          // Timer habis, auto-submit atau skip
          _timer?.cancel();
          _handleTimeUp();
        }
      });
    });
  }

  void _handleTimeUp() {
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final currentIndex = provider.getCurrentQuestionIndex(widget.quiz.id);
    final currentQuestion = widget.quiz.questions[currentIndex];
    
    // Jika belum ada jawaban yang dipilih, skip pertanyaan ini
    final selectedAnswer = provider.getAnswer(
      widget.quiz.id,
      currentQuestion.id,
    );
    
    if (selectedAnswer == null) {
      // Auto-next jika belum ada jawaban
      _nextQuestion();
    } else {
      // Jika sudah ada jawaban, tampilkan hasil
      setState(() {
        _showResult = true;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _selectAnswer(int answerIndex) {
    if (_showResult) return;

    final provider = Provider.of<QuizProvider>(context, listen: false);
    final currentQuestion = widget.quiz.questions[
        provider.getCurrentQuestionIndex(widget.quiz.id)];

    provider.saveAnswer(
      widget.quiz.id,
      currentQuestion.id,
      answerIndex,
    );

    setState(() {
      _showResult = true;
    });
    // Pause timer saat hasil ditampilkan
    _timer?.cancel();
  }

  void _nextQuestion() {
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final currentIndex = provider.getCurrentQuestionIndex(widget.quiz.id);

    if (currentIndex < widget.quiz.questions.length - 1) {
      provider.setCurrentQuestionIndex(widget.quiz.id, currentIndex + 1);
      setState(() {
        _showResult = false;
      });
      // Reset timer untuk pertanyaan berikutnya
      _startTimer();
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(quiz: widget.quiz),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, child) {
        final currentIndex = provider.getCurrentQuestionIndex(widget.quiz.id);
        final currentQuestion = widget.quiz.questions[currentIndex];
        final selectedAnswer = provider.getAnswer(
          widget.quiz.id,
          currentQuestion.id,
        );

        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        // Labels untuk jawaban A, B, C, D
        final labels = ['A', 'B', 'C', 'D'];

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
                child: Column(
                  children: [
                    // Back button dan Header
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                      ],
                    ),
                    // Header dengan icon dan timer
                    QuizPageHeader(
                      category: widget.quiz.title,
                      timeRemaining: _timeRemaining,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Question Box
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question Box
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(screenWidth * 0.05),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(screenWidth * 0.04),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: screenWidth * 0.02,
                                    spreadRadius: screenWidth * 0.002,
                                    offset: Offset(0, screenWidth * 0.005),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Question',
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF5A189A), // Dark purple
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    currentQuestion.questionText,
                                    style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.042,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            // Answer Options
                            ...currentQuestion.options.asMap().entries.map((entry) {
                              final index = entry.key;
                              final option = entry.value;
                              final isSelected = selectedAnswer != null && selectedAnswer == index;
                              final isCorrect = index == currentQuestion.correctAnswerIndex;

                              return AnswerButton(
                                answer: option,
                                label: labels[index],
                                isSelected: isSelected,
                                isCorrect: isCorrect,
                                showResult: _showResult,
                                onTap: () => _selectAnswer(index),
                              );
                            }),
                            SizedBox(height: screenHeight * 0.02),
                          ],
                        ),
                      ),
                    ),
                    // Next Button - selalu visible
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _showResult ? _nextQuestion : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _showResult ? const Color(0xFF7B2CBF) : Colors.grey.shade300,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            ),
                            elevation: 4,
                          ),
                          child: Text(
                            currentIndex < widget.quiz.questions.length - 1
                                ? 'Next'
                                : 'See Results',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

