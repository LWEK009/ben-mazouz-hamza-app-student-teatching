import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary Colors - Navy Blue (Bleu Marin)
  static const Color navyBlue = Color(0xFF1B2A4A);
  static const Color navyBlueDark = Color(0xFF0F1A30);
  static const Color navyBlueLight = Color(0xFF2C4270);

  // Secondary Colors - Beige
  static const Color beige = Color(0xFFF5E6CA);
  static const Color beigeDark = Color(0xFFE8D5B0);
  static const Color beigeLight = Color(0xFFFFF8EE);

  // Accent Colors
  static const Color gold = Color(0xFFD4A853);
  static const Color goldLight = Color(0xFFE8C878);
  static const Color emeraldGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFF66BB6A);

  // Text Colors
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textLight = Color(0xFFF5F5F5);
  static const Color textGrey = Color(0xFF757575);

  // Background
  static const Color scaffoldBackground = Color(0xFFFFF8EE);
  static const Color cardBackground = Colors.white;

  // WhatsApp Green
  static const Color whatsappGreen = Color(0xFF25D366);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.navyBlue,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.navyBlue,
        secondary: AppColors.gold,
        surface: AppColors.beigeLight,
        onPrimary: Colors.white,
        onSecondary: AppColors.textDark,
        onSurface: AppColors.textDark,
      ),
      textTheme: GoogleFonts.cairoTextTheme().apply(
        bodyColor: AppColors.textDark,
        displayColor: AppColors.textDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.navyBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.navyBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.cairo(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 4,
        shadowColor: AppColors.navyBlue.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
