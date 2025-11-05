import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizIconWidget extends StatelessWidget {
  const QuizIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.25;

    return Container(
      width: iconSize,
      height: iconSize,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: EdgeInsets.all(iconSize * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Q',
                    style: GoogleFonts.poppins(
                      fontSize: iconSize * 0.25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: iconSize * 0.05),
                  Text(
                    'U',
                    style: GoogleFonts.poppins(
                      fontSize: iconSize * 0.25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: iconSize * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'I',
                    style: GoogleFonts.poppins(
                      fontSize: iconSize * 0.25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: iconSize * 0.05),
                  Text(
                    'Z',
                    style: GoogleFonts.poppins(
                      fontSize: iconSize * 0.25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularPatternBackground extends StatelessWidget {
  final Widget child;

  const CircularPatternBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Base purple background
        Container(
          color: const Color(0xFF7B2CBF), // Purple base color
        ),
        // Circular patterns
        Positioned(
          top: screenHeight * 0.05,
          right: screenWidth * 0.1,
          child: Container(
            width: screenWidth * 0.4,
            height: screenWidth * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF9D4EDD).withOpacity(0.3),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.15,
          left: screenWidth * 0.05,
          child: Container(
            width: screenWidth * 0.3,
            height: screenWidth * 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFC77DFF).withOpacity(0.4),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.25,
          right: screenWidth * 0.2,
          child: Container(
            width: screenWidth * 0.25,
            height: screenWidth * 0.25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF9D4EDD).withOpacity(0.5),
                width: screenWidth * 0.007, // ~3px untuk 411px width
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.1,
          left: screenWidth * 0.3,
          child: Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE0AAFF).withOpacity(0.5),
            ),
          ),
        ),
        // Concentric rings around icon
        Positioned(
          top: screenHeight * 0.12,
          left: screenWidth * 0.5 - (screenWidth * 0.18),
          child: Container(
            width: screenWidth * 0.36,
            height: screenWidth * 0.36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF9D4EDD).withOpacity(0.4),
                width: screenWidth * 0.005, // ~2px untuk 411px width
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.1,
          left: screenWidth * 0.5 - (screenWidth * 0.21),
          child: Container(
            width: screenWidth * 0.42,
            height: screenWidth * 0.42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFC77DFF).withOpacity(0.3),
                width: screenWidth * 0.005, // ~2px untuk 411px width
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

