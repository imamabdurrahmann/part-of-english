import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/grammar_models.dart';
import '../providers/progress_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/animations.dart';
import '../widgets/celebrations.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;
  final String categoryId;
  final String topicId;
  final Color color;

  const QuizScreen({
    super.key,
    required this.quiz,
    required this.categoryId,
    required this.topicId,
    required this.color,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  bool _hasAnswered = false;
  bool _isCorrect = false;
  int _correctCount = 0;
  List<String?> _userAnswers = [];
  List<String> _orderedWords = [];
  bool _showResults = false;
  bool _shouldShake = false;
  bool _shouldBounce = false;

  // Timer support
  Timer? _timer;
  int _remainingSeconds = 0;
  int? _hintUsed;

  // Matching support
  List<int?> _matchingPairs = [];
  int? _selectedLeftIndex;
  int? _selectedRightIndex;

  @override
  void initState() {
    super.initState();
    _userAnswers = List.filled(widget.quiz.questions.length, null);
    if (widget.quiz.timeLimitSeconds != null) {
      _remainingSeconds = widget.quiz.timeLimitSeconds!;
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0 && !_hasAnswered) {
        setState(() {
          _remainingSeconds--;
        });
      } else if (_remainingSeconds == 0 && !_hasAnswered) {
        // Auto-submit when timer runs out
        _autoSubmit();
      }
    });
  }

  void _autoSubmit() {
    if (!_hasAnswered) {
      setState(() {
        _hasAnswered = true;
        _isCorrect = false;
      });
    }
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (_showResults) {
      return _buildResultsScreen();
    }

    final question = widget.quiz.questions[_currentQuestionIndex];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with animations
            FadeSlideIn(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    TapScale(
                      onTap: () => _showExitDialog(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.close, color: AppTheme.textPrimary),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CountUpText(
                                value: _currentQuestionIndex + 1,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                ' / ${widget.quiz.questions.length}',
                                style: TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 16,
                                ),
                              ),
                              if (widget.quiz.timeLimitSeconds != null) ...[
                                const SizedBox(width: 12),
                                _buildTimerBadge(),
                              ],
                            ],
                          ),
                          const SizedBox(height: 8),
                          AnimatedProgressBar(
                            progress: (_currentQuestionIndex + 1) / widget.quiz.questions.length,
                            gradientColors: [widget.color, widget.color.withValues(alpha: 0.7)],
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                    GlowBox(
                      glowColor: const Color(0xFFFFD700),
                      blurRadius: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: widget.color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: widget.color, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.quiz.xpReward} XP',
                              style: TextStyle(
                                color: widget.color,
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
              ),
            ),
            // Question
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Type Badge
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 100),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: _getQuestionTypeColor(question.type).withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _getQuestionTypeName(question.type),
                              style: TextStyle(
                                color: _getQuestionTypeColor(question.type),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          if (question.hint != null && _hintUsed == null) ...[
                            const SizedBox(width: 8),
                            _buildHintButton(question.hint!),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Question Text
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 200),
                      child: _buildQuestionText(question),
                    ),
                    const SizedBox(height: 24),
                    // Answer Options with animation
                    _buildAnswerOptions(question),
                  ],
                ),
              ),
            ),
            // Bottom
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                child: _hasAnswered
                    ? _buildFeedbackSection(question)
                    : _buildSubmitButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerBadge() {
    final isLowTime = _remainingSeconds < 30;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isLowTime ? AppTheme.errorColor.withValues(alpha: 0.1) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer,
            size: 14,
            color: isLowTime ? AppTheme.errorColor : AppTheme.textSecondary,
          ),
          const SizedBox(width: 4),
          Text(
            _formatTime(_remainingSeconds),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isLowTime ? AppTheme.errorColor : AppTheme.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ).animate(
      target: isLowTime ? 1 : 0,
      effects: isLowTime ? [ScaleEffect(begin: const Offset(1, 1), end: const Offset(1.1, 1.1)), ScaleEffect(begin: const Offset(1.1, 1.1), end: const Offset(1, 1))] : [],
    );
  }

  Widget _buildHintButton(String hint) {
    return TapScale(
      onTap: () => _showHintDialog(hint),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppTheme.accentColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lightbulb_outline, size: 14, color: AppTheme.accentColor),
            const SizedBox(width: 4),
            Text(
              'Hint',
              style: TextStyle(
                color: AppTheme.accentColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHintDialog(String hint) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.lightbulb, color: AppTheme.accentColor),
            const SizedBox(width: 8),
            const Text('Hint'),
          ],
        ),
        content: Text(hint),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
    setState(() {
      _hintUsed = _currentQuestionIndex;
    });
  }

  Widget _buildQuestionText(QuizQuestion question) {
    return Text(
      question.question,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
    );
  }

  Widget _buildAnswerOptions(QuizQuestion question) {
    switch (question.type) {
      case QuestionType.multipleChoice:
      case QuestionType.trueFalse:
        return _buildMultipleChoice(question);
      case QuestionType.fillInBlank:
        return _buildFillInBlank(question);
      case QuestionType.sentenceOrder:
        return _buildSentenceOrder(question);
      case QuestionType.dragDrop:
        return _buildDragDropOrder(question);
      case QuestionType.matching:
        return _buildMatching(question);
    }
  }

  Widget _buildDragDropOrder(QuizQuestion question) {
    // For drag-drop, start with empty ordered area (user drags words there)
    if (_orderedWords.isEmpty && _hasAnswered) {
      _orderedWords = List.from(question.orderedWords ?? []);
    } else if (_orderedWords.isEmpty && !_hasAnswered) {
      // Initialize but will show in available section
      _orderedWords = [];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tap words to add them in correct order:',
          style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 16),
        // Ordered words area
        if (_orderedWords.isNotEmpty)
          DragTarget<String>(
            onAcceptWithDetails: (details) {
              setState(() {
                _orderedWords.remove(details.data);
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: candidateData.isNotEmpty
                      ? widget.color.withValues(alpha: 0.1)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: candidateData.isNotEmpty ? widget.color : Colors.grey.shade300,
                    width: candidateData.isNotEmpty ? 2 : 1,
                  ),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _orderedWords.asMap().entries.map((entry) {
                    return Draggable<String>(
                      data: entry.value,
                      feedback: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            entry.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(entry.value, style: const TextStyle(color: Colors.grey)),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        if (_orderedWords.isEmpty && !_hasAnswered)
          DragTarget<String>(
            onAcceptWithDetails: (_) {},
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: candidateData.isNotEmpty ? widget.color : Colors.grey.shade300,
                    width: candidateData.isNotEmpty ? 2 : 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Drag words here',
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                ),
              );
            },
          ),
        const SizedBox(height: 20),
        const Text(
          'Available words (drag to arrange):',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        if (!_hasAnswered && (question.orderedWords ?? []).isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (question.orderedWords ?? []).where((word) => !_orderedWords.contains(word)).map((word) {
              return Draggable<String>(
                data: word,
                feedback: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: widget.color, width: 2),
                    ),
                    child: Text(word, style: TextStyle(color: widget.color, fontWeight: FontWeight.w500)),
                  ),
                ),
                childWhenDragging: Opacity(
                  opacity: 0.3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(word, style: TextStyle(color: Colors.grey.shade500)),
                  ),
                ),
                child: TapScale(
                  onTap: () => _onDragDropTap(word),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      word,
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        if (_hasAnswered) _buildOrderFeedback(question),
      ],
    );
  }

  void _onDragDropTap(String word) {
    setState(() {
      _orderedWords.add(word);
    });
  }

  Widget _buildOrderFeedback(QuizQuestion question) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isCorrect
            ? AppTheme.secondaryColor.withValues(alpha: 0.1)
            : AppTheme.errorColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _isCorrect ? Icons.check_circle : Icons.cancel,
                color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
              ),
              const SizedBox(width: 8),
              Text(
                _isCorrect ? 'Correct!' : 'Incorrect',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Correct: ${question.orderedWords?.join(' ')}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildMatching(QuizQuestion question) {
    // Initialize matching pairs for this question
    final leftCount = question.leftItems?.length ?? 0;
    if (_matchingPairs.length != leftCount && !_hasAnswered) {
      _matchingPairs = List.filled(leftCount, null);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Match items from left to right:',
          style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 16),
        if (question.leftItems != null && question.rightItems != null) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left column
              Expanded(
                child: Column(
                  children: question.leftItems!.asMap().entries.map((entry) {
                    final isMatched = entry.key < _matchingPairs.length && _matchingPairs[entry.key] != null;
                    final isSelected = _selectedLeftIndex == entry.key;

                    return GestureDetector(
                      onTap: _hasAnswered || isMatched ? null : () => _selectLeftItem(entry.key),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? widget.color.withValues(alpha: 0.2)
                              : isMatched
                                  ? AppTheme.secondaryColor.withValues(alpha: 0.1)
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? widget.color
                                : isMatched
                                    ? AppTheme.secondaryColor
                                    : Colors.grey.shade300,
                            width: isSelected || isMatched ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (isMatched)
                              Icon(Icons.link, color: AppTheme.secondaryColor, size: 18),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(width: 16),
              // Right column
              Expanded(
                child: Column(
                  children: question.rightItems!.asMap().entries.map((entry) {
                    final isSelected = _selectedRightIndex == entry.key;
                    final isUsed = _matchingPairs.contains(entry.key);

                    return GestureDetector(
                      onTap: _hasAnswered || isUsed ? null : () => _selectRightItem(entry.key),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? widget.color.withValues(alpha: 0.2)
                              : isUsed
                                  ? Colors.grey.shade200
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? widget.color : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            color: isUsed ? Colors.grey.shade500 : AppTheme.textPrimary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          if (!_hasAnswered && _selectedLeftIndex != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Now tap an item on the right to match',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
              ),
            ),
        ],
        if (_hasAnswered) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _isCorrect
                  ? AppTheme.secondaryColor.withValues(alpha: 0.1)
                  : AppTheme.errorColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _isCorrect ? Icons.check_circle : Icons.cancel,
                      color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isCorrect ? 'All matches correct!' : 'Some matches incorrect',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn().slideY(begin: 0.2),
        ],
      ],
    );
  }

  void _selectLeftItem(int index) {
    setState(() {
      _selectedLeftIndex = index;
      _selectedRightIndex = null;
    });
  }

  void _selectRightItem(int index) {
    if (_selectedLeftIndex == null) return;
    setState(() {
      _matchingPairs[_selectedLeftIndex!] = index;
      _selectedLeftIndex = null;
      _selectedRightIndex = null;
    });
  }

  Widget _buildMultipleChoice(QuizQuestion question) {
    return Column(
      children: question.options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = _selectedAnswer == option;
        final isCorrectAnswer = option == question.correctAnswer;

        Color? borderColor;
        Color? backgroundColor;
        IconData? icon;

        if (_hasAnswered) {
          if (isCorrectAnswer) {
            borderColor = AppTheme.secondaryColor;
            backgroundColor = AppTheme.secondaryColor.withValues(alpha: 0.1);
            icon = Icons.check_circle;
          } else if (isSelected && !isCorrectAnswer) {
            borderColor = AppTheme.errorColor;
            backgroundColor = AppTheme.errorColor.withValues(alpha: 0.1);
            icon = Icons.cancel;
          }
        } else if (isSelected) {
          borderColor = widget.color;
          backgroundColor = widget.color.withValues(alpha: 0.1);
        }

        Widget card = Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor ?? Colors.grey.shade300,
              width: isSelected || (_hasAnswered && isCorrectAnswer) ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: isSelected || (_hasAnswered && isCorrectAnswer)
                      ? (borderColor ?? widget.color)
                      : Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected || (_hasAnswered && isCorrectAnswer)
                          ? Colors.white
                          : AppTheme.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
              if (icon != null)
                Icon(icon, color: borderColor),
            ],
          ),
        );

        // Add bounce animation for correct answer
        if (_hasAnswered && isCorrectAnswer && _shouldBounce) {
          card = BounceIn(child: card);
        }

        // Add shake animation for wrong answer
        if (_hasAnswered && isSelected && !isCorrectAnswer && _shouldShake) {
          card = ShakeWidget(animate: _shouldShake, child: card);
        }

        return StaggeredListItem(
          index: index,
          child: GestureDetector(
            onTap: _hasAnswered ? null : () => _selectAnswer(option),
            child: card,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFillInBlank(QuizQuestion question) {
    return Column(
      children: question.options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = _selectedAnswer == option;

        Color? borderColor;
        Color? backgroundColor;
        IconData? icon;

        if (_hasAnswered) {
          if (option == question.correctAnswer || option == question.correctAnswer2) {
            borderColor = AppTheme.secondaryColor;
            backgroundColor = AppTheme.secondaryColor.withValues(alpha: 0.1);
            icon = Icons.check_circle;
          } else if (isSelected) {
            borderColor = AppTheme.errorColor;
            backgroundColor = AppTheme.errorColor.withValues(alpha: 0.1);
            icon = Icons.cancel;
          }
        } else if (isSelected) {
          borderColor = widget.color;
          backgroundColor = widget.color.withValues(alpha: 0.1);
        }

        Widget card = Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor ?? Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: isSelected ? (borderColor ?? widget.color) : Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : AppTheme.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
              if (icon != null)
                Icon(icon, color: borderColor),
            ],
          ),
        );

        if (_hasAnswered && (option == question.correctAnswer || option == question.correctAnswer2) && _shouldBounce) {
          card = BounceIn(child: card);
        }

        if (_hasAnswered && isSelected && option != question.correctAnswer && option != question.correctAnswer2 && _shouldShake) {
          card = ShakeWidget(animate: _shouldShake, child: card);
        }

        return StaggeredListItem(
          index: index,
          child: GestureDetector(
            onTap: _hasAnswered ? null : () => _selectAnswer(option),
            child: card,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSentenceOrder(QuizQuestion question) {
    if (_orderedWords.isEmpty && !_hasAnswered) {
      _orderedWords = List.from(question.orderedWords ?? []);
    }

    Widget orderedSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Arrange the words to form a correct sentence:',
          style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 16),
        if (_orderedWords.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _orderedWords.asMap().entries.map((entry) {
              return TapScale(
                onTap: _hasAnswered ? null : () => _removeOrderedWord(entry.key),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        if (_orderedWords.isEmpty && !_hasAnswered)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Tap words below to arrange',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            ),
          ),
        const SizedBox(height: 20),
        const Text(
          'Available words:',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        if (!_hasAnswered)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (question.orderedWords ?? []).map((word) {
              final isUsed = _orderedWords.contains(word);
              return TapScale(
                onTap: isUsed ? null : () => _addOrderedWord(word),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isUsed ? Colors.grey.shade300 : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    word,
                    style: TextStyle(
                      color: isUsed ? Colors.grey.shade500 : AppTheme.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        if (_hasAnswered) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _isCorrect
                  ? AppTheme.secondaryColor.withValues(alpha: 0.1)
                  : AppTheme.errorColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _isCorrect ? Icons.check_circle : Icons.cancel,
                      color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isCorrect ? 'Correct!' : 'Incorrect',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Correct: ${question.orderedWords?.join(' ')}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ).animate().fadeIn().slideY(begin: 0.2),
        ],
      ],
    );

    return orderedSection;
  }

  void _addOrderedWord(String word) {
    setState(() {
      _orderedWords.add(word);
    });
  }

  void _removeOrderedWord(int index) {
    setState(() {
      _orderedWords.removeAt(index);
    });
  }

  Widget _buildSubmitButton() {
    final isEnabled = _selectedAnswer != null || _orderedWords.isNotEmpty;

    Widget button = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? _submitAnswer : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          disabledBackgroundColor: Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Check Answer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    return button;
  }

  Widget _buildFeedbackSection(QuizQuestion question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isCorrect
                ? AppTheme.secondaryColor.withValues(alpha: 0.1)
                : AppTheme.errorColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _isCorrect ? Icons.check_circle : Icons.cancel,
                    color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _isCorrect ? 'Correct!' : 'Incorrect',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _isCorrect ? AppTheme.secondaryColor : AppTheme.errorColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                question.explanation,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ).animate().fadeIn().slideY(begin: 0.2),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _nextQuestion,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              _currentQuestionIndex < widget.quiz.questions.length - 1
                  ? 'Next Question'
                  : 'See Results',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ).animate().fadeIn(delay: const Duration(milliseconds: 200)),
      ],
    );
  }

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  void _submitAnswer() {
    final question = widget.quiz.questions[_currentQuestionIndex];

    bool isCorrect;
    switch (question.type) {
      case QuestionType.sentenceOrder:
      case QuestionType.dragDrop:
        final userAnswer = _orderedWords.join(' ');
        isCorrect = userAnswer == (question.orderedWords?.join(' '));
        break;
      case QuestionType.matching:
        isCorrect = true;
        if (question.correctPairs != null) {
          for (int i = 0; i < question.correctPairs!.length; i += 2) {
            final leftIdx = question.correctPairs![i];
            final rightIdx = question.correctPairs![i + 1];
            if (_matchingPairs.length > leftIdx && _matchingPairs[leftIdx] != rightIdx) {
              isCorrect = false;
              break;
            }
          }
        }
        break;
      default:
        isCorrect = _selectedAnswer == question.correctAnswer ||
            _selectedAnswer == question.correctAnswer2;
    }

    setState(() {
      _hasAnswered = true;
      _isCorrect = isCorrect;
      _shouldShake = !isCorrect && (_selectedAnswer != null || _orderedWords.isNotEmpty || _matchingPairs.isNotEmpty);
      _shouldBounce = isCorrect;
      if (isCorrect) {
        _correctCount++;
      }
      _userAnswers[_currentQuestionIndex] = _selectedAnswer;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
        _hasAnswered = false;
        _isCorrect = false;
        _orderedWords = [];
        _matchingPairs = [];
        _selectedLeftIndex = null;
        _selectedRightIndex = null;
        _shouldShake = false;
        _shouldBounce = false;
        if (widget.quiz.timeLimitSeconds != null) {
          _remainingSeconds = widget.quiz.timeLimitSeconds!;
        }
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() async {
    final score = ((_correctCount / widget.quiz.questions.length) * 100).round();
    final xpEarned = (widget.quiz.xpReward * (_correctCount / widget.quiz.questions.length)).round();

    // Capture mounted state before async operation
    final isMounted = mounted;
    final progress = context.read<ProgressProvider>();
    await progress.completeQuiz(widget.quiz.id, score, xpEarned);

    // Only update state if still mounted
    if (!isMounted) return;

    setState(() {
      _showResults = true;
    });

    // Show quiz result dialog
    if (!mounted) return;
    QuizResultDialog.show(
      context,
      score: _correctCount,
      total: widget.quiz.questions.length,
      xpEarned: xpEarned,
    );
  }

  Widget _buildResultsScreen() {
    final score = ((_correctCount / widget.quiz.questions.length) * 100).round();
    final xpEarned = (widget.quiz.xpReward * (_correctCount / widget.quiz.questions.length)).round();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated result icon
              Icon(
                score >= 70 ? Icons.emoji_events : Icons.sentiment_satisfied,
                size: 100,
                color: score >= 70 ? const Color(0xFFFFD700) : AppTheme.accentColor,
              ).animate().scale(
                begin: const Offset(0, 0),
                end: const Offset(1, 1),
                duration: const Duration(milliseconds: 600),
                curve: Curves.elasticOut,
              ),
              const SizedBox(height: 24),
              FadeSlideIn(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  score >= 70 ? 'Great Job!' : 'Good Effort!',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You completed the quiz',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.textSecondary,
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
              const SizedBox(height: 32),
              // Score Card
              FadeSlideIn(
                delay: const Duration(milliseconds: 500),
                child: Container(
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
                      CountUpText(
                        value: score,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: score >= 70 ? AppTheme.secondaryColor : AppTheme.accentColor,
                        ),
                      ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                      const Text(
                        '%',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$_correctCount of ${widget.quiz.questions.length} correct',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GlowBox(
                        glowColor: const Color(0xFFFFD700),
                        blurRadius: 15,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star, color: AppTheme.accentColor, size: 20),
                              const SizedBox(width: 8),
                              CountUpText(
                                value: xpEarned,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.accentColor,
                                ),
                              ),
                              const Text(
                                ' XP',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.color,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 800)).slideY(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Exit Quiz?'),
        content: const Text('Your progress will not be saved if you exit now.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              'Exit',
              style: TextStyle(color: AppTheme.errorColor),
            ),
          ),
        ],
      ),
    );
  }

  Color _getQuestionTypeColor(QuestionType type) {
    switch (type) {
      case QuestionType.multipleChoice:
        return widget.color;
      case QuestionType.fillInBlank:
        return AppTheme.accentColor;
      case QuestionType.trueFalse:
        return AppTheme.secondaryColor;
      case QuestionType.sentenceOrder:
        return AppTheme.primaryColor;
      case QuestionType.dragDrop:
        return const Color(0xFF9C27B0); // Purple
      case QuestionType.matching:
        return const Color(0xFF00BCD4); // Cyan
    }
  }

  String _getQuestionTypeName(QuestionType type) {
    switch (type) {
      case QuestionType.multipleChoice:
        return 'Multiple Choice';
      case QuestionType.fillInBlank:
        return 'Fill in the Blank';
      case QuestionType.trueFalse:
        return 'True or False';
      case QuestionType.sentenceOrder:
        return 'Sentence Ordering';
      case QuestionType.dragDrop:
        return 'Drag & Drop';
      case QuestionType.matching:
        return 'Matching';
    }
  }
}