import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/daily_challenge_data.dart';
import '../models/daily_challenge.dart';
import '../providers/daily_challenge_provider.dart';
import '../providers/progress_provider.dart';
import '../theme/app_theme.dart';

class DailyChallengeScreen extends StatefulWidget {
  const DailyChallengeScreen({super.key});

  @override
  State<DailyChallengeScreen> createState() => _DailyChallengeScreenState();
}

class _DailyChallengeScreenState extends State<DailyChallengeScreen> {
  late DailyChallenge _challenge;
  int _currentQuestion = 0;
  int _correctAnswers = 0;
  bool _isCompleted = false;
  bool _showingResult = false;
  int? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _challenge = DailyChallengeData.getChallengeForDate(DateTime.now());
    final provider = context.read<DailyChallengeProvider>();
    if (provider.isCompletedToday) {
      _isCompleted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFFFF5722),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFF5722),
                      const Color(0xFFE64A19),
                    ],
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
                            Text(
                              '\u{1F3C6}',
                              style: TextStyle(fontSize: 40),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Daily Challenge',
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
                          _isCompleted
                              ? 'Challenge hari ini sudah selesai!'
                              : '${_challenge.questions.length} pertanyaan | +${_challenge.xpReward} XP',
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
                  if (_isCompleted) ...[
                    _buildCompletedState(),
                  ] else if (_showingResult) ...[
                    _buildResultView(),
                  ] else ...[
                    _buildQuestionView(),
                  ],
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedState() {
    final provider = context.watch<DailyChallengeProvider>();
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          const Icon(
            Icons.check_circle,
            color: AppTheme.secondaryColor,
            size: 80,
          ),
          const SizedBox(height: 16),
          const Text(
            'Challenge Selesai!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Kamu sudah menyelesaikan challenge hari ini.',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.secondaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CompletedStat(
                  label: 'Total XP',
                  value: '${provider.totalXpEarned}',
                  icon: Icons.star,
                ),
                _CompletedStat(
                  label: 'Selesai',
                  value: '${provider.completedChallenges}',
                  icon: Icons.check,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Kembali lagi besok untuk challenge baru!',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionView() {
    final q = _challenge.questions[_currentQuestion];
    return Column(
      children: [
        // Progress indicator
        Row(
          children: List.generate(_challenge.questions.length, (index) {
            return Expanded(
              child: Container(
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: index <= _currentQuestion
                      ? const Color(0xFFFF5722)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          'Pertanyaan ${_currentQuestion + 1} dari ${_challenge.questions.length}',
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
        const SizedBox(height: 24),
        // Question card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5722).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _challenge.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF5722),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                q.question,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Options
        ...List.generate(q.options.length, (index) {
          final isSelected = _selectedAnswer == index;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: _selectedAnswer == null
                  ? () {
                      setState(() {
                        _selectedAnswer = index;
                      });
                    }
                  : null,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFFF5722).withValues(alpha: 0.1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFFF5722)
                        : Colors.grey[300]!,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? const Color(0xFFFF5722)
                            : Colors.grey[100],
                      ),
                      child: Center(
                        child: Text(
                          String.fromCharCode(65 + index),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        q.options[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected
                              ? const Color(0xFFFF5722)
                              : AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
        // Submit button
        if (_selectedAnswer != null)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5722),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Jawab'),
            ),
          ),
      ],
    );
  }

  void _submitAnswer() {
    final q = _challenge.questions[_currentQuestion];
    final isCorrect = _selectedAnswer == q.correctIndex;
    if (isCorrect) {
      _correctAnswers++;
    }
    setState(() {
      _showingResult = true;
    });
  }

  Widget _buildResultView() {
    final q = _challenge.questions[_currentQuestion];
    final isCorrect = _selectedAnswer == q.correctIndex;
    return Column(
      children: [
        // Feedback
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isCorrect
                ? AppTheme.secondaryColor.withValues(alpha: 0.1)
                : AppTheme.errorColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                size: 48,
              ),
              const SizedBox(height: 8),
              Text(
                isCorrect ? 'Benar!' : 'Kurang Tepat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Pertanyaan: ${q.question}',
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Explanation
        Container(
          width: double.infinity,
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
              Row(
                children: [
                  Icon(Icons.lightbulb, color: AppTheme.accentColor, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Penjelasan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                q.explanation,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Correct answer
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: AppTheme.secondaryColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Jawaban benar: ${q.options[q.correctIndex]}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Next button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _nextQuestion,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF5722),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              _currentQuestion < _challenge.questions.length - 1
                  ? 'Pertanyaan Berikutnya'
                  : 'Lihat Hasil',
            ),
          ),
        ),
      ],
    );
  }

  void _nextQuestion() {
    setState(() {
      _showingResult = false;
      _selectedAnswer = null;
      if (_currentQuestion < _challenge.questions.length - 1) {
        _currentQuestion++;
      } else {
        _finishChallenge();
      }
    });
  }

  void _finishChallenge() {
    final score = _correctAnswers;
    final total = _challenge.questions.length;
    final xpEarned = (score / total * _challenge.xpReward).round();

    context.read<DailyChallengeProvider>().completeChallenge(xpEarned);
    context.read<ProgressProvider>().addXp(xpEarned);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.emoji_events, color: AppTheme.accentColor),
            SizedBox(width: 8),
            Text('Challenge Selesai!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$score dari $total benar'),
            const SizedBox(height: 8),
            Text(
              '+$xpEarned XP',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.accentColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${((score / total) * 100).toStringAsFixed(0)}% akurasi',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _isCompleted = true;
              });
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

class _CompletedStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _CompletedStat({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.secondaryColor),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
