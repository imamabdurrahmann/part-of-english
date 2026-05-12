import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/srs_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/animations.dart';

class SrsStatsScreen extends StatelessWidget {
  const SrsStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SrsProvider>(
        builder: (context, srsProvider, child) {
          final forecast = srsProvider.getReviewForecast();

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 120,
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
                    child: const SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('SRS Statistics', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Overview Cards
                      FadeSlideIn(
                        child: Row(
                          children: [
                            Expanded(
                              child: _OverviewCard(
                                icon: Icons.calendar_today,
                                label: 'Total Cards',
                                value: '${srsProvider.totalCards}',
                                color: AppTheme.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _OverviewCard(
                                icon: Icons.repeat,
                                label: 'Total Reviews',
                                value: '${srsProvider.totalReviewsAllTime}',
                                color: AppTheme.accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 100),
                        child: Row(
                          children: [
                            Expanded(
                              child: _OverviewCard(
                                icon: Icons.trending_up,
                                label: 'Retention Rate',
                                value: '${srsProvider.averageRetention.toStringAsFixed(1)}%',
                                color: AppTheme.secondaryColor,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _OverviewCard(
                                icon: Icons.schedule,
                                label: 'Due Today',
                                value: '${srsProvider.dueCount}',
                                color: const Color(0xFFE91E63),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Review Forecast
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 200),
                        child: _ForecastSection(forecast: forecast),
                      ),
                      const SizedBox(height: 24),
                      // Card Status Breakdown
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 300),
                        child: _CardStatusSection(srsProvider: srsProvider),
                      ),
                      const SizedBox(height: 24),
                      // Tips Section
                      FadeSlideIn(
                        delay: const Duration(milliseconds: 400),
                        child: _TipsSection(),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _OverviewCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class _ForecastSection extends StatelessWidget {
  final Map<int, int> forecast;

  const _ForecastSection({required this.forecast});

  @override
  Widget build(BuildContext context) {
    final maxValue = forecast.values.fold<int>(1, (max, v) => v > max ? v : max);

    return Container(
      padding: const EdgeInsets.all(20),
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
          Row(
            children: [
              const Icon(Icons.calendar_month, color: Color(0xFF9C27B0), size: 20),
              const SizedBox(width: 8),
              const Text('Review Forecast', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              final value = forecast[index] ?? 0;
              final height = maxValue > 0 ? (value / maxValue * 80) + 20 : 20.0;
              final isToday = index == 0;

              return Column(
                children: [
                  Container(
                    width: 32,
                    height: height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          isToday ? const Color(0xFF9C27B0) : const Color(0xFF9C27B0).withValues(alpha: 0.3),
                          isToday ? const Color(0xFF7B1FA2) : const Color(0xFF9C27B0).withValues(alpha: 0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '$value',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isToday ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getDayLabel(index),
                    style: TextStyle(
                      fontSize: 11,
                      color: isToday ? const Color(0xFF9C27B0) : Colors.grey[600],
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  String _getDayLabel(int index) {
    if (index == 0) return 'Hari ini';
    if (index == 1) return 'Besok';
    return '${index}d';
  }
}

class _CardStatusSection extends StatelessWidget {
  final SrsProvider srsProvider;

  const _CardStatusSection({required this.srsProvider});

  @override
  Widget build(BuildContext context) {
    final newCards = srsProvider.newCount;
    final learningCards = srsProvider.cards.where((c) => !c.isNew && c.interval < 7).length;
    final reviewCards = srsProvider.cards.where((c) => c.interval >= 7).length;
    final total = srsProvider.totalCards;

    return Container(
      padding: const EdgeInsets.all(20),
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
          Row(
            children: [
              const Icon(Icons.pie_chart, color: Color(0xFF9C27B0), size: 20),
              const SizedBox(width: 8),
              const Text('Card Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          if (total > 0) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: 1,
                backgroundColor: Colors.grey[100],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.transparent),
                minHeight: 12,
              ),
            ),
            const SizedBox(height: 16),
            _StatusRow(
              label: 'New Cards',
              count: newCards,
              total: total,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 8),
            _StatusRow(
              label: 'Learning',
              count: learningCards,
              total: total,
              color: AppTheme.accentColor,
            ),
            const SizedBox(height: 8),
            _StatusRow(
              label: 'Mature',
              count: reviewCards,
              total: total,
              color: AppTheme.secondaryColor,
            ),
          ] else ...[
            Center(
              child: Column(
                children: [
                  Icon(Icons.inbox, size: 48, color: Colors.grey[300]),
                  const SizedBox(height: 8),
                  Text('No cards yet', style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 4),
                  Text('Add vocabulary to start learning', style: TextStyle(fontSize: 12, color: Colors.grey[400])),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  final String label;
  final int count;
  final int total;
  final Color color;

  const _StatusRow({
    required this.label,
    required this.count,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = total > 0 ? (count / total * 100).toStringAsFixed(0) : '0';

    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label, style: const TextStyle(fontSize: 14)),
        ),
        Text(
          '$count ($percentage%)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _TipsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF9C27B0).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF9C27B0).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.lightbulb, color: Color(0xFF9C27B0), size: 20),
              SizedBox(width: 8),
              Text('Tips for Better Retention', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9C27B0))),
            ],
          ),
          const SizedBox(height: 12),
          _TipRow(icon: Icons.schedule, text: 'Review daily to maintain streak'),
          const SizedBox(height: 8),
          _TipRow(icon: Icons.psychology, text: 'Use "Good" rating for normal difficulty cards'),
          const SizedBox(height: 8),
          _TipRow(icon: Icons.speed, text: 'Use "Easy" only for very familiar cards'),
          const SizedBox(height: 8),
          _TipRow(icon: Icons.repeat, text: 'Consistent practice beats cramming'),
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TipRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF9C27B0)),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[700]))),
      ],
    );
  }
}
