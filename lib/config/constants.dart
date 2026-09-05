// Manages application-wide constants, color schemes, and asset paths
import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (Verdant Clarity Palette)
  static const Color brandPrimary = Color(0xFF2E7D32);     // Deep Forest Green
  static const Color secondary = Color(0xFF66BB6A);       // Vibrant Leaf Green
  static const Color accentFresh = Color(0xFF66BB6A);     // Accent & Active States
  static const Color tertiary = Color(0xFFA5D6A7);       // Soft Sage / Mint
  static const Color colorAction = Color(0xFF1A73E8);     // Standard Action Blue

  // Background & Surface Colors
  static const Color background = Color(0xFFF5F9F5);      // Crisp Tinted Canvas
  static const Color surfaceBg = Color(0xFFFFFFFF);       // Pure White Cards & Panels
  static const Color surfaceSecondaryBg = Color(0xFFF1F8F2); // Tinted Gradient Floor
  static const Color brandTertiary = Color(0xFFFFFFFF);
  
  // Input & Interactive Fills
  static const Color inputBg = Color(0xFFFFFFFF);
  static const Color surfaceHover = Color(0xFFF0F4F0);

  // Text Colors
  static const Color textPrimary = Color(0xFF1F2937);     // Slate 800 Charcoal (High Contrast)
  static const Color textSecondary = Color(0xFF4B5563);   // Slate 600 Muted Metadata
  static const Color textTertiary = Color(0xFF9CA3AF);    // Placeholder & Hint Text
  static const Color onBrand = Color(0xFFFFFFFF);         // White text on primary fill

  // Border & Divider Colors
  static const Color borderPrimary = Color(0xFFE5EFE5);   // Pale Chlorophyll Divider
  static const Color borderSecondary = Color(0xB2E5EFE5); // 70% opacity border
  static const Color borderSelected = Color(0xFF2E7D32);  // Active input / selection border

  // Status Colors
  static const Color colorError = Color(0xFFBA1A1A);
  static const Color colorErrorBg = Color(0xFFFFDAD6);
  static const Color colorWarningBorder = Color(0xFFF9AB00);
  static const Color colorWarningBg = Color(0xFFFEF7E0);
  static const Color colorWarningText = Color(0xFF7A5800);

  // Award / Icon Colors
  static const Color awardGold = Color(0xFFF59E0B);
}

// Manages asset paths for images and logos used across the application
class AppImages {
  static const String logo = 'assets/images/ECOLANKA.png';
  static const String onboarding1 = 'assets/images/screen1.png';
  static const String onboarding2 = 'assets/images/screen2.png';
  static const String onboarding3 = 'assets/images/screen3.png';
}