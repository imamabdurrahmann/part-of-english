import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Achievement unlock dialog with confetti animation
class AchievementDialog extends StatelessWidget {
  final String title;
  final String description;
  final String? iconPath;
  final VoidCallback? onDismiss;

  const AchievementDialog({
    super.key,
    required this.title,
    required this.description,
    this.iconPath,
    this.onDismiss,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String description,
    String? iconPath,
    Duration duration = const Duration(seconds: 3),
  }) async {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => AchievementDialog(
        title: title,
        description: description,
        iconPath: iconPath,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);

    await Future.delayed(duration);
    if (entry.mounted) {
      entry.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withValues(alpha: 0.5),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.emoji_events,
                  size: 60,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .scale(
                    begin: const Offset(0, 0),
                    end: const Offset(1, 1),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticOut,
                  )
                  .shimmer(
                    duration: const Duration(milliseconds: 1500),
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
              const SizedBox(height: 24),
              Text(
                'Achievement Unlocked!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: const Color(0xFFFFD700),
                      fontWeight: FontWeight.bold,
                    ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 300)),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onDismiss,
                child: const Text('Awesome!'),
              ).animate().fadeIn(delay: const Duration(milliseconds: 600)).slideY(
                    begin: 0.5,
                    end: 0,
                    delay: const Duration(milliseconds: 600),
                  ),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(duration: const Duration(milliseconds: 300))
          .scale(
            begin: const Offset(0.8, 0.8),
            end: const Offset(1, 1),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
          ),
    );
  }
}

/// Level up celebration dialog
class LevelUpDialog extends StatelessWidget {
  final int newLevel;
  final VoidCallback? onDismiss;

  const LevelUpDialog({
    super.key,
    required this.newLevel,
    this.onDismiss,
  });

  static Future<void> show(BuildContext context, int newLevel) async {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => LevelUpDialog(
        newLevel: newLevel,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);

    await Future.delayed(const Duration(seconds: 4));
    if (entry.mounted) {
      entry.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF8B7FFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withValues(alpha: 0.5),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '🎉',
                style: TextStyle(fontSize: 60),
              ).animate().scale(
                    begin: const Offset(0, 0),
                    end: const Offset(1, 1),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticOut,
                  ),
              const SizedBox(height: 16),
              const Text(
                'LEVEL UP!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 4,
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 300)),
              const SizedBox(height: 24),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Level $newLevel',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
                  .animate()
                  .scale(
                    begin: const Offset(0.5, 0.5),
                    end: const Offset(1, 1),
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                  )
                  .shimmer(
                    duration: const Duration(seconds: 2),
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6C63FF),
                ),
                onPressed: onDismiss,
                child: const Text('Continue'),
              ).animate().fadeIn(delay: const Duration(milliseconds: 800)),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(duration: const Duration(milliseconds: 300))
          .scale(
            begin: const Offset(0.7, 0.7),
            end: const Offset(1, 1),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutBack,
          ),
    );
  }
}

/// Streak milestone celebration
class StreakMilestoneDialog extends StatelessWidget {
  final int streakDays;
  final VoidCallback? onDismiss;

  const StreakMilestoneDialog({
    super.key,
    required this.streakDays,
    this.onDismiss,
  });

  static Future<void> show(BuildContext context, int streakDays) async {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => StreakMilestoneDialog(
        streakDays: streakDays,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);

    await Future.delayed(const Duration(seconds: 3));
    if (entry.mounted) {
      entry.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF9800), Color(0xFFFFB74D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withValues(alpha: 0.5),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '🔥',
                style: TextStyle(fontSize: 80),
              )
                  .animate(onPlay: (c) => c.repeat())
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.2, 1.2),
                    duration: const Duration(milliseconds: 500),
                  )
                  .then()
                  .scale(
                    begin: const Offset(1.2, 1.2),
                    end: const Offset(1, 1),
                    duration: const Duration(milliseconds: 500),
                  ),
              const SizedBox(height: 16),
              Text(
                '$streakDays Day Streak!',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 300)),
              const SizedBox(height: 8),
              const Text(
                'Keep the fire burning!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFFFF9800),
                ),
                onPressed: onDismiss,
                child: const Text('Keep Going!'),
              ).animate().fadeIn(delay: const Duration(milliseconds: 700)),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(duration: const Duration(milliseconds: 300))
          .slideY(
            begin: -0.5,
            end: 0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
          ),
    );
  }
}

/// Quiz result celebration
class QuizResultDialog extends StatelessWidget {
  final int score;
  final int total;
  final int xpEarned;
  final VoidCallback? onContinue;
  final VoidCallback? onRetry;

  const QuizResultDialog({
    super.key,
    required this.score,
    required this.total,
    required this.xpEarned,
    this.onContinue,
    this.onRetry,
  });

  static Future<void> show(
    BuildContext context, {
    required int score,
    required int total,
    required int xpEarned,
  }) async {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => QuizResultDialog(
        score: score,
        total: total,
        xpEarned: xpEarned,
        onContinue: () => entry.remove(),
        onRetry: () => entry.remove(),
      ),
    );

    overlay.insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (score / total * 100).round();
    final isPerfect = score == total;
    final isGood = percentage >= 80;

    return Material(
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isPerfect
                    ? Icons.stars
                    : isGood
                        ? Icons.emoji_events
                        : Icons.trending_up,
                size: 80,
                color: isPerfect
                    ? const Color(0xFFFFD700)
                    : isGood
                        ? const Color(0xFF00C853)
                        : const Color(0xFFFF9800),
              )
                  .animate()
                  .scale(
                    begin: const Offset(0, 0),
                    end: const Offset(1, 1),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticOut,
                  ),
              const SizedBox(height: 16),
              Text(
                isPerfect
                    ? 'Perfect!'
                    : isGood
                        ? 'Great Job!'
                        : 'Keep Practicing!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isPerfect
                          ? const Color(0xFFFFD700)
                          : isGood
                              ? const Color(0xFF00C853)
                              : const Color(0xFFFF9800),
                    ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 300)),
              const SizedBox(height: 24),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      '$score / $total',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$percentage% Correct',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 400))
                  .slideY(begin: 0.3, end: 0),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '+$xpEarned XP',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isPerfect && onRetry != null) ...[
                    OutlinedButton(
                      onPressed: onRetry,
                      child: const Text('Retry'),
                    ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                    const SizedBox(width: 16),
                  ],
                  ElevatedButton(
                    onPressed: onContinue,
                    child: const Text('Continue'),
                  ).animate().fadeIn(delay: const Duration(milliseconds: 700)),
                ],
              ),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(duration: const Duration(milliseconds: 300))
          .scale(
            begin: const Offset(0.9, 0.9),
            end: const Offset(1, 1),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
          ),
    );
  }
}