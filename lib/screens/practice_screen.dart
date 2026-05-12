import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/grammar_data.dart';
import '../models/grammar_models.dart';
import '../providers/progress_provider.dart';
import '../theme/app_theme.dart';
import 'quiz_screen.dart';
import 'daily_challenge_screen.dart';
import 'sentence_transform_screen.dart';
import 'grammar_error_screen.dart';
import 'mnemonics_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = GrammarData.categories;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.accentColor,
                      AppTheme.accentColor.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.quiz_outlined, color: Colors.white, size: 28),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Practice',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Test your grammar skills',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // All Quizzes
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'All Quizzes',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            ),
            // Quizzes List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // Find the quiz and its parent category/topic
                  final quizInfo = _getQuizInfo(categories, index);
                  if (quizInfo == null) return const SizedBox.shrink();

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: _QuizCard(
                      quiz: quizInfo['quiz'] as Quiz,
                      categoryName: quizInfo['category'] as String,
                      topicName: quizInfo['topic'] as String,
                      color: quizInfo['color'] as Color,
                    ),
                  );
                },
                childCount: GrammarData.getTotalQuizzes(),
              ),
            ),
            // Special Practice Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Text(
                  'Special Practice',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                delegate: SliverChildListDelegate([
                  _SpecialPracticeCard(
                    icon: Icons.emoji_events,
                    title: 'Daily Challenge',
                    subtitle: '+50-60 XP',
                    color: const Color(0xFFFF5722),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DailyChallengeScreen()),
                    ),
                  ),
                  _SpecialPracticeCard(
                    icon: Icons.auto_awesome,
                    title: 'Sentence Transform',
                    subtitle: 'Latihan ubah kalimat',
                    color: const Color(0xFF00796B),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SentenceTransformScreen()),
                    ),
                  ),
                  _SpecialPracticeCard(
                    icon: Icons.bug_report,
                    title: 'Error Correction',
                    subtitle: 'Temukan kesalahan',
                    color: const Color(0xFFE91E63),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GrammarErrorScreen()),
                    ),
                  ),
                  _SpecialPracticeCard(
                    icon: Icons.psychology,
                    title: 'Mnemonics',
                    subtitle: 'Trik mengingat',
                    color: const Color(0xFF673AB7),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MnemonicsScreen()),
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

  Map<String, dynamic>? _getQuizInfo(List<GrammarCategory> categories, int index) {
    int count = 0;
    for (var category in categories) {
      for (var topic in category.topics) {
        for (var quiz in topic.quizzes) {
          if (count == index) {
            return {
              'quiz': quiz,
              'category': category.name,
              'topic': topic.title,
              'color': Color(category.color),
            };
          }
          count++;
        }
      }
    }
    return null;
  }
}

class _QuizCard extends StatelessWidget {
  final Quiz quiz;
  final String categoryName;
  final String topicName;
  final Color color;

  const _QuizCard({
    required this.quiz,
    required this.categoryName,
    required this.topicName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressProvider = context.watch<ProgressProvider>();
    final score = progressProvider.getQuizScore(quiz.id);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(
              quiz: quiz,
              categoryId: quiz.topicId.split('_').first,
              topicId: quiz.topicId,
              color: color,
            ),
          ),
        );
      },
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
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.quiz_outlined,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quiz.title,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$categoryName - $topicName',
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${quiz.questions.length} Questions',
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.star, size: 14, color: AppTheme.accentColor),
                      const SizedBox(width: 4),
                      Text(
                        '${quiz.xpReward} XP',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (score != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: score >= 70 ? AppTheme.secondaryColor : AppTheme.errorColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$score%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SpecialPracticeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _SpecialPracticeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
