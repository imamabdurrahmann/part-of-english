import '../models/grammar_models.dart';

class VocabularyCache {
  static final Map<String, List<VocabularyCategory>> _cache = {};
  static bool _isInitialized = false;
  static List<VocabularyCategory>? _allCategories;

  static void init(List<VocabularyCategory> categories) {
    _allCategories = categories;
    _isInitialized = true;
  }

  static List<VocabularyCategory> get allCategories {
    if (_allCategories == null) {
      throw Exception('VocabularyCache not initialized. Call init() first.');
    }
    return _allCategories!;
  }

  static List<VocabularyCategory> getByPrefix(String prefix) {
    if (_cache.containsKey(prefix)) {
      return _cache[prefix]!;
    }

    if (_allCategories == null) return [];

    final filtered = _allCategories!
        .where((cat) => cat.name.toLowerCase().startsWith(prefix.toLowerCase()))
        .toList();

    _cache[prefix] = filtered;
    return filtered;
  }

  static List<VocabularyCategory> get paginated {
    if (_cache.containsKey('paginated')) {
      return _cache['paginated']!;
    }

    if (_allCategories == null) return [];

    final first10 = _allCategories!.take(10).toList();
    _cache['paginated'] = first10;
    return first10;
  }

  static void clear() {
    _cache.clear();
  }

  static bool get isInitialized => _isInitialized;
}
