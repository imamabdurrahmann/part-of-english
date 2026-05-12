// ==================== VOCABULARY MODELS ====================

class VocabularyCategory {
  final String name;
  final List<VocabularyWord> words;

  const VocabularyCategory({
    required this.name,
    required this.words,
  });
}

class VocabularyWord {
  final String english;
  final String indonesian;
  final String example;
  final String? simpleExample;    // Simple SVO sentence
  final String? complexExample;  // Complex SVO sentence

  const VocabularyWord({
    required this.english,
    required this.indonesian,
    required this.example,
    this.simpleExample,
    this.complexExample,
  });
}

// ==================== GRAMMAR MODELS ====================

class GrammarCategory {
  final String id;
  final String name;
  final String description;
  final String icon;
  final List<GrammarTopic> topics;
  final int color;

  const GrammarCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.topics,
    required this.color,
  });
}

class GrammarTopic {
  final String id;
  final String title;
  final String description;
  final List<Lesson> lessons;
  final List<Quiz> quizzes;

  const GrammarTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.lessons,
    required this.quizzes,
  });
}

class Lesson {
  final String id;
  final String title;
  final String content;
  final List<GrammarExample> examples;
  final List<String> tips;
  final int xpReward;

  const Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.examples,
    required this.tips,
    required this.xpReward,
  });

  /// Returns examples interleaved by sentence type index:
  /// Pattern: Pos[0], Neg[0], Int[0], Pos[1], Neg[1], Int[1], ...
  /// Any remaining items from longer lists appended at end.
  List<GrammarExample> get sortedExamples {
    // Separate into 3 lists based on sentence type
    final posList = <GrammarExample>[];
    final negList = <GrammarExample>[];
    final intList = <GrammarExample>[];

    for (final example in examples) {
      switch (example.sentenceType) {
        case SentenceType.positive:
          posList.add(example);
          break;
        case SentenceType.negative:
          negList.add(example);
          break;
        case SentenceType.interrogative:
          intList.add(example);
          break;
      }
    }

    // Build interleaved result
    final result = <GrammarExample>[];
    final maxLen = [posList.length, negList.length, intList.length].reduce(
      (a, b) => a > b ? a : b,
    );

    for (int i = 0; i < maxLen; i++) {
      // Add items from each list at current index (if exists)
      if (i < posList.length) result.add(posList[i]);
      if (i < negList.length) result.add(negList[i]);
      if (i < intList.length) result.add(intList[i]);
    }

    return result;
  }
}

/// Enum for sentence type classification
/// Used to sort examples in consistent order: +, -, ?
enum SentenceType {
  /// Positive/Afirmative sentence (+)
  positive,

  /// Negative sentence (-)
  negative,

  /// Interrogative/Question sentence (?)
  interrogative,
}

/// Extension to provide convenient properties for SentenceType
extension SentenceTypeExtension on SentenceType {
  /// Returns the symbol representation
  String get symbol {
    switch (this) {
      case SentenceType.positive:
        return '+';
      case SentenceType.negative:
        return '-';
      case SentenceType.interrogative:
        return '?';
    }
  }

  /// Returns the label for UI display
  String get label {
    switch (this) {
      case SentenceType.positive:
        return 'Positive';
      case SentenceType.negative:
        return 'Negative';
      case SentenceType.interrogative:
        return 'Interrogative';
    }
  }

  /// Returns short label for compact display
  String get shortLabel {
    switch (this) {
      case SentenceType.positive:
        return 'Pos';
      case SentenceType.negative:
        return 'Neg';
      case SentenceType.interrogative:
        return 'Int';
    }
  }
}

/// Grammar example with sentence type classification
class GrammarExample {
  final String english;
  final String indonesian;
  final String? explanation;
  final SentenceType sentenceType;

  /// Constructor with auto-detection of sentence type from English text
  GrammarExample({
    required this.english,
    required this.indonesian,
    this.explanation,
    SentenceType? sentenceType,
  }) : sentenceType = sentenceType ?? _detectSentenceType(english);

  /// Auto-detect sentence type from English text
  /// Rules:
  /// 1. If ends with '?' → interrogative
  /// 2. If contains ' not ' (with spaces) or "n't" → negative
  /// 3. Otherwise → positive
  static SentenceType _detectSentenceType(String english) {
    final lower = english.toLowerCase().trim();

    // Rule 1: Question mark
    if (lower.endsWith('?')) {
      return SentenceType.interrogative;
    }

    // Rule 2: Negative markers (check BEFORE positive)
    // Use direct string contains for precise matching
    if (lower.contains(' not ') ||               // " not " with spaces
        lower.contains("n't") ||                // contractions like don't, doesn't
        lower.contains(' no ') ||               // " no " with spaces
        lower.contains('never ') ||              // starts with never
        lower.contains('nobody') ||             // nobody
        lower.contains('nothing') ||           // nothing
        lower.contains('nowhere')) {            // nowhere
      return SentenceType.negative;
    }

    // Rule 3: Default to positive
    return SentenceType.positive;
  }
}

class Quiz {
  final String id;
  final String topicId;
  final String title;
  final List<QuizQuestion> questions;
  final int xpReward;
  final int? timeLimitSeconds; // Optional timer (null = no limit)

  const Quiz({
    required this.id,
    required this.topicId,
    required this.title,
    required this.questions,
    required this.xpReward,
    this.timeLimitSeconds,
  });
}

enum QuestionType {
  multipleChoice,
  fillInBlank,
  trueFalse,
  sentenceOrder,
  dragDrop,    // NEW: Drag and drop word ordering
  matching,    // NEW: Match items (e.g., subject-verb agreement)
}

class QuizQuestion {
  final String id;
  final QuestionType type;
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String explanation;
  final String? correctAnswer2; // For fill-in-blank with multiple valid answers
  final List<String>? orderedWords; // For sentence order
  final String? hint; // Optional hint for harder questions
  final List<String>? leftItems; // For matching: left column items
  final List<String>? rightItems; // For matching: right column items (shuffled)
  final List<int>? correctPairs; // For matching: correct pair indices [leftIndex, rightIndex]

  const QuizQuestion({
    required this.id,
    required this.type,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
    this.correctAnswer2,
    this.orderedWords,
    this.hint,
    this.leftItems,
    this.rightItems,
    this.correctPairs,
  });
}