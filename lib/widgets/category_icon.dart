import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String category;
  final double size;

  const CategoryIcon({
    super.key,
    required this.category,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (category.toLowerCase() == 'game' || category.toLowerCase().contains('game')) {
      return _buildGameIcon();
    } else if (category.toLowerCase() == 'math' || category.toLowerCase().contains('math')) {
      return _buildMathIcon();
    } else {
      return _buildDefaultIcon();
    }
  }

  Widget _buildGameIcon() {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/icons/Game_icon.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading Game_icon.png: $error');
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: const Color(0xFF7B2CBF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(size * 0.2),
            ),
            child: Icon(
              Icons.sports_esports,
              size: size * 0.6,
              color: const Color(0xFF7B2CBF),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMathIcon() {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/icons/Math_icon.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading Math_icon.png: $error');
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: const Color(0xFF7B2CBF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(size * 0.2),
            ),
            child: Icon(
              Icons.calculate,
              size: size * 0.6,
              color: const Color(0xFF7B2CBF),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDefaultIcon() {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(
        'assets/icons/quiz_icon.png',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading quiz_icon.png: $error');
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: const Color(0xFF7B2CBF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(size * 0.2),
            ),
            child: Icon(
              Icons.quiz,
              size: size * 0.6,
              color: const Color(0xFF7B2CBF),
            ),
          );
        },
      ),
    );
  }
}

