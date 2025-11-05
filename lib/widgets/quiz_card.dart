import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_icon.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String description;
  final int questionCount;
  final VoidCallback onTap;

  const QuizCard({
    super.key,
    required this.title,
    required this.description,
    required this.questionCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: screenHeight * 0.008, // Dikurangi lagi
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: screenWidth * 0.024, // ~10px untuk 411px width
            spreadRadius: screenWidth * 0.005, // ~2px untuk 411px width
            offset: Offset(0, screenWidth * 0.01), // ~4px untuk 411px width
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.06),
          child: Row(
            children: [
              CategoryIcon(
                category: title,
                size: screenWidth * 0.18,
              ),
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF5A189A), // Dark purple
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

