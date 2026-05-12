import 'package:flutter/material.dart';
import '../data/sentence_transform_data.dart';
import '../theme/app_theme.dart';

class SentenceTransformScreen extends StatefulWidget {
  const SentenceTransformScreen({super.key});

  @override
  State<SentenceTransformScreen> createState() => _SentenceTransformScreenState();
}

class _SentenceTransformScreenState extends State<SentenceTransformScreen> {
  late List<SentenceTransformItem> _questions;
  int _currentIndex = 0;
  int _correctCount = 0;
  bool _showHint = false;
  bool _showAnswer = false;
  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _questions = List.from(SentenceTransformData.items)..shuffle();
    _questions = _questions.take(10).toList();
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No questions available')),
      );
    }

    final current = _questions[_currentIndex];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(0xFF00796B),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF00796B),
                      const Color(0xFF004D40),
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
                              '\u{1F524}',
                              style: TextStyle(fontSize: 40),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Sentence\nTransformation',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Ubah kalimat sesuai instruksi',
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
                  // Progress
                  Row(
                    children: List.generate(_questions.length, (index) {
                      return Expanded(
                        child: Container(
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: index < _currentIndex
                                ? (_isCorrectAt(index)
                                    ? AppTheme.secondaryColor
                                    : AppTheme.errorColor)
                                : index == _currentIndex
                                    ? const Color(0xFF00796B)
                                    : Colors.grey[300],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Soal ${_currentIndex + 1} dari ${_questions.length} | Benar: $_correctCount',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(height: 24),
                  // Instruction
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00796B).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      current.instruction,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF00796B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Original sentence
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
                        Text(
                          'Kalimat asli:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          current.original,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Answer field
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _showAnswer
                            ? (_isAnswerCorrect()
                                ? AppTheme.secondaryColor
                                : AppTheme.errorColor)
                            : Colors.grey[300]!,
                        width: _showAnswer ? 2 : 1,
                      ),
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
                        TextField(
                          controller: _answerController,
                          enabled: !_showAnswer,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: 'Tulis jawabanmu di sini...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Hint button
                  if (!_showAnswer && !_showHint)
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _showHint = true;
                        });
                      },
                      icon: const Icon(Icons.lightbulb_outline, size: 18),
                      label: const Text('Tampilkan Petunjuk'),
                    ),
                  if (_showHint && !_showAnswer) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.accentColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lightbulb, color: AppTheme.accentColor, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              current.hint,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  if (!_showAnswer) ...[
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _showAnswer = true;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text('Lihat Jawaban'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _showAnswer = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00796B),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text('Cek Jawaban'),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (_showAnswer) ...[
                    // Result
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _isAnswerCorrect()
                            ? AppTheme.secondaryColor.withValues(alpha: 0.1)
                            : AppTheme.errorColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                _isAnswerCorrect() ? Icons.check_circle : Icons.cancel,
                                color: _isAnswerCorrect()
                                    ? AppTheme.secondaryColor
                                    : AppTheme.errorColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _isAnswerCorrect() ? 'Benar!' : 'Kurang Tepat',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _isAnswerCorrect()
                                      ? AppTheme.secondaryColor
                                      : AppTheme.errorColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Jawaban: ${current.answer}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.info, color: Colors.grey[600], size: 18),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    current.explanation,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00796B),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          _currentIndex < _questions.length - 1
                              ? 'Soal Berikutnya'
                              : 'Selesai',
                        ),
                      ),
                    ),
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

  bool _isCorrectAt(int index) {
    return false;
  }

  bool _isAnswerCorrect() {
    final userAnswer = _answerController.text.trim().toLowerCase();
    final correctAnswer = _questions[_currentIndex].answer.toLowerCase();
    return userAnswer == correctAnswer;
  }

  void _nextQuestion() {
    if (_showAnswer && _isAnswerCorrect()) {
      _correctCount++;
    }
    setState(() {
      _showAnswer = false;
      _showHint = false;
      _answerController.clear();
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
      } else {
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    final score = _correctCount;
    final total = _questions.length;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.emoji_events, color: AppTheme.accentColor),
            SizedBox(width: 8),
            Text('Selesai!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$score dari $total benar'),
            const SizedBox(height: 8),
            Text(
              '${((score / total) * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00796B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              score == total
                  ? 'Sempurna! Kamu sangat piawai!'
                  : score >= total * 0.7
                      ? 'Bagus! Terus berlatih!'
                      : 'Tetap semangat, terus belajar!',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetQuiz();
            },
            child: const Text('Coba Lagi'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _questions = List.from(SentenceTransformData.items)..shuffle();
      _questions = _questions.take(10).toList();
      _currentIndex = 0;
      _correctCount = 0;
      _showHint = false;
      _showAnswer = false;
      _answerController.clear();
    });
  }
}
