import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/grammar_models.dart';
import '../providers/progress_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/animations.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;
  final String categoryId;
  final String topicId;
  final Color color;

  const LessonScreen({
    super.key,
    required this.lesson,
    required this.categoryId,
    required this.topicId,
    required this.color,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final progress = context.read<ProgressProvider>();
      setState(() {
        _isCompleted = progress.isLessonCompleted(widget.lesson.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sortedExamples = widget.lesson.sortedExamples;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with animation
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            backgroundColor: widget.color,
            leading: TapScale(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [widget.color, widget.color.withValues(alpha: 0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            GlowBox(
                              glowColor: const Color(0xFFFFD700),
                              blurRadius: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
                                    SizedBox(width: 4),
                                    Text(
                                      'XP',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            if (_isCompleted)
                              PulseWidget(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppTheme.secondaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.check_circle, color: Colors.white, size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        'Completed',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.lesson.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Content with animations
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Content
                  FadeSlideIn(
                    child: _ContentSection(
                      content: widget.lesson.content,
                      color: widget.color,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Examples (sorted by sentence type: +, -, ?)
                  if (sortedExamples.isNotEmpty) ...[
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 200),
                      child: _SectionTitle(
                        title: 'Examples',
                        icon: Icons.lightbulb_outline,
                        color: widget.color,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...sortedExamples.asMap().entries.map((entry) {
                      return StaggeredListItem(
                        index: entry.key,
                        child: _ExampleCard(
                          example: entry.value,
                          color: widget.color,
                        ),
                      );
                    }),
                    const SizedBox(height: 24),
                  ],
                  // Tips
                  if (widget.lesson.tips.isNotEmpty) ...[
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 400),
                      child: _SectionTitle(
                        title: 'Tips',
                        icon: Icons.tips_and_updates_outlined,
                        color: widget.color,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...widget.lesson.tips.asMap().entries.map((entry) {
                      return StaggeredListItem(
                        index: entry.key + sortedExamples.length,
                        child: _TipCard(
                          tip: entry.value,
                          color: widget.color,
                        ),
                      );
                    }),
                  ],
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: TapScale(
            onTap: _isCompleted ? null : () => _completeLesson(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: ElevatedButton(
                onPressed: _isCompleted ? null : () => _completeLesson(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isCompleted ? Colors.grey : widget.color,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isCompleted ? Icons.check_circle : Icons.done_all,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isCompleted ? 'Lesson Completed!' : 'Mark as Complete',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _completeLesson(BuildContext context) async {
    final progress = context.read<ProgressProvider>();
    await progress.completeLesson(widget.lesson.id, widget.lesson.xpReward, context: context);

    if (!mounted) return;

    setState(() {
      _isCompleted = true;
    });

    if (context.mounted) {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C853), Color(0xFF69F0AE)],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.secondaryColor.withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.celebration,
                  color: Colors.white,
                  size: 48,
                ),
              )
                  .animate()
                  .scale(
                    begin: const Offset(0, 0),
                    end: const Offset(1, 1),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticOut,
                  ),
              const SizedBox(height: 24),
              const Text(
                'Great Job!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 300)),
              const SizedBox(height: 8),
              GlowBox(
                glowColor: const Color(0xFFFFD700),
                blurRadius: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFD700), size: 20),
                      const SizedBox(width: 8),
                      Text(
                        '+${widget.lesson.xpReward} XP',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFD700),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.color,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Continue'),
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 500)).slideY(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  final String content;
  final Color color;

  const _ContentSection({
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final paragraphs = content.split('\n\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.map((paragraph) {
        if (paragraph.startsWith('**') && paragraph.endsWith('**')) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 8),
            child: Text(
              paragraph.replaceAll('**', ''),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else if (paragraph.contains('**')) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _RichTextParser(text: paragraph, color: color),
          );
        } else if (paragraph.startsWith('-')) {
          final items = paragraph.split('\n');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _RichTextParser(text: item.replaceFirst('- ', ''), color: color),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        } else if (paragraph.startsWith('|')) {
          return const SizedBox.shrink();
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _RichTextParser(text: paragraph, color: color),
          );
        }
      }).toList(),
    );
  }
}

class _RichTextParser extends StatelessWidget {
  final String text;
  final Color color;

  const _RichTextParser({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    final List<InlineSpan> spans = [];
    final regex = RegExp(r'\*\*(.*?)\*\*');
    int lastEnd = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd)));
    }

    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        children: spans.isEmpty ? [TextSpan(text: text)] : spans,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _SectionTitle({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}

/// Badge widget showing sentence type (+, -, ?)
class _SentenceTypeBadge extends StatelessWidget {
  final SentenceType sentenceType;
  final Color baseColor;

  const _SentenceTypeBadge({
    required this.sentenceType,
    required this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Color mapping for sentence types
    final Map<SentenceType, Color> typeColors = {
      SentenceType.positive: const Color(0xFF4CAF50),    // Green
      SentenceType.negative: const Color(0xFFF44336),    // Red
      SentenceType.interrogative: const Color(0xFF2196F3), // Blue
    };

    final typeColor = typeColors[sentenceType] ?? baseColor;
    final backgroundColor = isDark
        ? typeColor.withValues(alpha: 0.2)
        : typeColor.withValues(alpha: 0.1);
    final textColor = isDark
        ? typeColor.withValues(alpha: 0.9)
        : typeColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: typeColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Symbol badge
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                sentenceType.symbol,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            sentenceType.label,
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  final GrammarExample example;
  final Color color;

  const _ExampleCard({
    required this.example,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : color.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : color.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sentence type badge + English label
          Row(
            children: [
              _SentenceTypeBadge(
                sentenceType: example.sentenceType,
                baseColor: color,
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '🇬🇧 English',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white70 : Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            example.english,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          // Indonesian translation
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '🇮🇩 Indonesia',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white60 : Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            example.indonesian,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          if (example.explanation != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 14,
                  color: color.withValues(alpha: 0.8),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    example.explanation!,
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontStyle: FontStyle.italic,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final String tip;
  final Color color;

  const _TipCard({
    required this.tip,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.accentColor.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppTheme.accentColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb, color: Color(0xFFFF9800), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}