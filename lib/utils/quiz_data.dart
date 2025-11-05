import '../models/quiz_model.dart';

class QuizData {
  static List<QuizModel> getQuizzes() {
    return [
      QuizModel(
        id: 'quiz1',
        title: 'Game',
        description: 'Test your knowledge about video games',
        questions: [
          Question(
            id: 'q1',
            questionText: 'Game apa yang terkenal dengan karakter Mario?',
            options: [
              'Sonic The Hedgehog',
              'Super Mario Bros',
              'Pokemon',
              'Call of Duty',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q2',
            questionText: 'Platform game apa yang terkenal dengan karakter berbentuk kubus?',
            options: [
              'Fortnite',
              'Minecraft',
              'Roblox',
              'Terraria',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q3',
            questionText: 'Game FPS (First Person Shooter) mana yang terkenal dengan mode Battle Royale?',
            options: [
              'Counter-Strike',
              'PUBG',
              'Valorant',
              'Overwatch',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q4',
            questionText: 'Game MOBA (Multiplayer Online Battle Arena) mana yang paling populer?',
            options: [
              'League of Legends',
              'Dota 2',
              'Heroes of the Storm',
              'A dan B benar',
            ],
            correctAnswerIndex: 3,
          ),
          Question(
            id: 'q5',
            questionText: 'Game apa yang terkenal dengan slogan "Gotta Catch \'Em All"?',
            options: [
              'Digimon',
              'Pokemon',
              'Yu-Gi-Oh',
              'Dragon Ball',
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      QuizModel(
        id: 'quiz2',
        title: 'Math',
        description: 'Test your basic math skills',
        questions: [
          Question(
            id: 'q1',
            questionText: 'Berapa hasil dari 15 + 23?',
            options: [
              '37',
              '38',
              '39',
              '40',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q2',
            questionText: 'Berapa hasil dari 48 - 19?',
            options: [
              '28',
              '29',
              '30',
              '31',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q3',
            questionText: 'Berapa hasil dari 27 + 14?',
            options: [
              '40',
              '41',
              '42',
              '43',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q4',
            questionText: 'Berapa hasil dari 56 - 28?',
            options: [
              '27',
              '28',
              '29',
              '30',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q5',
            questionText: 'Berapa hasil dari 33 + 17?',
            options: [
              '49',
              '50',
              '51',
              '52',
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      QuizModel(
        id: 'quiz3',
        title: 'Flutter Basics',
        description: 'Test your UI/UX design knowledge',
        questions: [
          Question(
            id: 'q1',
            questionText: 'Apa prinsip utama dalam responsive design?',
            options: [
              'Fixed width',
              'Flexible layout',
              'Hardcoded values',
              'Single screen size',
            ],
            correctAnswerIndex: 1,
          ),
          Question(
            id: 'q2',
            questionText: 'Widget apa yang digunakan untuk membuat layout responsif?',
            options: [
              'Fixed',
              'Expanded',
              'Flexible',
              'B dan C benar',
            ],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ];
  }
}

