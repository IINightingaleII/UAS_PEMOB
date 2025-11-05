import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final String? label; // A, B, C, D
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.answer,
    this.label,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = const Color(0xFF5A189A); // Dark purple

    if (showResult) {
      if (isSelected && isCorrect) {
        backgroundColor = Colors.green.shade50;
        borderColor = Colors.green;
        textColor = Colors.green.shade900;
      } else if (isSelected && !isCorrect) {
        backgroundColor = Colors.red.shade50;
        borderColor = Colors.red;
        textColor = Colors.red.shade900;
      } else if (isCorrect) {
        backgroundColor = Colors.green.shade50;
        borderColor = Colors.green;
        textColor = Colors.green.shade900;
      }
    } else if (isSelected) {
      backgroundColor = const Color(0xFFE0AAFF).withOpacity(0.2); // Light purple
      borderColor = const Color(0xFF7B2CBF); // Purple
      textColor = const Color(0xFF5A189A); // Dark purple
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: screenWidth * 0.01,
                spreadRadius: screenWidth * 0.002,
                offset: Offset(0, screenWidth * 0.005),
              ),
            ],
          ),
          child: Row(
            children: [
              // Label (A, B, C, D)
              if (label != null)
                Container(
                  width: screenWidth * 0.08,
                  height: screenWidth * 0.08,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF7B2CBF) : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? const Color(0xFF7B2CBF) : const Color(0xFF5A189A),
                      width: screenWidth * 0.005,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      label!,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : const Color(0xFF5A189A),
                      ),
                    ),
                  ),
                ),
              if (label != null) SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Text(
                  answer,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.038,
                    color: textColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
              if (showResult && isCorrect)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: screenWidth * 0.06,
                ),
              if (showResult && isSelected && !isCorrect)
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: screenWidth * 0.06,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

