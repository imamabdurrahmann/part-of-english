import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../models/user_progress.dart';
import '../widgets/celebrations.dart';

class ProgressProvider extends ChangeNotifier {
  UserProgress _progress = const UserProgress();
  bool _isLoading = true;
  int _previousLevel = 1;
  bool _showedStreakMilestone = false;

  UserProgress get progress => _progress;
  bool get isLoading => _isLoading;

  ProgressProvider() {
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    final completedLessons = prefs.getStringList(AppConstants.keyCompletedLessons) ?? [];
    final quizScoresJson = prefs.getString(AppConstants.keyQuizScores);
    final totalXp = prefs.getInt(AppConstants.keyTotalXp) ?? 0;
    final currentStreak = prefs.getInt(AppConstants.keyCurrentStreak) ?? 0;
    final lastStudyDate = prefs.getString(AppConstants.keyLastStudyDate) ?? '';
    final level = prefs.getInt(AppConstants.keyLevel) ?? 1;
    final achievements = prefs.getStringList('achievements') ?? [];
    final topicProgressJson = prefs.getString('topic_progress');

    Map<String, int> quizScores = {};
    if (quizScoresJson != null) {
      final parts = quizScoresJson.split(',');
      for (var part in parts) {
        if (part.contains(':')) {
          final keyValue = part.split(':');
          quizScores[keyValue[0]] = int.tryParse(keyValue[1]) ?? 0;
        }
      }
    }

    Map<String, int> topicProgress = {};
    if (topicProgressJson != null) {
      final parts = topicProgressJson.split(',');
      for (var part in parts) {
        if (part.contains(':')) {
          final keyValue = part.split(':');
          topicProgress[keyValue[0]] = int.tryParse(keyValue[1]) ?? 0;
        }
      }
    }

    // Check streak
    int streak = currentStreak;
    if (lastStudyDate.isNotEmpty) {
      final lastDate = DateTime.parse(lastStudyDate);
      final today = DateTime.now();
      final difference = today.difference(lastDate).inDays;

      if (difference > 1) {
        streak = 0;
      }
    }

    _progress = UserProgress(
      completedLessons: completedLessons,
      quizScores: quizScores,
      totalXp: totalXp,
      currentStreak: streak,
      lastStudyDate: lastStudyDate,
      level: level,
      achievements: achievements,
      topicProgress: topicProgress,
    );

    _previousLevel = level;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(AppConstants.keyCompletedLessons, _progress.completedLessons);

    final quizScoresString = _progress.quizScores.entries
        .map((e) => '${e.key}:${e.value}')
        .join(',');
    await prefs.setString(AppConstants.keyQuizScores, quizScoresString);

    await prefs.setInt(AppConstants.keyTotalXp, _progress.totalXp);
    await prefs.setInt(AppConstants.keyCurrentStreak, _progress.currentStreak);
    await prefs.setString(AppConstants.keyLastStudyDate, _progress.lastStudyDate);
    await prefs.setInt(AppConstants.keyLevel, _progress.level);
    await prefs.setStringList(AppConstants.keyAchievements, _progress.achievements);

    final topicProgressString = _progress.topicProgress.entries
        .map((e) => '${e.key}:${e.value}')
        .join(',');
    await prefs.setString(AppConstants.keyTopicProgress, topicProgressString);
  }

  Future<void> completeLesson(String lessonId, int xpEarned, {BuildContext? context}) async {
    final today = DateTime.now().toIso8601String().split('T')[0];
    final yesterday = DateTime.now().subtract(const Duration(days: 1)).toIso8601String().split('T')[0];

    int newStreak = _progress.currentStreak;
    if (_progress.lastStudyDate != today) {
      if (_progress.lastStudyDate == yesterday) {
        newStreak++;
      } else if (_progress.lastStudyDate != today) {
        newStreak = 1;
      }
    }

    final newCompletedLessons = [..._progress.completedLessons];
    if (!newCompletedLessons.contains(lessonId)) {
      newCompletedLessons.add(lessonId);
    }

    int newXp = _progress.totalXp + xpEarned;
    int newLevel = _progress.level;
    while (newXp >= newLevel * AppConstants.xpPerLevel) {
      newXp -= newLevel * AppConstants.xpPerLevel;
      newLevel++;
    }

    // Check for streak milestone
    _checkStreakMilestone(newStreak, context);

    // Check for level up (with mounted check for async safety)
    if (newLevel > _previousLevel && context != null && context.mounted) {
      _showLevelUpDialog(context, newLevel);
      _previousLevel = newLevel;
    }

    _progress = _progress.copyWith(
      completedLessons: newCompletedLessons,
      totalXp: newXp,
      currentStreak: newStreak,
      lastStudyDate: today,
      level: newLevel,
    );

    await _saveProgress();
    if (context != null && context.mounted) {
      _checkAchievements(context: context);
    }
    notifyListeners();
  }

