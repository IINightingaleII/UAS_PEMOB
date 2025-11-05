# 📱 Quiz App - Flutter Mobile Application

## 📝 Deskripsi
Aplikasi kuis interaktif berbasis Flutter dengan fitur timer countdown, state management, dan UI modern dengan purple theme.

## ✨ Fitur Utama

- ✅ **3 Halaman Utama**: Home, Quiz, Result
- ✅ **State Management**: Menggunakan Provider untuk mengelola state
- ✅ **Timer Countdown**: 10 detik per pertanyaan dengan visual feedback
- ✅ **3 Kategori Quiz**: Game (5 soal), Math (5 soal), Flutter Basics (2 soal)
- ✅ **Responsive UI**: Menggunakan MediaQuery, tidak ada hardcoded values
- ✅ **Custom Fonts**: Google Fonts (Poppins)
- ✅ **Reusable Widgets**: Komponen yang dapat digunakan kembali
- ✅ **Circular Patterns**: Background pattern yang menarik

## 🛠️ Teknologi

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider (^6.1.1)
- **Custom Fonts**: Google Fonts (^6.1.1)
- **Icons**: Material Icons + Custom PNG

## 📦 Packages

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.1
  google_fonts: ^6.1.1
  flutter_svg: ^2.0.9
```

## 📁 Struktur Project

```
lib/
├── main.dart                  # Entry point
├── models/
│   └── quiz_model.dart        # Data models (QuizModel, Question, QuizProgress)
├── providers/
│   └── quiz_provider.dart     # State management
├── pages/
│   ├── home_page.dart         # Halaman utama
│   ├── quiz_page.dart         # Halaman quiz
│   └── result_page.dart       # Halaman hasil
├── widgets/
│   ├── answer_button.dart     # Button jawaban
│   ├── category_icon.dart     # Icon kategori
│   ├── progress_indicator.dart
│   ├── quiz_card.dart         # Card quiz
│   ├── quiz_icon.dart         # Icon QUIZ
│   └── quiz_page_header.dart  # Header quiz page
└── utils/
    ├── quiz_data.dart         # Data quiz
    └── text_styles.dart       # Text styles
```

## 🚀 Cara Menjalankan

1. Pastikan Flutter SDK sudah terinstall
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## 📚 Dokumentasi

- **Panduan Presentasi**: Lihat `PRESENTATION_GUIDE.md`
- **Struktur Data**: Lihat `DATA_STRUCTURE.md`

## 🎯 Screenshots Flow

1. **Home Page** → Tampilkan 3 quiz cards
2. **Quiz Page** → Timer, pertanyaan, pilihan jawaban
3. **Result Page** → Score dan persentase

---

**Dibuat untuk UTS PEMOB** 📱
