# Grammar Master - Offline English Grammar Learning App

## 1. Project Overview

**Project Name:** Grammar Master
**Project Type:** Flutter Mobile Application (Android/iOS)
**Core Functionality:** Offline English grammar learning app with comprehensive lessons, interactive quizzes, and progress tracking - inspired by Duolingo's gamified learning approach.

---

## 2. Technology Stack & Choices

| Component | Choice | Rationale |
|-----------|--------|-----------|
| **Framework** | Flutter 3.38.7 | Cross-platform |
| **Language** | Dart 3.10 | Latest stable |
| **State Management** | Provider | Simple, recommended |
| **Local Storage** | SharedPreferences | Lightweight, offline-first |
| **Navigation** | Navigator 2.0 | Built-in routing |
| **Architecture** | Clean Architecture | Separation of concerns |

### Dependencies
- `provider: ^6.1.2` - State management
- `shared_preferences: ^2.3.5` - Local storage for progress
- `google_fonts: ^6.2.1` - Beautiful typography
- `audioplayers: ^6.1.0` - Sound effects
- `lottie: ^3.1.0` - Animations
- `flutter_animate: ^4.5.0` - Smooth animations

---

## 3. Feature List

### Core Features
1. **Lesson System**
   - Grammar topics organized by category
   - Detailed explanations with examples
   - Multiple lessons per topic

2. **Quiz System**
   - Multiple choice questions
   - Fill in the blank
   - Sentence ordering
   - True/False questions
   - Instant feedback with explanations

3. **Progress Tracking**
   - XP points system
   - Daily streak counter
   - Lesson completion percentage
   - Quiz scores history

4. **Gamification**
   - Achievement badges
   - Level progression
   - Animated celebrations

### Grammar Topics Covered
1. **Tenses** (12 tenses)
   - Present Simple, Present Continuous
   - Past Simple, Past Continuous
   - Future Simple, Future Continuous
   - Present Perfect, Past Perfect
   - Future Perfect, Present Perfect Continuous
   - Past Perfect Continuous, Future Perfect Continuous

2. **Parts of Speech**
   - Nouns, Pronouns, Verbs
   - Adjectives, Adverbs
   - Prepositions, Conjunctions
   - Articles, Interjections

3. **Sentence Structure**
   - Simple Sentences
   - Compound Sentences
   - Complex Sentences
   - Questions & Negations

4. **Special Grammar**
   - Modal Verbs
   - Conditionals
   - Passive Voice
   - Reported Speech

---

## 4. UI/UX Design Direction

### Visual Style
- **Design System:** Material Design 3 with custom theming
- **Aesthetic:** Modern, clean, educational yet fun (Duolingo-inspired)
- **Color Scheme:**
  - Primary: Purple (#6C63FF)
  - Secondary: Green (#00C853) for success
  - Accent: Orange (#FF9800) for streak/fire
  - Error: Red (#F44336)
  - Background: Light (#F5F5F5)
  - Card: White (#FFFFFF)

### Typography
- **Headings:** Poppins Bold
- **Body:** Poppins Regular
- **Code/Examples:** Roboto Mono

### Layout Approach
- **Navigation:** Bottom Navigation Bar (3 tabs)
  - Home (Lessons)
  - Practice (Quizzes)
  - Profile (Progress)
- **Lesson Flow:** Card-based lessons with swipe navigation
- **Quiz UI:** Large touch targets, clear visual feedback

### Animations
- Page transitions: Slide transitions
- Quiz answers: Bounce effect on correct, shake on wrong
- Progress: Animated progress bars
- Celebrations: Confetti/Lottie on achievements

---

## 5. Data Structure

### Local Storage Schema
```
- completed_lessons: List<String>
- quiz_scores: Map<String, int>
- total_xp: int
- current_streak: int
- last_study_date: String
- level: int
- achievements: List<String>
```

### Content Format
All grammar content stored as Dart constants (no external API needed)
