# 📊 Struktur Data Quiz App

## 1. DATA MODEL (lib/models/quiz_model.dart)

### QuizModel
Struktur utama untuk menyimpan data quiz.

```dart
QuizModel {
  id: String              // ID unik quiz (contoh: "quiz1")
  title: String           // Judul quiz (contoh: "Game")
  description: String     // Deskripsi quiz
  questions: List<Question>  // List pertanyaan
}
```

### Question
Struktur untuk setiap pertanyaan dalam quiz.

```dart
Question {
  id: String                    // ID unik pertanyaan (contoh: "q1")
  questionText: String          // Teks pertanyaan
  options: List<String>         // List pilihan jawaban (4 opsi)
  correctAnswerIndex: int       // Index jawaban benar (0-3)
}
```

### QuizProgress
Struktur untuk menyimpan progress quiz user.

```dart
QuizProgress {
  quizId: String                    // ID quiz yang sedang dikerjakan
  answers: Map<String, int?>      // Map jawaban user
                                      // Key: questionId
                                      // Value: index jawaban yang dipilih (0-3)
  currentQuestionIndex: int         // Index pertanyaan saat ini (0, 1, 2, ...)
}
```

---

## 2. STATE MANAGEMENT (lib/providers/quiz_provider.dart)

### QuizProvider
Mengelola state aplikasi menggunakan Provider pattern.

```dart
QuizProvider {
  _quizProgress: Map<String, QuizProgress>
    // Key: quizId
    // Value: QuizProgress object
  
  Methods:
  - saveAnswer(quizId, questionId, answerIndex)
    // Menyimpan jawaban user
  
  - setCurrentQuestionIndex(quizId, index)
    // Mengatur pertanyaan saat ini
  
  - getAnswer(quizId, questionId)
    // Mengambil jawaban user untuk pertanyaan tertentu
  
  - getCurrentQuestionIndex(quizId)
    // Mengambil index pertanyaan saat ini
  
  - resetQuiz(quizId)
    // Reset progress quiz
}
```

---

## 3. DATA QUIZ (lib/utils/quiz_data.dart)

### Struktur Data Quiz

```dart
List<QuizModel> [
  QuizModel {
    id: "quiz1"
    title: "Game"
    description: "Test your knowledge about video games"
    questions: [
      Question {
        id: "q1"
        questionText: "Game apa yang terkenal dengan karakter Mario?"
        options: ["Sonic The Hedgehog", "Super Mario Bros", "Pokemon", "Call of Duty"]
        correctAnswerIndex: 1  // "Super Mario Bros"
      },
      Question {
        id: "q2"
        questionText: "Platform game apa yang terkenal dengan karakter berbentuk kubus?"
        options: ["Fortnite", "Minecraft", "Roblox", "Terraria"]
        correctAnswerIndex: 1  // "Minecraft"
      },
      // ... 3 pertanyaan lagi
    ]
  },
  QuizModel {
    id: "quiz2"
    title: "Math"
    description: "Test your basic math skills"
    questions: [
      Question {
        id: "q1"
        questionText: "Berapa hasil dari 15 + 23?"
        options: ["37", "38", "39", "40"]
        correctAnswerIndex: 1  // "38"
      },
      // ... 4 pertanyaan lagi
    ]
  },
  QuizModel {
    id: "quiz3"
    title: "Flutter Basics"
    // ...
  }
]
```

---

## 4. ALUR DATA DALAM APLIKASI

### Flow Diagram:

