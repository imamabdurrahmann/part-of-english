import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/grammar_data.dart';
import '../models/grammar_models.dart';
import '../providers/progress_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/animations.dart';
import 'topic_screen.dart';
import 'vocabulary_screen.dart';
import 'idioms_screen.dart';
import 'collocation_screen.dart';
import 'word_roots_screen.dart';
import 'srs_screen.dart';
import 'daily_challenge_screen.dart';
import 'sentence_transform_screen.dart';
import 'grammar_error_screen.dart';
import 'mnemonics_screen.dart';
import 'tts_settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = GrammarData.categories;
    final progress = context.watch<ProgressProvider>().progress;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header with animations
            SliverToBoxAdapter(
              child: FadeSlideIn(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Part of English',
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Learn English Offline',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          // Animated streak badge
                          if (progress.currentStreak > 0)
                            PulseWidget(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      '🔥',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(width: 4),
                                    CountUpText(
                                      value: progress.currentStreak,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      progress.currentStreak == 1
                                          ? 'day'
                                          : 'days',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                children: [
                                  Text('🔥', style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 4),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Progress Card with animations
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // XP Badge with glow
                                    GlowBox(
                                      glowColor: const Color(0xFFFFD700),
                                      blurRadius: 15,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFD700)
                                              .withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.star,
                                                color: Color(0xFFFFD700),
                                                size: 20),
                                            const SizedBox(width: 4),
                                            CountUpText(
                                              value: progress.totalXp,
                                              style: theme.textTheme.titleMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              ' XP',
                                              style: theme.textTheme.titleMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    // Level Badge
                                    GlowBox(
                                      glowColor: AppTheme.primaryColor,
                                      blurRadius: 15,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryColor
                                              .withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.military_tech,
                                                color: AppTheme.primaryColor,
                                                size: 18),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Level ${progress.level}',
                                              style: theme.textTheme.titleMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${progress.completedLessons.length}/${GrammarData.getTotalLessons()} Lessons',
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            AnimatedProgressBar(
                              progress: progress.completedLessons.length /
                                  GrammarData.getTotalLessons(),
                              gradientColors: const [
                                AppTheme.primaryColor,
                                AppTheme.secondaryColor
                              ],
                              height: 10,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${((progress.completedLessons.length / GrammarData.getTotalLessons()) * 100).toInt()}% Complete',
                                  style: theme.textTheme.bodySmall,
                                ),
                                // XP progress to next level
                                Text(
                                  '${progress.totalXp % (progress.level * 100)}/${progress.level * 100} to next level',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: AppTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Categories Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  'Categories',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            ),
            // Categories List with staggered animation
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = categories[index];
                  final categoryProgress =
                      _getCategoryProgress(category, progress);
                  return StaggeredListItem(
                    index: index,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: _CategoryCard(
                        category: category,
                        progress: categoryProgress,
                      ),
                    ),
                  );
                },
                childCount: categories.length,
              ),
            ),
            // Extra Features Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Text(
                  'Latihan & Tools',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            ),
            // Extra Features Grid with animation
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.3,
                ),
                delegate: SliverChildListDelegate([
                  StaggeredListItem(
                    index: 0,
                    child: _ExtraFeatureCard(
                      icon: '🏆',
                      title: 'Daily\nChallenge',
                      color: const Color(0xFFFF5722),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DailyChallengeScreen()),
                      ),
                    ),
                  ),
                  StaggeredListItem(
                    index: 1,
                    child: _ExtraFeatureCard(
                      icon: '📚',
                      title: 'Spaced\nRepetition',
                      color: const Color(0xFF9C27B0),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SrsScreen()),
                      ),
                    ),
                  ),
                  StaggeredListItem(
                    index: 2,
                    child: _ExtraFeatureCard(
                      icon: '🔤',
                      title: 'Sentence\nTransform',
                      color: const Color(0xFF00796B),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SentenceTransformScreen()),
                      ),
                    ),
                  ),
                  StaggeredListItem(
                    index: 3,
                    child: _ExtraFeatureCard(
                      icon: '🐛',
                      title: 'Grammar\nError Fix',
                      color: const Color(0xFFE91E63),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const GrammarErrorScreen()),
                      ),
                    ),
                  ),
                  StaggeredListItem(
                    index: 4,
                    child: _ExtraFeatureCard(
                      icon: '🧐',
                      title: 'Mnemonics',
                      color: const Color(0xFF673AB7),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MnemonicsScreen()),
                      ),
                    ),
                  ),
                  StaggeredListItem(
                    index: 5,
                    child: _ExtraFeatureCard(
                      icon: '💬',
                      title: 'Text-toSpeech',
                      color: AppTheme.primaryColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TtsSettingsScreen()),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }

  double _getCategoryProgress(GrammarCategory category, progress) {
    int completed = 0;
    int total = 0;
    for (var topic in category.topics) {
      total += topic.lessons.length;
      for (var lesson in topic.lessons) {
        if (progress.completedLessons.contains(lesson.id)) {
          completed++;
        }
      }
    }
    return total > 0 ? completed / total : 0;
  }
}

class _CategoryCard extends StatelessWidget {
  final GrammarCategory category;
  final double progress;

  const _CategoryCard({
    required this.category,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoryColor = Color(category.color);

    return TapScale(
      onTap: () {
        if (category.id == 'vocabulary') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VocabularyScreen(),
            ),
          );
        } else if (category.id == 'idioms') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IdiomsScreen(),
            ),
          );
        } else if (category.id == 'collocation') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CollocationScreen(),
            ),
          );
        } else if (category.id == 'word_roots') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WordRootsScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TopicScreen(category: category),
            ),
          );
        }
      },
      child: RepaintBoundary(
        child: Container(
          padding: const EdgeInsets.all(16),
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
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: categoryColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    category.icon,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.description,
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: AnimatedProgressBar(
                            progress: progress,
                            gradientColors: [
                              categoryColor,
                              categoryColor.withValues(alpha: 0.7),
                            ],
                            height: 6,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: categoryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: categoryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExtraFeatureCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ExtraFeatureCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TapScale(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(icon, style: const TextStyle(fontSize: 24)),
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
