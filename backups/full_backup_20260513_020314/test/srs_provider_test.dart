import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:part_of_english/models/srs_card.dart';
import 'package:part_of_english/providers/srs_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SrsCard Model Tests', () {
    test('new card has default ease factor of 2.5', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      expect(card.easeFactor, 2.5);
      expect(card.repetitionCount, 0);
      expect(card.interval, 0);
    });

    test('card is due when nextReviewDate is null', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      expect(card.isDue, true);
    });

    test('card is due when nextReviewDate is in the past', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        nextReviewDate: DateTime.now().subtract(const Duration(days: 1)),
      );

      expect(card.isDue, true);
    });

    test('card is NOT due when nextReviewDate is in the future', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        nextReviewDate: DateTime.now().add(const Duration(days: 2)),
      );

      expect(card.isDue, false);
    });

    test('card is new when repetitionCount is 0', () {
      final newCard = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      final reviewedCard = SrsCard(
        id: 'test-2',
        front: 'Hello',
        back: 'World',
        repetitionCount: 1,
      );

      expect(newCard.isNew, true);
      expect(reviewedCard.isNew, false);
    });

    test('retention rate calculation', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        totalReviews: 10,
        correctReviews: 8,
      );

      expect(card.retentionRate, 80.0);
    });

    test('retention rate is 0 when no reviews', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      expect(card.retentionRate, 0);
    });

    test('nextReviewText returns "Baru" when nextReviewDate is null', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      expect(card.nextReviewText, 'Baru');
    });

    test('nextReviewText returns "Hari ini" when due today', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        nextReviewDate: DateTime.now().add(const Duration(hours: 1)),
      );

      expect(card.nextReviewText, 'Hari ini');
    });

    test('nextReviewText returns "Besok" when due tomorrow', () {
      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        nextReviewDate: DateTime.now().add(const Duration(days: 1)),
      );

      expect(card.nextReviewText, 'Besok');
    });

    test('SrsRating enum has correct values', () {
      expect(SrsRating.again.value, 0);
      expect(SrsRating.hard.value, 1);
      expect(SrsRating.good.value, 2);
      expect(SrsRating.easy.value, 3);
    });

    test('SrsRating has correct ease modifiers', () {
      expect(SrsRating.again.easeModifier, 0.0);
      expect(SrsRating.hard.easeModifier, 0.15);
      expect(SrsRating.good.easeModifier, 0.20);
      expect(SrsRating.easy.easeModifier, 0.25);
    });

    test('copyWith creates new instance with updated values', () {
      final original = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        easeFactor: 2.5,
      );

      final updated = original.copyWith(
        easeFactor: 2.0,
        interval: 5,
      );

      expect(updated.id, 'test-1');
      expect(updated.front, 'Hello');
      expect(updated.back, 'World');
      expect(updated.easeFactor, 2.0);
      expect(updated.interval, 5);
    });

    test('toJson and fromJson round-trip', () {
      final original = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        example: 'Example sentence',
        category: 'greetings',
        easeFactor: 2.5,
        interval: 3,
        repetitionCount: 2,
        totalReviews: 5,
        correctReviews: 4,
      );

      final json = original.toJson();
      final restored = SrsCard.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.front, original.front);
      expect(restored.back, original.back);
      expect(restored.example, original.example);
      expect(restored.category, original.category);
      expect(restored.easeFactor, original.easeFactor);
      expect(restored.interval, original.interval);
      expect(restored.repetitionCount, original.repetitionCount);
      expect(restored.totalReviews, original.totalReviews);
      expect(restored.correctReviews, original.correctReviews);
    });

    test('fromJson handles null nextReviewDate', () {
      final json = {
        'id': 'test-1',
        'front': 'Hello',
        'back': 'World',
        'nextReviewDate': null,
      };

      final card = SrsCard.fromJson(json);

      expect(card.nextReviewDate, null);
      expect(card.isDue, true);
    });
  });

  group('SrsProvider with Mock SharedPreferences', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('provider initializes with empty cards', () async {
      final provider = SrsProvider();
      // Wait for async initialization
      await Future.delayed(Duration.zero);
      expect(provider.cards, isEmpty);
    });

    test('addCard adds card to list', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      await provider.addCard(card);

      expect(provider.cards.length, 1);
      expect(provider.cards.first.id, 'test-1');
    });

    test('removeCard removes card from list', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      await provider.addCard(card);
      expect(provider.cards.length, 1);

      await provider.removeCard('test-1');
      expect(provider.cards, isEmpty);
    });

    test('dueCount returns correct count', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      // New cards are always due
      await provider.addCard(SrsCard(id: '1', front: 'a', back: 'b'));
      await provider.addCard(SrsCard(id: '2', front: 'c', back: 'd'));

      expect(provider.dueCount, 2);
    });

    test('reviewCard with again resets card', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
        repetitionCount: 2,
        interval: 5,
      );

      await provider.addCard(card);
      await provider.reviewCard('test-1', SrsRating.again);

      final updatedCard = provider.cards.first;
      expect(updatedCard.repetitionCount, 0);
      expect(updatedCard.interval, 0);
    });

    test('reviewCard with good increments repetition', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      final card = SrsCard(
        id: 'test-1',
        front: 'Hello',
        back: 'World',
      );

      await provider.addCard(card);
      await provider.reviewCard('test-1', SrsRating.good);

      final updatedCard = provider.cards.first;
      expect(updatedCard.repetitionCount, 1);
      expect(updatedCard.interval, 2); // firstReviewGood
      expect(updatedCard.totalReviews, 1);
      expect(updatedCard.correctReviews, 1);
    });

    test('setCategory filters cards correctly', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      await provider.addCard(SrsCard(id: '1', front: 'a', back: 'b', category: 'greetings'));
      await provider.addCard(SrsCard(id: '2', front: 'c', back: 'd', category: 'verbs'));
      await provider.addCard(SrsCard(id: '3', front: 'e', back: 'f', category: 'greetings'));

      provider.setCategory('greetings');
      expect(provider.getCardsByCategory('greetings').length, 2);
      expect(provider.getCardsByCategory('verbs').length, 1);
    });

    test('getRandomDueCard returns due card', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      await provider.addCard(SrsCard(id: '1', front: 'a', back: 'b'));

      final dueCard = provider.getRandomDueCard();
      expect(dueCard, isNotNull);
      expect(dueCard!.id, '1');
    });

    test('getRandomDueCard with category filters correctly', () async {
      final provider = SrsProvider();
      await Future.delayed(Duration.zero);

      await provider.addCard(SrsCard(id: '1', front: 'a', back: 'b', category: 'greetings'));
      await provider.addCard(SrsCard(id: '2', front: 'c', back: 'd', category: 'verbs'));

      final dueCard = provider.getRandomDueCard('greetings');
      expect(dueCard, isNotNull);
      expect(dueCard!.category, 'greetings');
    });
  });
}
