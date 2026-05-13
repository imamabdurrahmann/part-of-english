import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyChallengeProvider extends ChangeNotifier {
  String? _lastCompletedDate;
  int _totalXpEarned = 0;
  int _completedChallenges = 0;

  String? get lastCompletedDate => _lastCompletedDate;
  int get totalXpEarned => _totalXpEarned;
  int get completedChallenges => _completedChallenges;

  bool get isCompletedToday {
    if (_lastCompletedDate == null) return false;
    final today = DateTime.now();
    final parts = _lastCompletedDate!.split('-');
    final completedDate = DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
    return completedDate.year == today.year &&
        completedDate.month == today.month &&
        completedDate.day == today.day;
  }

  DailyChallengeProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _lastCompletedDate = prefs.getString('challenge_last_date');
    _totalXpEarned = prefs.getInt('challenge_total_xp') ?? 0;
    _completedChallenges = prefs.getInt('challenge_completed_count') ?? 0;
    notifyListeners();
  }

  Future<void> completeChallenge(int xpEarned) async {
    final now = DateTime.now();
    _lastCompletedDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    _totalXpEarned += xpEarned;
    _completedChallenges += 1;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('challenge_last_date', _lastCompletedDate!);
    await prefs.setInt('challenge_total_xp', _totalXpEarned);
    await prefs.setInt('challenge_completed_count', _completedChallenges);

    notifyListeners();
  }
}
