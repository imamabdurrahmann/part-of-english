import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../models/srs_card.dart';

class SrsProvider extends ChangeNotifier {
  List<SrsCard> _cards = [];
  bool _isLoading = true;
  String _currentCategory = 'all';

  // Review history for statistics
  List<_ReviewHistoryEntry> _reviewHistory = [];

  // Cached statistics to avoid recalculation
  int? _cachedDueCount;
  int? _cachedNewCount;
  int? _cachedReviewCount;
  double? _cachedAverageRetention;
  int? _cachedTotalReviewsAllTime;

  List<SrsCard> get cards => _cards;
  bool get isLoading => _isLoading;
  String get currentCategory => _currentCategory;

  // Get cards due for review
  List<SrsCard> get dueCards {
    return _cards.where((card) => card.isDue).toList();
  }

  // Get cards by category
  List<SrsCard> getCardsByCategory(String category) {
    if (category == 'all') return _cards;
    return _cards.where((card) => card.category == category).toList();
  }

  // Get due cards by category
  List<SrsCard> getDueCardsByCategory(String category) {
    final categoryCards = getCardsByCategory(category);
    return categoryCards.where((card) => card.isDue).toList();
  }

  // Get categories
  List<String> get categories {
    final cats = _cards.map((c) => c.category).whereType<String>().toSet().toList();
    cats.sort();
    return ['all', ...cats];
  }

  // Invalidate cache when cards change
  void _invalidateCache() {
    _cachedDueCount = null;
    _cachedNewCount = null;
    _cachedReviewCount = null;
    _cachedAverageRetention = null;
    _cachedTotalReviewsAllTime = null;
  }

  // Statistics with caching
  int get totalCards => _cards.length;
  int get dueCount {
    _cachedDueCount ??= dueCards.length;
    return _cachedDueCount!;
  }
  int get newCount {
    _cachedNewCount ??= _cards.where((c) => c.isNew).length;
    return _cachedNewCount!;
  }
  int get reviewCount {
    _cachedReviewCount ??= _cards.where((c) => !c.isNew).length;
    return _cachedReviewCount!;
  }

  // Enhanced statistics with caching
  double get averageRetention {
    _cachedAverageRetention ??= () {
      final reviewed = _cards.where((c) => c.totalReviews > 0).toList();
      if (reviewed.isEmpty) return 0.0;
      return reviewed.map((c) => c.retentionRate).reduce((a, b) => a + b) / reviewed.length;
    }();
    return _cachedAverageRetention!;
  }

  int get totalReviewsAllTime {
    _cachedTotalReviewsAllTime ??= _cards.fold<int>(0, (sum, c) => sum + c.totalReviews);
    return _cachedTotalReviewsAllTime!;
  }

  Map<int, int> getReviewForecast() {
    final forecast = <int, int>{};
    final now = DateTime.now();
    for (int i = 0; i < 7; i++) {
      forecast[i] = 0;
    }
    for (final card in _cards) {
      if (card.nextReviewDate != null) {
        final diff = card.nextReviewDate!.difference(now).inDays;
        if (diff >= 0 && diff < 7) {
          forecast[diff] = (forecast[diff] ?? 0) + 1;
        }
      }
    }
    return forecast;
  }

  SrsProvider() {
    _loadCards();
  }

  Future<void> _loadCards() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final cardsJson = prefs.getStringList(AppConstants.keySrsCards);
    if (cardsJson != null) {
      _cards = cardsJson
          .map((json) => SrsCard.fromJson(jsonDecode(json)))
          .toList();
    }

