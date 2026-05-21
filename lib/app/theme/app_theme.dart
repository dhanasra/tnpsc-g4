import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // ═══════════════════════════════════════════════════════════════════════════
  // BRAND COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  // Primary Brand → Modern Royal Indigo
  static const Color _seed = Color.fromARGB(255, 30, 9, 79);

  // Accent
  static const Color _accent = Color.fromARGB(255, 90, 60, 158) ;

  // Success / Warning / Error
  static const Color _success = Color(0xFF22C55E);
  static const Color _warning = Color(0xFFF59E0B);
  static const Color _error = Color(0xFFEF4444);

  // ═══════════════════════════════════════════════════════════════════════════
  // LIGHT SURFACES
  // ═══════════════════════════════════════════════════════════════════════════

  static const Color _lightBackground = Color(0xFFF6F7FB);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightSurface2 = Color(0xFFF1F3FA);
  static const Color _lightSurface3 = Color(0xFFE8EBF5);
  static const Color _lightBorder = Color(0xFFDCE1F0);

  // ═══════════════════════════════════════════════════════════════════════════
  // DARK SURFACES
  // ═══════════════════════════════════════════════════════════════════════════

  static const Color _darkBackground = Color(0xFF0B1020);
  static const Color _darkSurface = Color(0xFF12182B);
  static const Color _darkSurface2 = Color(0xFF1A2238);
  static const Color _darkSurface3 = Color(0xFF232D48);
  static const Color _darkBorder = Color(0xFF313B58);

  // ═══════════════════════════════════════════════════════════════════════════
  // TYPOGRAPHY
  // ═══════════════════════════════════════════════════════════════════════════

  static final TextTheme _textTheme = TextTheme(
    // Display
    displayLarge: GoogleFonts.poppins(
      fontSize: 57,
      fontWeight: FontWeight.w800,
      letterSpacing: -2,
      height: 1.1,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      letterSpacing: -1.5,
      height: 1.15,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      letterSpacing: -1,
      height: 1.2,
    ),

    // Headlines
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.8,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
    ),

    // Titles
    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),

    // Body
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.55,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),

    // Labels
    labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // LIGHT THEME
  // ═══════════════════════════════════════════════════════════════════════════

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.light,

      primary: _seed,
      secondary: _accent,

      surface: _lightSurface,
      surfaceContainer: _lightSurface2,
      surfaceContainerHigh: _lightSurface3,

      error: _error,
    ),

    scaffoldBackgroundColor: _lightBackground,
    textTheme: _textTheme,

    // ───────────────── APP BAR ─────────────────

    appBarTheme: AppBarTheme(
      backgroundColor: _lightBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: _textTheme.titleLarge?.copyWith(
        color: const Color(0xFF111827),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF111827),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),

    // ───────────────── CARDS ─────────────────

    cardTheme: CardThemeData(
      color: _lightSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
          color: _lightBorder,
          width: 1,
        ),
      ),
    ),

    // ───────────────── BUTTONS ─────────────────

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _seed,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 56),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _seed,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _seed,
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(
          color: _lightBorder,
          width: 1.4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _seed,
        textStyle: _textTheme.labelLarge,
      ),
    ),

    // ───────────────── INPUT ─────────────────

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightSurface2,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),

      hintStyle: _textTheme.bodyMedium?.copyWith(
        color: const Color(0xFF94A3B8),
      ),

      labelStyle: _textTheme.bodyMedium,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: _lightBorder,
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: _seed,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: _error,
          width: 1.2,
        ),
      ),
    ),

    // ───────────────── NAVIGATION BAR ─────────────────

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      height: 74,

      indicatorColor: _seed.withOpacity(0.12),

      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),

      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: _seed,
            size: 24,
          );
        }

        return const IconThemeData(
          color: Color(0xFF94A3B8),
          size: 24,
        );
      }),

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _textTheme.labelSmall?.copyWith(
            color: _seed,
            fontWeight: FontWeight.w700,
          );
        }

        return _textTheme.labelSmall?.copyWith(
          color: const Color(0xFF94A3B8),
        );
      }),
    ),

    // ───────────────── DIALOG ─────────────────

    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
    ),

    // ───────────────── BOTTOM SHEET ─────────────────

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
    ),

    // ───────────────── FAB ─────────────────

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _seed,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    // ───────────────── SNACKBAR ─────────────────

    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFF111827),
      contentTextStyle: _textTheme.bodyMedium?.copyWith(
        color: Colors.white,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
    ),

    // ───────────────── CHIP ─────────────────

    chipTheme: ChipThemeData(
      backgroundColor: _lightSurface2,
      side: const BorderSide(
        color: _lightBorder,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      labelStyle: _textTheme.labelMedium!,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
    ),

    // ───────────────── DIVIDER ─────────────────

    dividerTheme: const DividerThemeData(
      color: _lightBorder,
      thickness: 1,
    ),

    // ───────────────── LIST TILE ─────────────────

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      titleTextStyle: _textTheme.titleSmall,
      subtitleTextStyle: _textTheme.bodySmall,
    ),

    // ───────────────── SWITCH ─────────────────

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.white;
      }),

      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _seed;
        }
        return const Color(0xFFCBD5E1);
      }),

      trackOutlineColor: WidgetStateProperty.all(
        Colors.transparent,
      ),
    ),

    // ───────────────── PROGRESS ─────────────────

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: _seed,
      linearTrackColor: _lightSurface3,
      linearMinHeight: 6,
      borderRadius: BorderRadius.circular(10),
    ),
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // DARK THEME
  // ═══════════════════════════════════════════════════════════════════════════

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: Brightness.dark,

      primary: const Color(0xFF818CFF),
      secondary: const Color(0xFFA78BFA),

      surface: _darkSurface,
      surfaceContainer: _darkSurface2,
      surfaceContainerHigh: _darkSurface3,

      error: const Color(0xFFF87171),
    ),

    scaffoldBackgroundColor: _darkBackground,
    textTheme: _textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),

    // ───────────────── APP BAR ─────────────────

    appBarTheme: AppBarTheme(
      backgroundColor: _darkBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,

      titleTextStyle: _textTheme.titleLarge?.copyWith(
        color: Colors.white,
      ),

      iconTheme: const IconThemeData(
        color: Colors.white,
      ),

      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    // ───────────────── CARDS ─────────────────

    cardTheme: CardThemeData(
      color: _darkSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
          color: _darkBorder,
          width: 1,
        ),
      ),
    ),

    // ───────────────── BUTTONS ─────────────────

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF818CFF),
        foregroundColor: Colors.white,
        elevation: 0,

        minimumSize: const Size(double.infinity, 56),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,

        minimumSize: const Size(double.infinity, 56),

        side: const BorderSide(
          color: _darkBorder,
          width: 1.2,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    // ───────────────── INPUT ─────────────────

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurface2,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),

      hintStyle: _textTheme.bodyMedium?.copyWith(
        color: Colors.white.withOpacity(0.35),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: _darkBorder,
          width: 1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFF818CFF),
          width: 1.5,
        ),
      ),
    ),

    // ───────────────── NAVIGATION BAR ─────────────────

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: _darkSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      height: 74,

      indicatorColor: const Color(0xFF818CFF).withOpacity(0.18),

      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),

      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: Color(0xFF818CFF),
            size: 24,
          );
        }

        return IconThemeData(
          color: Colors.white.withOpacity(0.4),
          size: 24,
        );
      }),

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _textTheme.labelSmall?.copyWith(
            color: const Color(0xFF818CFF),
            fontWeight: FontWeight.w700,
          );
        }

        return _textTheme.labelSmall?.copyWith(
          color: Colors.white.withOpacity(0.45),
        );
      }),
    ),

    // ───────────────── FAB ─────────────────

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF818CFF),
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    // ───────────────── SNACKBAR ─────────────────

    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkSurface3,
      contentTextStyle: _textTheme.bodyMedium?.copyWith(
        color: Colors.white,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
    ),

    // ───────────────── DIVIDER ─────────────────

    dividerTheme: const DividerThemeData(
      color: _darkBorder,
      thickness: 1,
    ),

    // ───────────────── CHIP ─────────────────

    chipTheme: ChipThemeData(
      backgroundColor: _darkSurface2,
      side: const BorderSide(
        color: _darkBorder,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      labelStyle: _textTheme.labelMedium!.copyWith(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
    ),

    // ───────────────── PROGRESS ─────────────────

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: const Color(0xFF818CFF),
      linearTrackColor: _darkSurface3,
      linearMinHeight: 6,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}