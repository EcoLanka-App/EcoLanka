// Dynamic Language selection screen supporting English, Sinhala, and Tamil texts
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import 'package:go_router/go_router.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'en';

  // Dynamic texts according to selected language
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

  @override
  Widget build(BuildContext context) {
    final currentTexts = localizedTexts[selectedLanguage]!;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A4D32),
              AppColors.brandPrimary,
              Color(0xFF043823),
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Top Branding
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColors.brandPrimary,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentFresh.withValues(alpha: 0.35),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Image.asset(
                      AppImages.logo,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.eco,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'EcoLankan',
                    style: TextStyle(
                      color: AppColors.onBrand,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Bottom Language Selector Sheet
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Dynamic Title
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        currentTexts['title']!,
                        key: ValueKey(currentTexts['title']),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Dynamic Subtitle
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        currentTexts['subtitle']!,
                        key: ValueKey(currentTexts['subtitle']),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Language Option Tiles
                    _buildLanguageTile('English', 'en'),
                    const SizedBox(height: 12),
                    _buildLanguageTile('සිංහල', 'si'),
                    const SizedBox(height: 12),
                    _buildLanguageTile('தமிழ்', 'ta'),

                    const SizedBox(height: 24),

                    // Continue Button with Onboarding Navigation
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
  context.go('/onboarding');
},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandPrimary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
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

                    const SizedBox(height: 16),

                    // Dynamic Footer
                    Center(
                      child: Text(
                        currentTexts['footer']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageTile(String label, String code) {
    final bool isSelected = selectedLanguage == code;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = code;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.brandPrimary.withValues(alpha: 0.05)
              : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.brandPrimary : Colors.grey.shade300,
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
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.brandPrimary : Colors.black87,
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