    final historyJson = prefs.getString(AppConstants.keySrsHistory);
    if (historyJson != null) {
      final List<dynamic> decoded = jsonDecode(historyJson);
      _reviewHistory = decoded.map((e) => _ReviewHistoryEntry.fromJson(e)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _saveCards() async {
    final prefs = await SharedPreferences.getInstance();
    final cardsJson = _cards.map((c) => jsonEncode(c.toJson())).toList();
    await prefs.setStringList(AppConstants.keySrsCards, cardsJson);
    await prefs.setString(AppConstants.keySrsHistory, jsonEncode(_reviewHistory.map((e) => e.toJson()).toList()));
  }

  void setCategory(String category) {
    _currentCategory = category;
    notifyListeners();
  }

  // Add card
  Future<void> addCard(SrsCard card) async {
    _cards.add(card);
    _invalidateCache();
    notifyListeners();
    await _saveCards();
  }

  // Add multiple cards
  Future<void> addCards(List<SrsCard> newCards) async {
    _cards.addAll(newCards);
    _invalidateCache();
    notifyListeners();
    await _saveCards();
  }

  // Remove card
  Future<void> removeCard(String cardId) async {
    _cards.removeWhere((c) => c.id == cardId);
    _invalidateCache();
    notifyListeners();
    await _saveCards();
  }

  // Update card after review using Enhanced SM-2 algorithm
  Future<void> reviewCard(String cardId, SrsRating rating) async {
    final index = _cards.indexWhere((c) => c.id == cardId);
    if (index == -1) return;

    final card = _cards[index];
    SrsCard updatedCard;

    // Track review history
    _reviewHistory.add(_ReviewHistoryEntry(
      cardId: cardId,
      rating: rating,
      timestamp: DateTime.now(),
    ));

    if (rating == SrsRating.again) {
      // Reset card with graduated intervals
      updatedCard = card.copyWith(
        repetitionCount: 0,
        interval: 0,
        nextReviewDate: DateTime.now(),
        easeFactor: AppConstants.defaultEaseFactor,
        totalReviews: card.totalReviews + 1,
        correctReviews: card.correctReviews,
        lastReviewDate: DateTime.now(),
      );
    } else {
      // Enhanced SM-2 Algorithm
      int newRepetition = card.repetitionCount + 1;
      int newInterval;
      double newEaseFactor = card.easeFactor;

      // Dynamic ease factor adjustment based on rating
      final easeDelta = rating.easeModifier - 0.15;
      newEaseFactor = card.easeFactor + easeDelta;
      newEaseFactor = newEaseFactor.clamp(
        AppConstants.minEaseFactor,
        AppConstants.maxEaseFactor,
      );

      // Calculate interval based on rating and repetitions
      if (card.repetitionCount == 0) {
        // First successful review
        newInterval = switch (rating) {
          SrsRating.easy => AppConstants.firstReviewEasy,
          SrsRating.hard => AppConstants.firstReviewHard,
          _ => AppConstants.firstReviewGood,
        };
      } else if (card.repetitionCount == 1) {
        // Second review
        newInterval = switch (rating) {
          SrsRating.easy => AppConstants.secondReviewEasy,
          SrsRating.hard => AppConstants.secondReviewHard,
          _ => AppConstants.secondReviewGood,
        };
      } else {
        // Subsequent reviews - use modified ease factor
        final modifiedEase = newEaseFactor + (rating == SrsRating.easy ? 0.15 : 0);
        newInterval = switch (rating) {
          SrsRating.hard =>
            (card.interval * AppConstants.hardIntervalMultiplier).round().clamp(1, 999999),
          SrsRating.good =>
            (card.interval * modifiedEase).round(),
          SrsRating.easy =>
            (card.interval * modifiedEase * AppConstants.easyIntervalMultiplier).round(),
          _ => card.interval,
        };
      }

      // Apply maximum interval cap
      newInterval = newInterval.clamp(0, AppConstants.maxIntervalDays);

      final nextDate = DateTime.now().add(Duration(days: newInterval));

      updatedCard = card.copyWith(
        repetitionCount: newRepetition,
        interval: newInterval,
        easeFactor: newEaseFactor,
        nextReviewDate: nextDate,
        totalReviews: card.totalReviews + 1,
        correctReviews: rating != SrsRating.again
            ? card.correctReviews + 1
            : card.correctReviews,
        lastReviewDate: DateTime.now(),
      );
    }

    _cards[index] = updatedCard;
    _invalidateCache();
    notifyListeners();
    await _saveCards();
  }

  // Get a random due card for review (prioritizing overdue cards)
  SrsCard? getRandomDueCard([String? category]) {
    List<SrsCard> due;
    if (category == null || category == 'all') {
      due = dueCards;
    } else {
      due = getDueCardsByCategory(category);
    }
    if (due.isEmpty) return null;

    // Sort by priority: overdue > due today > new > upcoming
    due.sort((a, b) {
      final aOverdue = a.nextReviewDate == null ||
          a.nextReviewDate!.isBefore(DateTime.now().subtract(const Duration(days: 1)));
      final bOverdue = b.nextReviewDate == null ||
          b.nextReviewDate!.isBefore(DateTime.now().subtract(const Duration(days: 1)));

      if (aOverdue && !bOverdue) return -1;
      if (!aOverdue && bOverdue) return 1;
      if (a.isNew && !b.isNew) return -1;
      if (!a.isNew && b.isNew) return 1;
      return 0;
    });

    // Shuffle within same priority
    due.shuffle();
    return due.first;
  }

  // Clear all cards
  Future<void> clearAllCards() async {
    _cards.clear();
    _reviewHistory.clear();
    _invalidateCache();
    notifyListeners();
    await _saveCards();
  }

  // Reset all progress
  Future<void> resetProgress() async {
    _cards = _cards.map((c) => c.copyWith(
      repetitionCount: 0,
      interval: 0,
      nextReviewDate: null,
      easeFactor: 2.5,
      totalReviews: 0,
      correctReviews: 0,
      lastReviewDate: null,
    )).toList();
    _reviewHistory.clear();
    _invalidateCache();
    notifyListeners();
    await _saveCards();
  }
}

class _ReviewHistoryEntry {
  final String cardId;
  final SrsRating rating;
  final DateTime timestamp;

  _ReviewHistoryEntry({
    required this.cardId,
    required this.rating,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'cardId': cardId,
    'rating': rating.value,
    'timestamp': timestamp.toIso8601String(),
  };

  factory _ReviewHistoryEntry.fromJson(Map<String, dynamic> json) {
    return _ReviewHistoryEntry(
      cardId: json['cardId'] as String,
      rating: SrsRating.values[json['rating'] as int],
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}
