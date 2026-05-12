import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/progress_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/animations.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watch<ProgressProvider>().progress;

    final achievements = [
      _AchievementData(
        id: 'first_lesson',
        title: 'First Steps',
        description: 'Complete your first lesson',
        icon: Icons.school,
        color: AppTheme.primaryColor,
        requirement: 'Complete 1 lesson',
      ),
      _AchievementData(
        id: 'five_lessons',
        title: 'Getting Started',
        description: 'Complete 5 lessons',
        icon: Icons.auto_stories,
        color: AppTheme.accentColor,
        requirement: 'Complete 5 lessons',
      ),
      _AchievementData(
        id: 'ten_lessons',
        title: 'Dedicated Learner',
        description: 'Complete 10 lessons',
        icon: Icons.emoji_events,
        color: Colors.amber,
        requirement: 'Complete 10 lessons',
      ),
      _AchievementData(
        id: 'streak_3',
        title: 'On Fire',
        description: 'Maintain a 3-day streak',
        icon: Icons.local_fire_department,
        color: Colors.red,
        requirement: '3 day streak',
      ),
      _AchievementData(
        id: 'streak_7',
        title: 'Week Warrior',
        description: 'Maintain a 7-day streak',
        icon: Icons.whatshot,
        color: Colors.orange,
        requirement: '7 day streak',
      ),
      _AchievementData(
        id: 'streak_30',
        title: 'Grammar Champion',
        description: 'Maintain a 30-day streak',
        icon: Icons.military_tech,
        color: Colors.purple,
        requirement: '30 day streak',
      ),
      _AchievementData(
        id: 'level_5',
        title: 'Rising Star',
        description: 'Reach Level 5',
        icon: Icons.star,
        color: Colors.amber,
        requirement: 'Reach Level 5',
      ),
      _AchievementData(
        id: 'level_10',
        title: 'English Expert',
        description: 'Reach Level 10',
        icon: Icons.stars,
        color: Colors.indigo,
        requirement: 'Reach Level 10',
      ),
      _AchievementData(
        id: 'xp_1000',
        title: 'XP Hunter',
        description: 'Earn 1,000 XP',
        icon: Icons.bolt,
        color: Colors.yellow,
        requirement: 'Earn 1,000 XP',
      ),
      _AchievementData(
        id: 'xp_5000',
        title: 'XP Legend',
        description: 'Earn 5,000 XP',
        icon: Icons.electric_bolt,
        color: Colors.cyan,
        requirement: 'Earn 5,000 XP',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: FadeSlideIn(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TapScale(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.arrow_back),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            'Achievements',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _ProgressOverviewCard(
                        unlockedCount: progress.achievements.length,
                        totalCount: achievements.length,
                        totalXp: progress.totalXp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Achievement Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final achievement = achievements[index];
                    final isUnlocked = progress.achievements.contains(achievement.id);

                    return StaggeredListItem(
                      index: index,
                      child: _AchievementCard(
                        achievement: achievement,
                        isUnlocked: isUnlocked,
                      ),
                    );
                  },
                  childCount: achievements.length,
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
    );
  }
}

class _AchievementData {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String requirement;

  const _AchievementData({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.requirement,
  });
}

class _ProgressOverviewCard extends StatelessWidget {
  final int unlockedCount;
  final int totalCount;
  final int totalXp;

  const _ProgressOverviewCard({
    required this.unlockedCount,
    required this.totalCount,
    required this.totalXp,
  });

  @override
  Widget build(BuildContext context) {
    final progress = unlockedCount / totalCount;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Achievement Progress',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$unlockedCount of $totalCount Unlocked',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total XP: ',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12,
                ),
              ),
              CountUpText(
                value: totalXp,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final _AchievementData achievement;
  final bool isUnlocked;

  const _AchievementCard({
    required this.achievement,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAchievementDetails(context),
      child: Container(
        decoration: BoxDecoration(
          color: isUnlocked
              ? achievement.color.withValues(alpha: 0.1)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: isUnlocked
              ? Border.all(color: achievement.color.withValues(alpha: 0.3), width: 2)
              : null,
          boxShadow: isUnlocked
              ? [
                  BoxShadow(
                    color: achievement.color.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isUnlocked
                    ? achievement.color.withValues(alpha: 0.2)
                    : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                achievement.icon,
                size: 30,
                color: isUnlocked ? achievement.color : Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              achievement.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isUnlocked ? achievement.color : Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                isUnlocked ? achievement.description : '???',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: isUnlocked
                      ? AppTheme.textSecondary
                      : Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isUnlocked ? achievement.color : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isUnlocked ? '✓ Unlocked' : '🔒 Locked',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isUnlocked ? Colors.white : Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAchievementDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: isUnlocked
                    ? achievement.color.withValues(alpha: 0.1)
                    : Colors.grey.shade100,
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
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              achievement.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Requirement: ${achievement.requirement}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isUnlocked ? AppTheme.secondaryColor : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isUnlocked ? Icons.check_circle : Icons.lock,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isUnlocked ? 'Achievement Unlocked!' : 'Locked',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