  Future<void> completeQuiz(String quizId, int score, int xpEarned, {BuildContext? context}) async {
    final today = DateTime.now().toIso8601String().split('T')[0];
    final yesterday = DateTime.now().subtract(const Duration(days: 1)).toIso8601String().split('T')[0];

    int newStreak = _progress.currentStreak;
    if (_progress.lastStudyDate != today) {
      if (_progress.lastStudyDate == yesterday) {
        newStreak++;
      } else if (_progress.lastStudyDate != today) {
        newStreak = 1;
      }
    }

    final newQuizScores = Map<String, int>.from(_progress.quizScores);
    if (!newQuizScores.containsKey(quizId) || newQuizScores[quizId]! < score) {
      newQuizScores[quizId] = score;
    }

    int newXp = _progress.totalXp + xpEarned;
    int newLevel = _progress.level;
    while (newXp >= newLevel * 100) {
      newXp -= newLevel * 100;
      newLevel++;
    }

    // Check for streak milestone
    _checkStreakMilestone(newStreak, context);

    // Check for level up
    if (newLevel > _previousLevel && context != null) {
      _showLevelUpDialog(context, newLevel);
      _previousLevel = newLevel;
    }

    _progress = _progress.copyWith(
      quizScores: newQuizScores,
      totalXp: newXp,
      currentStreak: newStreak,
      lastStudyDate: today,
      level: newLevel,
    );

    await _saveProgress();
    if (context != null && context.mounted) {
      _checkAchievements(context: context);
    }
    notifyListeners();
  }

  Future<void> addXp(int xpAmount, {BuildContext? context}) async {
    int newXp = _progress.totalXp + xpAmount;
    int newLevel = _progress.level;
    while (newXp >= newLevel * 100) {
      newXp -= newLevel * 100;
      newLevel++;
    }

    final today = DateTime.now().toIso8601String().split('T')[0];
    final yesterday = DateTime.now().subtract(const Duration(days: 1)).toIso8601String().split('T')[0];
    int newStreak = _progress.currentStreak;
    if (_progress.lastStudyDate != today) {
      if (_progress.lastStudyDate == yesterday) {
        newStreak++;
      } else {
        newStreak = 1;
      }
    }

    // Check for streak milestone
    _checkStreakMilestone(newStreak, context);

    // Check for level up
    if (newLevel > _previousLevel && context != null) {
      _showLevelUpDialog(context, newLevel);
      _previousLevel = newLevel;
    }

    _progress = _progress.copyWith(
      totalXp: newXp,
      currentStreak: newStreak,
      lastStudyDate: today,
      level: newLevel,
    );

    await _saveProgress();
    if (context != null && context.mounted) {
      _checkAchievements(context: context);
    }
    notifyListeners();
  }

  Future<void> updateTopicProgress(String topicId, int progressValue) async {
    final newTopicProgress = Map<String, int>.from(_progress.topicProgress);
    newTopicProgress[topicId] = progressValue;

    _progress = _progress.copyWith(topicProgress: newTopicProgress);
    await _saveProgress();
    notifyListeners();
  }

  void _checkStreakMilestone(int newStreak, BuildContext? context) {
    if (context == null) return;

    final milestones = [3, 7, 14, 30, 60, 100];
    for (final milestone in milestones) {
      if (newStreak == milestone && !_showedStreakMilestone) {
        StreakMilestoneDialog.show(context, newStreak);
        _showedStreakMilestone = true;
        Future.delayed(const Duration(hours: 24), () {
          _showedStreakMilestone = false;
        });
        break;
      }
    }
  }

