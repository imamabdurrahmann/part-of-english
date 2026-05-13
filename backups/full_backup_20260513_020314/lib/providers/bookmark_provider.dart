import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkProvider extends ChangeNotifier {
  List<String> _bookmarkedWords = [];
  bool _isLoading = true;

  List<String> get bookmarkedWords => _bookmarkedWords;
  bool get isLoading => _isLoading;

  int get totalBookmarks => _bookmarkedWords.length;

  BookmarkProvider() {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final bookmarksJson = prefs.getStringList('bookmarked_words');
    if (bookmarksJson != null) {
      _bookmarkedWords = bookmarksJson;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarked_words', _bookmarkedWords);
  }

  bool isBookmarked(String word) {
    return _bookmarkedWords.contains(word);
  }

  Future<void> toggleBookmark(String word) async {
    if (_bookmarkedWords.contains(word)) {
      _bookmarkedWords.remove(word);
    } else {
      _bookmarkedWords.add(word);
    }
    notifyListeners();
    await _saveBookmarks();
  }

  Future<void> addBookmark(String word) async {
    if (!_bookmarkedWords.contains(word)) {
      _bookmarkedWords.add(word);
      notifyListeners();
      await _saveBookmarks();
    }
  }

  Future<void> removeBookmark(String word) async {
    if (_bookmarkedWords.contains(word)) {
      _bookmarkedWords.remove(word);
      notifyListeners();
      await _saveBookmarks();
    }
  }

  Future<void> clearAllBookmarks() async {
    _bookmarkedWords.clear();
    notifyListeners();
    await _saveBookmarks();
  }
}
