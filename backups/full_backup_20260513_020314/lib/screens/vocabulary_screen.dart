import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/grammar_data.dart';
import '../data/vocabulary_data.dart';
import '../models/grammar_models.dart';
import '../providers/bookmark_provider.dart';
import '../providers/tts_provider.dart';
import '../theme/app_theme.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<VocabularyCategory> get _filteredCategories {
    if (_searchQuery.isEmpty) {
      return VocabularyData.categories;
    }
    final query = _searchQuery.toLowerCase();
    return VocabularyData.categories.where((category) {
      if (category.name.toLowerCase().contains(query)) {
        return true;
      }
      return category.words.any((word) =>
          word.english.toLowerCase().contains(query) ||
          word.indonesian.toLowerCase().contains(query));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final categories = _filteredCategories;
    final totalWords = VocabularyData.categories.fold<int>(
      0, (sum, cat) => sum + cat.words.length);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: const Color(vocabularyColor),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(vocabularyColor),
                      const Color(vocabularyColor).withValues(alpha: 0.7),
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
                              '📚',
                              style: TextStyle(fontSize: 40),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Vocabulary',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$totalWords kata | ${categories.length} kategori',
                          style: TextStyle(
                            fontSize: 16,
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
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari kata...',
                    prefixIcon: const Icon(Icons.search, color: Color(vocabularyColor)),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Categories List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final category = categories[index];
                return _VocabularyCategoryCard(
                  category: category,
                  searchQuery: _searchQuery,
                );
              },
              childCount: categories.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }
}

class _VocabularyCategoryCard extends StatefulWidget {
  final VocabularyCategory category;
  final String searchQuery;

  const _VocabularyCategoryCard({
    required this.category,
    required this.searchQuery,
  });

  @override
  State<_VocabularyCategoryCard> createState() => _VocabularyCategoryCardState();
}

class _VocabularyCategoryCardState extends State<_VocabularyCategoryCard> {
  bool _isExpanded = false;

  List<VocabularyWord> get _filteredWords {
    if (widget.searchQuery.isEmpty) {
      return widget.category.words;
    }
    final query = widget.searchQuery.toLowerCase();
    return widget.category.words.where((word) =>
        word.english.toLowerCase().contains(query) ||
        word.indonesian.toLowerCase().contains(query)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final words = _filteredWords;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
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
          children: [
            // Category Header
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(vocabularyColor).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.folder_outlined,
                        color: Color(vocabularyColor),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.category.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${words.length} kata',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
            // Words List (when expanded)
            if (_isExpanded && words.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: words.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  itemBuilder: (context, index) {
                    final word = words[index];
                    return _VocabularyWordTile(word: word);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _VocabularyWordTile extends StatefulWidget {
  final VocabularyWord word;

  const _VocabularyWordTile({required this.word});

  @override
  State<_VocabularyWordTile> createState() => _VocabularyWordTileState();
}

class _VocabularyWordTileState extends State<_VocabularyWordTile> {
  bool _showDetails = false;

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = context.watch<BookmarkProvider>();
    final ttsProvider = context.watch<TtsProvider>();
    final isBookmarked = bookmarkProvider.isBookmarked(widget.word.english);

    return InkWell(
      onTap: () {
        setState(() {
          _showDetails = !_showDetails;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.word.english,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.word.indonesian,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                // TTS button
                if (ttsProvider.isEnabled)
                  GestureDetector(
                    onTap: () {
                      if (ttsProvider.isSpeaking) {
                        ttsProvider.stop();
                      } else {
                        ttsProvider.speak(widget.word.english);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        ttsProvider.isSpeaking
                            ? Icons.volume_up
                            : Icons.volume_up_outlined,
                        color: AppTheme.primaryColor,
                        size: 22,
                      ),
                    ),
                  ),
                // Bookmark button
                GestureDetector(
                  onTap: () {
                    bookmarkProvider.toggleBookmark(widget.word.english);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? AppTheme.accentColor : Colors.grey[400],
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  _showDetails ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey[400],
                  size: 20,
                ),
              ],
            ),
            // Example sentences (when expanded)
            if (_showDetails) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Example
                    if (widget.word.example.isNotEmpty) ...[
                      _ExampleRow(
                        label: 'Contoh:',
                        text: widget.word.example,
                        color: AppTheme.secondaryColor,
                      ),
                      const SizedBox(height: 8),
                      _ExampleRow(
                        label: 'Arti:',
                        text: widget.word.indonesian,
                        color: Colors.grey[700]!,
                      ),
                    ],
                    // Simple Example
                    if (widget.word.simpleExample != null) ...[
                      const SizedBox(height: 8),
                      _ExampleRow(
                        label: 'Sederhana:',
                        text: widget.word.simpleExample!,
                        color: const Color(0xFF4CAF50),
                      ),
                    ],
                    // Complex Example
                    if (widget.word.complexExample != null) ...[
                      const SizedBox(height: 8),
                      _ExampleRow(
                        label: 'Lengkap:',
                        text: widget.word.complexExample!,
                        color: const Color(0xFFFF9800),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExampleRow extends StatelessWidget {
  final String label;
  final String text;
  final Color color;

  const _ExampleRow({
    required this.label,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