```
┌─────────────────┐
│   Home Page     │
│  (Quiz List)    │
└────────┬────────┘
         │
         │ User klik quiz card
         ▼
┌─────────────────┐
│   Quiz Page     │
│                 │
│ ┌─────────────┐ │
│ │ QuizProvider│ │ ◄─── State Management
│ └──────┬──────┘ │
│        │        │
│ ┌──────▼──────┐ │
│ │ QuizData   │ │ ◄─── Dummy Data
│ └────────────┘ │
│                 │
│ User pilih     │
│ jawaban ───────┼──► saveAnswer()
│                 │
│ Timer countdown│
│ Auto-next      │
└────────┬────────┘
         │
         │ Setelah semua pertanyaan selesai
         ▼
┌─────────────────┐
│  Result Page    │
│                 │
│ ┌─────────────┐ │
│ │ QuizProvider│ │ ◄─── Ambil semua jawaban
│ └──────┬──────┘ │
│        │        │
│ ┌──────▼──────┐ │
│ │ Calculate   │ │
│ │ Score       │ │
│ └────────────┘ │
│                 │
│ Tampilkan:      │
│ - Percentage    │
│ - Score         │
│ - Message       │
└─────────────────┘
```

---

## 5. CONTOH DATA NYATA

### Quiz 1: Game
```json
{
  "id": "quiz1",
  "title": "Game",
  "questions": [
    {
      "id": "q1",
      "questionText": "Game apa yang terkenal dengan karakter Mario?",
      "options": [
        "Sonic The Hedgehog",
        "Super Mario Bros",
        "Pokemon",
        "Call of Duty"
      ],
      "correctAnswerIndex": 1
    }
    // ... 4 pertanyaan lagi
  ]
}
```

### Quiz Progress (Contoh)
```json
{
  "quiz1": {
    "quizId": "quiz1",
    "answers": {
      "q1": 1,    // User memilih jawaban index 1 (Benar)
      "q2": 0,    // User memilih jawaban index 0 (Salah)
      "q3": 1,    // User memilih jawaban index 1 (Benar)
      "q4": 3,    // User memilih jawaban index 3 (Benar)
      "q5": 1     // User memilih jawaban index 1 (Benar)
    },
    "currentQuestionIndex": 5  // Sudah selesai semua pertanyaan
  }
}
```

### Hasil Perhitungan Score
```
Total Questions: 5
Correct Answers: 4
Score: 4/5
Percentage: 80%
```

---

## 6. RELASI ANTAR COMPONENT

```
┌─────────────────────────────────────────┐
│           main.dart                     │
│  ┌─────────────────────────────────┐   │
│  │  ChangeNotifierProvider         │   │
│  │  (QuizProvider)                │   │
│  └──────────────┬──────────────────┘   │
│                 │                      │
│  ┌──────────────▼──────────────────┐   │
│  │      MaterialApp                │   │
│  │      Theme (Purple)             │   │
│  │      HomePage                  │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
                    │
        ┌───────────┼───────────┐
        │           │           │
        ▼           ▼           ▼
┌──────────┐ ┌──────────┐ ┌──────────┐
│Home Page │ │Quiz Page │ │ResultPage│
└────┬─────┘ └────┬─────┘ └────┬─────┘
     │           │           │
     │           │           │
     ▼           ▼           ▼
┌──────────────────────────────────┐
│      QuizProvider (State)         │
│  - quizProgress                  │
│  - saveAnswer()                  │
│  - getAnswer()                   │
└──────────┬───────────────────────┘
           │
           ▼
┌──────────────────────────────────┐
│      QuizData (Static Data)      │
│  - getQuizzes()                  │
│  - Returns List<QuizModel>       │
└──────────────────────────────────┘
```

---

## 7. KEY POINTS UNTUK PRESENTASI

### ✨ **State Management**
- Menggunakan Provider pattern
- State tersimpan di QuizProvider
- Tidak hilang saat screen rotation

### ✨ **Data Structure**
- QuizModel → Berisi quiz dan pertanyaan
- Question → Satu pertanyaan dengan 4 opsi
- QuizProgress → Progress user per quiz

### ✨ **Data Flow**
1. QuizData menyediakan data statis
2. QuizProvider mengelola state
3. Pages mengakses data melalui Provider
4. User interaction update state
5. State update trigger UI rebuild

---

**Struktur data ini memungkinkan aplikasi untuk:**
- ✅ Menyimpan progress quiz
- ✅ Menghitung score dengan akurat
- ✅ Mempertahankan state saat navigasi
- ✅ Mudah ditambahkan quiz baru

