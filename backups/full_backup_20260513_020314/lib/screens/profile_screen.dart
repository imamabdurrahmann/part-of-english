import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../data/grammar_data.dart';
import '../providers/progress_provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/animations.dart';
import '../widgets/logo_widget.dart';
import 'achievements_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressProvider>().progress;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const ClipOval(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: LogoWidget(
                            size: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'English Learner',
                      style: theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    // Stats Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StatBadge(
                          icon: Icons.local_fire_department,
                          value: '${progress.currentStreak}',
                          label: 'Day Streak',
                        ),
                        const SizedBox(width: 24),
                        _StatBadge(
                          icon: Icons.star,
                          value: '${progress.totalXp}',
                          label: 'Total XP',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Dark Mode Toggle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: (isDark
                                      ? AppTheme.darkPrimaryColor
                                      : AppTheme.primaryColor)
                                  .withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                              color: isDark
                                  ? AppTheme.darkPrimaryColor
                                  : AppTheme.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
                                  style: theme.textTheme.titleMedium,
                                ),
                                Text(
                                  themeProvider.isDarkMode
                                      ? 'Dark theme enabled'
                                      : 'Light theme enabled',
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          Switch(
                            value: themeProvider.isDarkMode,
                            onChanged: (value) {
                              themeProvider.toggleTheme();
                            },
                            activeTrackColor: AppTheme.primaryColor.withValues(alpha: 0.5),
                            thumbColor: WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return AppTheme.primaryColor;
                              }
                              return Colors.grey;
                            }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Level Progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _LevelCard(progress: progress),
              ),
              const SizedBox(height: 24),
              // Statistics
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _StatisticsCard(progress: progress),
              ),
              const SizedBox(height: 24),
              // Achievements
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _AchievementsSection(progress: progress),
              ),
              const SizedBox(height: 16),
              // View All Achievements Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _ViewAllAchievementsButton(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatBadge({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LevelCard extends StatelessWidget {
  final dynamic progress;

  const _LevelCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final xpForNextLevel = progress.level * 100;
    final currentLevelXp = progress.totalXp % xpForNextLevel;
    final progressPercent = currentLevelXp / xpForNextLevel;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Level ${progress.level}',
                style: theme.textTheme.headlineSmall,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Level ${progress.level + 1}',
                  style: TextStyle(
                    color: AppTheme.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progressPercent,
              backgroundColor: theme.dividerTheme.color,
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
              minHeight: 12,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$currentLevelXp XP',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$xpForNextLevel XP',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {
  final dynamic progress;

  const _StatisticsCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistics',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _StatRow(
            icon: Icons.book,
            iconColor: AppTheme.primaryColor,
            label: 'Lessons Completed',
            value: '${progress.completedLessons.length}',
            total: '${GrammarData.getTotalLessons()}',
          ),
          Divider(height: 24, color: theme.dividerTheme.color),
          _StatRow(
            icon: Icons.quiz,
            iconColor: AppTheme.accentColor,
            label: 'Quizzes Completed',
            value: '${progress.quizScores.length}',
            total: '${GrammarData.getTotalQuizzes()}',
          ),
          Divider(height: 24, color: theme.dividerTheme.color),
          _StatRow(
            icon: Icons.percent,
            iconColor: AppTheme.secondaryColor,
            label: 'Overall Progress',
            value: '${(progress.overallProgress * 100).toInt()}%',
            total: null,
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String? total;

  const _StatRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Text(
          total != null ? '$value / $total' : value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: iconColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _AchievementsSection extends StatelessWidget {
  final dynamic progress;

  const _AchievementsSection({required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final achievements = [
      _Achievement(
        id: 'first_lesson',
        title: 'First Step',
        description: 'Complete your first lesson',
        icon: Icons.school,
        color: AppTheme.primaryColor,
      ),
      _Achievement(
        id: 'five_lessons',
        title: 'Getting Started',
        description: 'Complete 5 lessons',
        icon: Icons.auto_stories,
        color: AppTheme.accentColor,
      ),
      _Achievement(
        id: 'ten_lessons',
        title: 'Dedicated Learner',
        description: 'Complete 10 lessons',
        icon: Icons.emoji_events,
        color: Colors.amber,
      ),
      _Achievement(
        id: 'streak_3',
        title: 'On Fire',
        description: '3 day streak',
        icon: Icons.local_fire_department,
        color: Colors.red,
      ),
      _Achievement(
        id: 'streak_7',
        title: 'Week Warrior',
        description: '7 day streak',
        icon: Icons.whatshot,
        color: Colors.orange,
      ),
      _Achievement(
        id: 'level_5',
        title: 'Rising Star',
        description: 'Reach level 5',
        icon: Icons.star,
        color: Colors.amber,
      ),
      _Achievement(
        id: 'xp_1000',
        title: 'XP Master',
        description: 'Earn 1000 XP',
        icon: Icons.military_tech,
        color: Colors.purple,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Achievements',
                style: theme.textTheme.headlineSmall,
              ),
              const Spacer(),
              Text(
                '${progress.achievements.length}/${achievements.length}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              final isUnlocked = progress.achievements.contains(achievement.id);

              return _AchievementBadge(
                achievement: achievement,
                isUnlocked: isUnlocked,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Achievement {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const _Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class _AchievementBadge extends StatelessWidget {
  final _Achievement achievement;
  final bool isUnlocked;

  const _AchievementBadge({
    required this.achievement,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: isUnlocked
                        ? achievement.color.withValues(alpha: 0.1)
                        : (isDark ? const Color(0xFF2A2A2A) : Colors.grey.shade100),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    achievement.icon,
                    size: 40,
                    color: isUnlocked ? achievement.color : Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  achievement.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  achievement.description,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isUnlocked ? AppTheme.secondaryColor : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isUnlocked ? 'Unlocked!' : 'Locked',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isUnlocked
              ? achievement.color.withValues(alpha: 0.1)
              : (isDark ? const Color(0xFF2A2A2A) : Colors.grey.shade100),
          borderRadius: BorderRadius.circular(16),
          border: isUnlocked
              ? Border.all(color: achievement.color.withValues(alpha: 0.3))
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              achievement.icon,
              size: 32,
              color: isUnlocked ? achievement.color : Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              achievement.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isUnlocked ? achievement.color : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewAllAchievementsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TapScale(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AchievementsScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.emoji_events,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'View All Achievements',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See your progress and unlock more badges',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.primaryColor,
              size: 16,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 300)).slideX(begin: 0.1);
  }
}
