/// Application-wide constants
/// Centralized magic numbers for maintainability

class AppConstants {

  // ========== XP & Leveling System ==========
  /// Base XP required per level (multiplied by current level)
  static const int xpPerLevel = 100;

  /// Base XP reward for completing a lesson
  static const int baseLessonXp = 10;

  /// Multiplier for quiz XP based on score
  static const double quizXpMultiplier = 1.0;

  // ========== SRS (Spaced Repetition System) ==========
  /// Default ease factor for new cards
  static const double defaultEaseFactor = 2.5;

  /// Minimum ease factor (card becomes harder)
  static const double minEaseFactor = 1.3;

  /// Maximum ease factor (card becomes easier)
  static const double maxEaseFactor = 3.0;

  /// Maximum review interval in days
  static const int maxIntervalDays = 180;

  /// Interval for 'Again' rating (same day)
  static const int againIntervalDays = 0;

  /// Interval multipliers by rating
  static const double hardIntervalMultiplier = 1.2;
  static const double easyIntervalMultiplier = 1.3;

  // First review intervals (in days)
  static const int firstReviewEasy = 4;
  static const int firstReviewHard = 1;
  static const int firstReviewGood = 2;

  // Second review intervals (in days)
  static const int secondReviewEasy = 10;
  static const int secondReviewHard = 3;
  static const int secondReviewGood = 6;

  // ========== UI Animation ==========
  /// Standard animation duration in milliseconds
  static const int animationDurationMs = 400;

  /// Fast animation for micro-interactions
  static const int fastAnimationMs = 200;

  /// Slow animation for emphasis
  static const int slowAnimationMs = 600;

  /// Stagger delay between list items
  static const int staggerDelayMs = 50;

  // ========== Gamification ==========
  /// Streak milestones that trigger celebrations
  static const List<int> streakMilestones = [3, 7, 14, 30, 60, 100];

  /// Achievement thresholds
  static const int firstLessonXpThreshold = 0;
  static const int fiveLessonsThreshold = 5;
  static const int tenLessonsThreshold = 10;
  static const int level5Threshold = 5;
  static const int level10Threshold = 10;
  static const int xp1000Threshold = 1000;
  static const int xp5000Threshold = 5000;

  // ========== Quiz ==========
  /// Default quiz time limit (null = no limit)
  static const int? defaultQuizTimeLimit = null;

  /// Minimum score percentage for "passing"
  static const int passThreshold = 70;

  // ========== Storage Keys ==========
  /// SharedPreferences keys
  static const String keyCompletedLessons = 'completed_lessons';
  static const String keyQuizScores = 'quiz_scores';
  static const String keyTotalXp = 'total_xp';
  static const String keyCurrentStreak = 'current_streak';
  static const String keyLastStudyDate = 'last_study_date';
  static const String keyLevel = 'level';
  static const String keyAchievements = 'achievements';
  static const String keyTopicProgress = 'topic_progress';
  static const String keySrsCards = 'srs_cards';
  static const String keySrsHistory = 'srs_history';
}
