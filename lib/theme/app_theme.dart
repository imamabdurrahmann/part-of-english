import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Application theme configuration with complete light/dark mode support
/// Optimized for senior-friendly reading with comfortable contrast levels
class AppTheme {
  AppTheme._();

  // ============================================================
  // BRAND COLORS
  // ============================================================
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF00C853);
  static const Color accentColor = Color(0xFFFF9800);
  static const Color errorColor = Color(0xFFF44336);

  // ============================================================
  // TEXT COLORS (for backwards compatibility)
  // ============================================================
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFBDBDBB);
  static const Color darkTextPrimary = Color(0xFFE8E8E8);
  static const Color darkTextSecondary = Color(0xFF9E9E9E);
  static const Color darkPrimaryColor = Color(0xFF8B7FFF);
  static const Color darkSecondaryColor = Color(0xFF69F0AE);
  static const Color darkAccentColor = Color(0xFFFFB74D);

  // ============================================================
  // LIGHT THEME COLORS (Senior-friendly, eye-strain reduced)
  // ============================================================
  static const Color _lightBackground = Color(0xFFF5F7FA);  // Off-white, not pure white
  static const Color _lightSurface = Color(0xFFFFFFFF);     // Pure white for cards
  static const Color _lightDivider = Color(0xFFE8ECF0);     // Soft divider

  // ============================================================
  // DARK THEME COLORS (Modern dark palette)
  // ============================================================
  static const Color _darkBackground = Color(0xFF0D0D0D);
  static const Color _darkSurface = Color(0xFF1A1A1A);
  static const Color _darkSurfaceVariant = Color(0xFF242424);
  static const Color _darkDivider = Color(0xFF2A2A2A);

  // ============================================================
  // GRADIENTS
  // ============================================================
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, Color(0xFF8B7FFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [secondaryColor, Color(0xFF69F0AE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [accentColor, Color(0xFFFFB74D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ============================================================
  // LIGHT THEME
  // ============================================================
  static ThemeData get lightTheme => _buildTheme(
        brightness: Brightness.light,
        background: _lightBackground,
        surface: _lightSurface,
        surfaceVariant: const Color(0xFFF0F2F5),
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        divider: _lightDivider,
        primary: primaryColor,
        secondary: secondaryColor,
        accent: accentColor,
        error: errorColor,
      );

  // ============================================================
  // DARK THEME
  // ============================================================
  static ThemeData get darkTheme => _buildTheme(
        brightness: Brightness.dark,
        background: _darkBackground,
        surface: _darkSurface,
        surfaceVariant: _darkSurfaceVariant,
        textPrimary: darkTextPrimary,
        textSecondary: darkTextSecondary,
        divider: _darkDivider,
        primary: darkPrimaryColor,
        secondary: darkSecondaryColor,
        accent: darkAccentColor,
        error: errorColor,
      );

  // ============================================================
  // THEME BUILDER
  // ============================================================
  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color background,
    required Color surface,
    required Color surfaceVariant,
    required Color textPrimary,
    required Color textSecondary,
    required Color divider,
    required Color primary,
    required Color secondary,
    required Color accent,
    required Color error,
  }) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,

      // ============================================================
      // COLOR SCHEME
      // ============================================================
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: brightness,
        primary: primary,
        secondary: secondary,
        tertiary: accent,
        error: error,
        surface: surface,
        surfaceContainerHighest: surfaceVariant,
        onSurface: textPrimary,
        onSurfaceVariant: textSecondary,
      ),

      // ============================================================
      // SCAFFOLD
      // ============================================================
      scaffoldBackgroundColor: background,

      // ============================================================
      // CARD THEME
      // ============================================================
      cardTheme: CardThemeData(
        color: surface,
        elevation: isDark ? 0 : 1,
        shadowColor: isDark ? Colors.black38 : Colors.black.withValues(alpha: 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),

      // ============================================================
      // APP BAR THEME
      // ============================================================
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),

      // ============================================================
      // BOTTOM NAVIGATION BAR
      // ============================================================
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: true,
      ),

      // ============================================================
      // DIVIDER THEME (soft, not cutting)
      // ============================================================
      dividerTheme: DividerThemeData(
        color: divider,
        thickness: 1,
        space: 1,
      ),

      // ============================================================
      // TEXT THEME (Senior-friendly typography)
      // ============================================================
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        // Larger title sizes for better readability
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        // Larger body text for senior users
        bodyLarge: GoogleFonts.poppins(
          fontSize: 18,
          color: textPrimary,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 16,
          color: textPrimary,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 14,
          color: textSecondary,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDark ? _darkBackground : Colors.white,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textSecondary,
        ),
      ),

      // ============================================================
      // BUTTON THEMES
      // ============================================================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: isDark ? _darkBackground : Colors.white,
          elevation: isDark ? 0 : 2,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          side: BorderSide(color: primary, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ============================================================
      // INPUT DECORATION THEME
      // ============================================================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? surfaceVariant : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? const Color(0xFF333333) : const Color(0xFFE0E4E8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),

      // ============================================================
      // LIST TILE THEME
      // ============================================================
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // ============================================================
      // CHIP THEME
      // ============================================================
      chipTheme: ChipThemeData(
        backgroundColor: isDark ? surfaceVariant : const Color(0xFFEEF0F3),
        selectedColor: primary.withValues(alpha: 0.2),
        labelStyle: GoogleFonts.poppins(fontSize: 14),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      // ============================================================
      // DIALOG THEME
      // ============================================================
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        elevation: isDark ? 0 : 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        contentTextStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: textSecondary,
        ),
      ),

      // ============================================================
      // BOTTOM SHEET THEME
      // ============================================================
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        elevation: isDark ? 0 : 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),

      // ============================================================
      // SWITCH THEME
      // ============================================================
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primary;
          }
          return Colors.grey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primary.withValues(alpha: 0.4);
          }
          return Colors.grey.shade300;
        }),
      ),

      // ============================================================
      // PROGRESS INDICATOR THEME
      // ============================================================
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primary,
        linearTrackColor: isDark ? const Color(0xFF333333) : const Color(0xFFE8ECF0),
      ),

      // ============================================================
      // SNACK BAR THEME
      // ============================================================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? surfaceVariant : const Color(0xFF323232),
        contentTextStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: isDark ? textPrimary : Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// ============================================================
// THEME EXTENSION FOR CUSTOM COLORS
// ============================================================
extension AppThemeExtension on ThemeData {
  Color get cardBackground => colorScheme.surface;
  Color get scaffoldBackground => scaffoldBackgroundColor;
  Color get appBarBackground => scaffoldBackgroundColor;
  Color get dividerColor => dividerTheme.color ?? Colors.grey;
  Color get disabledColor => colorScheme.onSurface.withValues(alpha: 0.38);

  Color get surfaceLow => colorScheme.surface.withValues(alpha: 0.5);
  Color get surfaceMedium => colorScheme.surface;
  Color get surfaceHigh => colorScheme.surfaceContainerHighest;

  Color get textOnPrimary => colorScheme.onPrimary;
  Color get textOnSecondary => colorScheme.onSecondary;
  Color get textOnSurface => colorScheme.onSurface;
  Color get textOnSurfaceVariant => colorScheme.onSurfaceVariant;
}

// ============================================================
// CONTEXT EXTENSIONS
// ============================================================
extension CardColorExtension on BuildContext {
  Color get cardColor => Theme.of(this).cardTheme.color ?? Theme.of(this).colorScheme.surface;
}

extension SurfaceColorExtension on BuildContext {
  Color get surfaceColor => Theme.of(this).scaffoldBackgroundColor;
}

extension ThemeBrightnessExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}
