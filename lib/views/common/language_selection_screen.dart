import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/constants.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'en';

  final Map<String, Map<String, String>> localizedTexts = {
    'en': {
      'title': 'Select Language',
      'subtitle': 'Select your preferred language',
      'btn': 'Continue',
      'footer': 'You can change this later in Settings',
    },
    'si': {
      'title': 'භාෂාව තෝරන්න',
      'subtitle': 'ඔබගේ කැමති භාෂාව තෝරන්න',
      'btn': 'ඉදිරියට යන්න',
      'footer': 'මෙය පසුව Settings හරහා වෙනස් කළ හැක',
    },
    'ta': {
      'title': 'மொழியைத் தேர்ந்தெடுக்கவும்',
      'subtitle': 'உங்கள் விருப்பமான மொழியைத் தேர்ந்தெடுக்கவும்',
      'btn': 'தொடரவும்',
      'footer': 'அமைப்புகளில் இதை பின்னர் மாற்றலாம்',
    },
  };

  Future<void> _saveLanguageAndProceed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', selectedLanguage);

    if (!mounted) return;

    context.go('/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    final currentTexts = localizedTexts[selectedLanguage]!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),

              Container(
                width: screenWidth * 0.18,
                height: screenWidth * 0.18,
                constraints: const BoxConstraints(
                  maxWidth: 72,
                  maxHeight: 72,
                ),
                decoration: BoxDecoration(
                  color: AppColors.brandPrimary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  AppImages.logo,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.eco,
                    color: AppColors.brandPrimary,
                    size: 36,
                  ),
                ),
              ).animate().fadeIn(duration: 800.ms).scale(
                    duration: 800.ms,
                  ),

              SizedBox(height: screenHeight * 0.02),

              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'Eco',
                      style: TextStyle(
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    TextSpan(
                      text: 'Lanka',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'Sri Lanka\'s Green Sharing Community',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey.shade600,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.06),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentTexts['title']!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      currentTexts['subtitle']!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    _buildLanguageTile(
                      'English',
                      'en',
                      screenWidth,
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    _buildLanguageTile(
                      'සිංහල',
                      'si',
                      screenWidth,
                    ),

                    SizedBox(height: screenHeight * 0.015),

                    _buildLanguageTile(
                      'தமிழ்',
                      'ta',
                      screenWidth,
                    ),

                    SizedBox(height: screenHeight * 0.035),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _saveLanguageAndProceed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentTexts['btn']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Center(
                      child: Text(
                        currentTexts['footer']!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageTile(
    String label,
    String code,
    double screenWidth,
  ) {
    final bool isSelected = selectedLanguage == code;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = code;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.brandPrimary.withValues(alpha: 0.05)
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.brandPrimary
                : Colors.grey.shade300,
            width: isSelected ? 2.0 : 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.038,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? AppColors.brandPrimary
                    : Colors.black87,
              ),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.brandPrimary
                      : Colors.grey.shade400,
                  width: isSelected ? 7 : 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}