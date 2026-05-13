import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/progress_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/bookmark_provider.dart';
import 'providers/tts_provider.dart';
import 'providers/srs_provider.dart';
import 'providers/daily_challenge_provider.dart';
import 'screens/main_shell.dart';
import 'theme/app_theme.dart';
import 'data/vocabulary_data.dart';
import 'data/vocabulary_cache.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize vocabulary cache lazily
  VocabularyCache.init(VocabularyData.categories);

  runApp(const PartOfEnglishApp());
}

class PartOfEnglishApp extends StatelessWidget {
  const PartOfEnglishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
        ChangeNotifierProvider(create: (_) => TtsProvider()),
        ChangeNotifierProvider(create: (_) => SrsProvider()),
        ChangeNotifierProvider(create: (_) => DailyChallengeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          if (themeProvider.isLoading) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            title: 'Part of English',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const MainShell(),
          );
        },
      ),
    );
  }
}
