class UserProgress {
  final List<String> completedLessons;
  final Map<String, int> quizScores;
  final int totalXp;
  final int currentStreak;
  final String lastStudyDate;
  final int level;
  final List<String> achievements;
  final Map<String, int> topicProgress;

  const UserProgress({
    this.completedLessons = const [],
    this.quizScores = const {},
    this.totalXp = 0,
    this.currentStreak = 0,
    this.lastStudyDate = '',
    this.level = 1,
    this.achievements = const [],
    this.topicProgress = const {},
  });

  UserProgress copyWith({
    List<String>? completedLessons,
    Map<String, int>? quizScores,
    int? totalXp,
    int? currentStreak,
    String? lastStudyDate,
    int? level,
    List<String>? achievements,
    Map<String, int>? topicProgress,
  }) {
    return UserProgress(
      completedLessons: completedLessons ?? this.completedLessons,
      quizScores: quizScores ?? this.quizScores,
      totalXp: totalXp ?? this.totalXp,
      currentStreak: currentStreak ?? this.currentStreak,
      lastStudyDate: lastStudyDate ?? this.lastStudyDate,
      level: level ?? this.level,
      achievements: achievements ?? this.achievements,
      topicProgress: topicProgress ?? this.topicProgress,
    );
  }

  int get xpForNextLevel => level * 100;

  double get levelProgress => (totalXp % (level * 100)) / (level * 100);

  int get totalLessonsCompleted => completedLessons.length;

  double get overallProgress {
    const totalLessons = 48; // Total lessons in the app
    return completedLessons.length / totalLessons;
  }
}
