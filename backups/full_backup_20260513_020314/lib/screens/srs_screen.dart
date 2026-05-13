import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../models/srs_card.dart';
import '../providers/srs_provider.dart';
import '../theme/app_theme.dart';
import 'srs_stats_screen.dart';

class SrsScreen extends StatefulWidget {
  const SrsScreen({super.key});

  @override
  State<SrsScreen> createState() => _SrsScreenState();
}

class _SrsScreenState extends State<SrsScreen> with SingleTickerProviderStateMixin {
  bool _isReviewing = false;
  SrsCard? _currentCard;
  bool _isFlipped = false;
  int _reviewedCount = 0;
  int _correctCount = 0;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isReviewing ? _buildReviewMode() : _buildOverviewMode(),
    );
  }

  Widget _buildOverviewMode() {
    return Consumer<SrsProvider>(
      builder: (context, srsProvider, child) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              backgroundColor: const Color(0xFF9C27B0),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF9C27B0), Color(0xFF7B1FA2)],
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
                          const Row(
                            children: [
                              Text('\u{1F4DA}', style: TextStyle(fontSize: 40)),
                              SizedBox(width: 12),
                              Text(
                                'Spaced Repetition',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Review kartu untuk mengingat lebih lama',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Stats Cards
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            icon: Icons.pending_actions,
                            label: 'Due',
                            value: '${srsProvider.dueCount}',
                            color: AppTheme.accentColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            icon: Icons.fiber_new,
                            label: 'Baru',
                            value: '${srsProvider.newCount}',
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            icon: Icons.check_circle,
                            label: 'Review',
                            value: '${srsProvider.reviewCount}',
                            color: AppTheme.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Progress info with retention
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF9C27B0).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.analytics, color: Color(0xFF9C27B0)),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${srsProvider.totalCards} Total Kartu',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      srsProvider.dueCount > 0
                                          ? '${srsProvider.dueCount} kartu siap diulas'
                                          : 'Semua kartu sudah diulas!',
                                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (srsProvider.totalReviewsAllTime > 0) ...[
                            const SizedBox(height: 16),
                            const Divider(),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _MiniStat(
                                  label: 'Total Reviews',
                                  value: '${srsProvider.totalReviewsAllTime}',
                                ),
                                _MiniStat(
                                  label: 'Retention',
                                  value: '${srsProvider.averageRetention.toStringAsFixed(0)}%',
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Start Review Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: srsProvider.dueCount > 0 || srsProvider.newCount > 0
                            ? _startReview
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9C27B0),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.play_arrow),
                            const SizedBox(width: 8),
                            Text(
                              srsProvider.dueCount > 0
                                  ? 'Mulai Review (${srsProvider.dueCount + srsProvider.newCount})'
                                  : 'Tidak Ada Kartu untuk Direview',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // View Statistics Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SrsStatsScreen()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF9C27B0),
                          side: const BorderSide(color: Color(0xFF9C27B0)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bar_chart),
                            SizedBox(width: 8),
                            Text('Lihat Statistik'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // How it works
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                          const Text('Cara Kerja', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          _HowItWorksRow(icon: Icons.flip, title: 'Balik Kartu', desc: 'Ketuk untuk lihat jawaban'),
                          const SizedBox(height: 8),
                          _HowItWorksRow(icon: Icons.star_border, title: 'Again', desc: 'Ulangi segera (< 1 hari)'),
                          const SizedBox(height: 8),
                          _HowItWorksRow(icon: Icons.sentiment_dissatisfied, title: 'Hard', desc: 'Sulit, interval sedikit diperpanjang'),
                          const SizedBox(height: 8),
                          _HowItWorksRow(icon: Icons.sentiment_satisfied, title: 'Good', desc: 'Baik, interval normal'),
                          const SizedBox(height: 8),
                          _HowItWorksRow(icon: Icons.sentiment_very_satisfied, title: 'Easy', desc: 'Mudah, interval lebih panjang'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _startReview() {
    final srsProvider = context.read<SrsProvider>();
    final card = srsProvider.getRandomDueCard();
    if (card == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada kartu untuk direview')),
      );
      return;
    }
    setState(() {
      _isReviewing = true;
      _currentCard = card;
      _isFlipped = false;
      _reviewedCount = 0;
      _correctCount = 0;
      _flipController.reset();
    });
  }

  Widget _buildReviewMode() {
    final srsProvider = context.read<SrsProvider>();
    final totalToReview = srsProvider.dueCount + srsProvider.newCount - _reviewedCount;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: const Color(0xFF9C27B0),
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              setState(() {
                _isReviewing = false;
              });
            },
          ),
          title: Text(
            '$_reviewedCount / $totalToReview',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text('$_correctCount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                if (_currentCard != null) ...[
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: totalToReview > 0 ? _reviewedCount / totalToReview : 0,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF9C27B0)),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Flip Card
                  GestureDetector(
                    onTap: _flipCard,
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! < -100 && _isFlipped) {
                        _rateCard(SrsRating.good);
                      } else if (details.primaryVelocity! > 100 && _isFlipped) {
                        _rateCard(SrsRating.again);
                      }
                    },
                    child: AnimatedBuilder(
                      animation: _flipAnimation,
                      builder: (context, child) {
                        final angle = _flipAnimation.value * 3.14159;
                        final isFront = _flipAnimation.value < 0.5;
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(angle),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              gradient: isFront
                                  ? null
                                  : const LinearGradient(
                                      colors: [Color(0xFF9C27B0), Color(0xFF7B1FA2)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                              color: isFront ? Colors.white : null,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: isFront
                                ? _buildCardFront()
                                : Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()..rotateY(3.14159),
                                    child: _buildCardBack(),
                                  ),
                          ),
                        );
                      },
                    ),
                  ).animate().fadeIn().scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
                  const SizedBox(height: 32),
                  // Rating buttons
                  if (_isFlipped) ...[
                    const Text('Seberapa mudah kartu ini?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _RatingButton(label: 'Again', subLabel: '< 1 hari', color: AppTheme.errorColor, onPressed: () => _rateCard(SrsRating.again))),
                        const SizedBox(width: 8),
                        Expanded(child: _RatingButton(label: 'Hard', subLabel: 'Sedikit', color: AppTheme.accentColor, onPressed: () => _rateCard(SrsRating.hard))),
                        const SizedBox(width: 8),
                        Expanded(child: _RatingButton(label: 'Good', subLabel: 'Normal', color: AppTheme.secondaryColor, onPressed: () => _rateCard(SrsRating.good))),
                        const SizedBox(width: 8),
                        Expanded(child: _RatingButton(label: 'Easy', subLabel: 'Panjang', color: AppTheme.primaryColor, onPressed: () => _rateCard(SrsRating.easy))),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Swipe hint
                    Text(
                      'Geser kanan = Good, Geser kiri = Again',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: _flipCard,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9C27B0),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('Lihat Jawaban'),
                    ).animate().fadeIn(delay: const Duration(milliseconds: 300)),
                  ],
                ],
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardFront() {
    return Column(
      children: [
        Icon(Icons.touch_app, color: Colors.grey[400], size: 24),
        const SizedBox(height: 16),
        Text(
          _currentCard!.front,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text('Ketuk untuk lihat jawaban', style: TextStyle(fontSize: 13, color: Colors.grey[400])),
      ],
    );
  }

  Widget _buildCardBack() {
    return Column(
      children: [
        Icon(Icons.lightbulb, color: Colors.white.withValues(alpha: 0.5), size: 24),
        const SizedBox(height: 16),
        Text(
          _currentCard!.back,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        if (_currentCard!.example != null) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _currentCard!.example!,
              style: TextStyle(fontSize: 14, color: Colors.white.withValues(alpha: 0.9), fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }

  void _rateCard(SrsRating rating) async {
    if (_currentCard == null) return;

    final srsProvider = context.read<SrsProvider>();
    await srsProvider.reviewCard(_currentCard!.id, rating);

    setState(() {
      _reviewedCount++;
      if (rating != SrsRating.again) {
        _correctCount++;
      }
      _isFlipped = false;
      _flipController.reset();
      final nextCard = srsProvider.getRandomDueCard();
      if (nextCard != null) {
        _currentCard = nextCard;
      } else {
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(children: [Icon(Icons.celebration, color: AppTheme.accentColor), SizedBox(width: 8), Text('Review Selesai!')]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$_reviewedCount kartu telah diulas'),
            const SizedBox(height: 8),
            Text('$_correctCount jawaban benar', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.secondaryColor)),
            const SizedBox(height: 4),
            Text('${((_correctCount / _reviewedCount) * 100).toStringAsFixed(0)}% akurasi', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _isReviewing = false;
              });
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;

  const _MiniStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9C27B0))),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}

class _HowItWorksRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _HowItWorksRow({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF9C27B0)),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13))),
        Expanded(flex: 2, child: Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey[600]))),
      ],
    );
  }
}

class _RatingButton extends StatelessWidget {
  final String label;
  final String subLabel;
  final Color color;
  final VoidCallback onPressed;

  const _RatingButton({required this.label, required this.subLabel, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
          Text(subLabel, style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.8))),
        ],
      ),
    );
  }
}
