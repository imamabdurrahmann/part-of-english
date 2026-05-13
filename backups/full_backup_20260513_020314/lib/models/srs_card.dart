// SRS Card Model with enhanced SM-2 algorithm
class SrsCard {
  final String id;
  final String front;
  final String back;
  final String? example;
  final String? category;
  final DateTime? nextReviewDate;
  final int repetitionCount;
  final double easeFactor;
  final int interval;

  // New fields for enhanced tracking
  final int totalReviews;
  final int correctReviews;
  final DateTime? lastReviewDate;

  const SrsCard({
    required this.id,
    required this.front,
    required this.back,
    this.example,
    this.category,
    this.nextReviewDate,
    this.repetitionCount = 0,
    this.easeFactor = 2.5,
    this.interval = 0,
    this.totalReviews = 0,
    this.correctReviews = 0,
    this.lastReviewDate,
  });

  SrsCard copyWith({
    String? id,
    String? front,
    String? back,
    String? example,
    String? category,
    DateTime? nextReviewDate,
    int? repetitionCount,
    double? easeFactor,
    int? interval,
    int? totalReviews,
    int? correctReviews,
    DateTime? lastReviewDate,
  }) {
    return SrsCard(
      id: id ?? this.id,
      front: front ?? this.front,
      back: back ?? this.back,
      example: example ?? this.example,
      category: category ?? this.category,
      nextReviewDate: nextReviewDate ?? this.nextReviewDate,
      repetitionCount: repetitionCount ?? this.repetitionCount,
      easeFactor: easeFactor ?? this.easeFactor,
      interval: interval ?? this.interval,
      totalReviews: totalReviews ?? this.totalReviews,
      correctReviews: correctReviews ?? this.correctReviews,
      lastReviewDate: lastReviewDate ?? this.lastReviewDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'front': front,
      'back': back,
      'example': example,
      'category': category,
      'nextReviewDate': nextReviewDate?.toIso8601String(),
      'repetitionCount': repetitionCount,
      'easeFactor': easeFactor,
      'interval': interval,
      'totalReviews': totalReviews,
      'correctReviews': correctReviews,
      'lastReviewDate': lastReviewDate?.toIso8601String(),
    };
  }

  factory SrsCard.fromJson(Map<String, dynamic> json) {
    return SrsCard(
      id: json['id'] as String,
      front: json['front'] as String,
      back: json['back'] as String,
      example: json['example'] as String?,
      category: json['category'] as String?,
      nextReviewDate: json['nextReviewDate'] != null
          ? DateTime.parse(json['nextReviewDate'] as String)
          : null,
      repetitionCount: json['repetitionCount'] as int? ?? 0,
      easeFactor: (json['easeFactor'] as num?)?.toDouble() ?? 2.5,
      interval: json['interval'] as int? ?? 0,
      totalReviews: json['totalReviews'] as int? ?? 0,
      correctReviews: json['correctReviews'] as int? ?? 0,
      lastReviewDate: json['lastReviewDate'] != null
          ? DateTime.parse(json['lastReviewDate'] as String)
          : null,
    );
  }

  bool get isDue {
    if (nextReviewDate == null) return true;
    return DateTime.now().isAfter(nextReviewDate!);
  }

  bool get isNew => repetitionCount == 0;

  double get retentionRate {
    if (totalReviews == 0) return 0;
    return (correctReviews / totalReviews) * 100;
  }

  String get nextReviewText {
    if (nextReviewDate == null) return 'Baru';
    final now = DateTime.now();
    final diff = nextReviewDate!.difference(now);
    if (diff.isNegative) return 'Overdue';
    if (diff.inDays == 0) return 'Hari ini';
    if (diff.inDays == 1) return 'Besok';
    if (diff.inDays < 7) return '${diff.inDays} hari';
    if (diff.inDays < 30) return '${(diff.inDays / 7).round()} minggu';
    return '${(diff.inDays / 30).round()} bulan';
  }
}

// SRS Rating with enhanced SM-2 algorithm
enum SrsRating {
  again(0, 'Again', 'Ulangi lagi', 0.0),
  hard(1, 'Hard', 'Sulit', 0.15),
  good(2, 'Good', 'Baik', 0.20),
  easy(3, 'Easy', 'Mudah', 0.25);

  final int value;
  final String label;
  final String labelId;
  final double easeModifier;

  const SrsRating(this.value, this.label, this.labelId, this.easeModifier);
}
