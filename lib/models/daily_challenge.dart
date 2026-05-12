class DailyChallenge {
  final String id;
  final String title;
  final String description;
  final String type;
  final int xpReward;
  final List<ChallengeQuestion> questions;

  const DailyChallenge({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.xpReward,
    required this.questions,
  });
}

class ChallengeQuestion {
  final String question;
  final String type;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const ChallengeQuestion({
    required this.question,
    required this.type,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}
