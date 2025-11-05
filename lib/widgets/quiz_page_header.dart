import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/category_icon.dart';

class QuizPageHeader extends StatelessWidget {
  final String category;
  final int timeRemaining;

  const QuizPageHeader({
    super.key,
    required this.category,
    required this.timeRemaining,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Warna timer berubah menjadi merah saat waktu <= 5 detik (setengah dari waktu total)
    final timerColor = timeRemaining <= 5 
        ? Colors.red.shade700 
        : Colors.black87;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.06,
        vertical: screenHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Category Icon with circular background
          Container(
            width: screenWidth * 0.18,
            height: screenWidth * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: screenWidth * 0.02,
                  spreadRadius: screenWidth * 0.005,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: CategoryIcon(
                category: category,
                size: screenWidth * 0.12,
              ),
            ),
          ),
          // Right: Timer/Score Circle
          Container(
            width: screenWidth * 0.18,
            height: screenWidth * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: screenWidth * 0.02,
                  spreadRadius: screenWidth * 0.005,
                ),
              ],
            ),
            child: Center(
              child: Text(
                '$timeRemaining',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: timerColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