  void _showLevelUpDialog(BuildContext context, int newLevel) {
    LevelUpDialog.show(context, newLevel);
  }

  void _checkAchievements({BuildContext? context}) {
    List<String> newAchievements = List.from(_progress.achievements);
    String? unlockedAchievement;

    // First lesson
    if (_progress.completedLessons.isNotEmpty && !newAchievements.contains('first_lesson')) {
      newAchievements.add('first_lesson');
      unlockedAchievement = 'first_lesson';
    }

    // 5 lessons
    if (_progress.completedLessons.length >= 5 && !newAchievements.contains('five_lessons')) {
      newAchievements.add('five_lessons');
      unlockedAchievement = 'five_lessons';
    }

    // 10 lessons
    if (_progress.completedLessons.length >= 10 && !newAchievements.contains('ten_lessons')) {
      newAchievements.add('ten_lessons');
      unlockedAchievement = 'ten_lessons';
    }

    // Streak 3 days
    if (_progress.currentStreak >= 3 && !newAchievements.contains('streak_3')) {
      newAchievements.add('streak_3');
      unlockedAchievement = 'streak_3';
    }

    // Streak 7 days
    if (_progress.currentStreak >= 7 && !newAchievements.contains('streak_7')) {
      newAchievements.add('streak_7');
      unlockedAchievement = 'streak_7';
    }

    // Streak 30 days
    if (_progress.currentStreak >= 30 && !newAchievements.contains('streak_30')) {
      newAchievements.add('streak_30');
      unlockedAchievement = 'streak_30';
    }

    // Level 5
    if (_progress.level >= 5 && !newAchievements.contains('level_5')) {
      newAchievements.add('level_5');
      unlockedAchievement = 'level_5';
    }

    // Level 10
    if (_progress.level >= 10 && !newAchievements.contains('level_10')) {
      newAchievements.add('level_10');
      unlockedAchievement = 'level_10';
    }

    // XP 1000
    if (_progress.totalXp >= 1000 && !newAchievements.contains('xp_1000')) {
      newAchievements.add('xp_1000');
      unlockedAchievement = 'xp_1000';
    }

    // XP 5000
    if (_progress.totalXp >= 5000 && !newAchievements.contains('xp_5000')) {
      newAchievements.add('xp_5000');
      unlockedAchievement = 'xp_5000';
    }

    if (unlockedAchievement != null && context != null && context.mounted) {
      final achievementData = _getAchievementData(unlockedAchievement);
      AchievementDialog.show(
        context,
        title: achievementData['title']!,
        description: achievementData['description']!,
      );
    }

    if (newAchievements.length != _progress.achievements.length) {
      _progress = _progress.copyWith(achievements: newAchievements);
    }
  }

  Map<String, String> _getAchievementData(String achievementId) {
    final achievements = {
      'first_lesson': {'title': 'First Steps', 'description': 'Complete your first lesson'},
      'five_lessons': {'title': 'Getting Started', 'description': 'Complete 5 lessons'},
      'ten_lessons': {'title': 'Dedicated Learner', 'description': 'Complete 10 lessons'},
      'streak_3': {'title': 'On Fire', 'description': 'Maintain a 3-day streak'},
      'streak_7': {'title': 'Week Warrior', 'description': 'Maintain a 7-day streak'},
      'streak_30': {'title': 'English Champion', 'description': 'Maintain a 30-day streak'},
      'level_5': {'title': 'Rising Star', 'description': 'Reach Level 5'},
      'level_10': {'title': 'English Expert', 'description': 'Reach Level 10'},
      'xp_1000': {'title': 'XP Hunter', 'description': 'Earn 1,000 XP'},
      'xp_5000': {'title': 'XP Legend', 'description': 'Earn 5,000 XP'},
    };
    return achievements[achievementId] ?? {'title': 'Achievement', 'description': 'New achievement unlocked'};
  }

  bool isLessonCompleted(String lessonId) {
    return _progress.completedLessons.contains(lessonId);
  }

  int? getQuizScore(String quizId) {
    return _progress.quizScores[quizId];
  }

  bool hasAchievement(String achievementId) {
    return _progress.achievements.contains(achievementId);
  }
}