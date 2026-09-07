import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/language_provider.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState
    extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();

    final languageProvider = context.read<LanguageProvider>();

    selectedLanguage =
        languageProvider.appLocale.languageCode;
  }

  Future<void> _selectLanguage(String code) async {
    setState(() {
      selectedLanguage = code;
    });

    await context.read<LanguageProvider>().changeLanguage(
          Locale(code),
        );
  }

  void _continue() {
    context.go('/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    final t = AppLocalizations.of(context)!;

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
              // --------------------------------------------------
              // TOP SPACING
              // --------------------------------------------------

              SizedBox(
                height: screenHeight * 0.02,
              ),

              // --------------------------------------------------
              // LOGO
              // --------------------------------------------------

              Container(
                width: (screenWidth * 0.18).clamp(
                  56.0,
                  72.0,
                ),
                height: (screenWidth * 0.18).clamp(
                  56.0,
                  72.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.brandPrimary.withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  AppImages.logo,
                  fit: BoxFit.contain,
                  errorBuilder: (
                    context,
                    error,
                    stackTrace,
                  ) {
                    return const Icon(
                      Icons.eco,
                      color: AppColors.brandPrimary,
                      size: 36,
                    );
                  },
                ),
              )
                  .animate()
                  .fadeIn(
                    duration: 800.ms,
                  )
                  .scale(
                    duration: 800.ms,
                  ),

              // --------------------------------------------------
              // LOGO SPACING
              // --------------------------------------------------

              SizedBox(
                height: screenHeight * 0.02,
              ),

              // --------------------------------------------------
              // APP NAME
              // --------------------------------------------------

              FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
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
              ),

              const SizedBox(height: 6),

              // --------------------------------------------------
              // TAGLINE
              // --------------------------------------------------

              Text(
                'Sri Lanka\'s Green Sharing Community',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: (screenWidth * 0.035).clamp(
                    12.0,
                    16.0,
                  ),
                  color: Colors.grey.shade600,
                ),
              ),

              // --------------------------------------------------
              // SPACING
              // --------------------------------------------------

              SizedBox(
                height: screenHeight * 0.04,
              ),

              // --------------------------------------------------
              // LANGUAGE CARD
              // --------------------------------------------------

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  screenWidth * 0.06,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.03,
                      ),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // --------------------------------------------------
                    // TITLE
                    // --------------------------------------------------

                    Text(
                      t.languageSelectionTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: (screenWidth * 0.05).clamp(
                          18.0,
                          24.0,
                        ),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // --------------------------------------------------
                    // SUBTITLE
                    // --------------------------------------------------

                    Text(
                      t.languageSelectionSubtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: (screenWidth * 0.032).clamp(
                          12.0,
                          15.0,
                        ),
                        color: Colors.grey.shade600,
                      ),
                    ),

                    // --------------------------------------------------
                    // SPACING
                    // --------------------------------------------------

                    SizedBox(
                      height: screenHeight * 0.03,
                    ),

                    // --------------------------------------------------
                    // ENGLISH
                    // --------------------------------------------------

                    _buildLanguageTile(
                      label: 'English',
                      code: 'en',
                      screenWidth: screenWidth,
                    ),

                    SizedBox(
                      height: screenHeight * 0.015,
                    ),

                    // --------------------------------------------------
                    // SINHALA
                    // --------------------------------------------------

                    _buildLanguageTile(
                      label: 'සිංහල',
                      code: 'si',
                      screenWidth: screenWidth,
                    ),

                    SizedBox(
                      height: screenHeight * 0.015,
                    ),

                    // --------------------------------------------------
                    // TAMIL
                    // --------------------------------------------------

                    _buildLanguageTile(
                      label: 'தமிழ்',
                      code: 'ta',
                      screenWidth: screenWidth,
                    ),

                    // --------------------------------------------------
                    // BUTTON SPACING
                    // --------------------------------------------------

                    SizedBox(
                      height: screenHeight * 0.035,
                    ),

                    // --------------------------------------------------
                    // CONTINUE BUTTON
                    // --------------------------------------------------

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _continue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.brandPrimary,
                          elevation: 0,
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(26),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                t.continueButton,
                                maxLines: 1,
                                overflow:
                                    TextOverflow.ellipsis,
                                textAlign:
                                    TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
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

                    // --------------------------------------------------
                    // FOOTER SPACING
                    // --------------------------------------------------

                    SizedBox(
                      height: screenHeight * 0.02,
                    ),

                    // --------------------------------------------------
                    // FOOTER
                    // --------------------------------------------------

                    Center(
                      child: Text(
                        t.languageSelectionFooter,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: (screenWidth * 0.03).clamp(
                            11.0,
                            14.0,
                          ),
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // --------------------------------------------------
              // BOTTOM SPACING
              // --------------------------------------------------

              SizedBox(
                height: screenHeight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // LANGUAGE TILE
  // ================================================================

  Widget _buildLanguageTile({
    required String label,
    required String code,
    required double screenWidth,
  }) {
    final bool isSelected = selectedLanguage == code;

    return GestureDetector(
      onTap: () => _selectLanguage(code),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: (screenWidth * 0.04).clamp(
            12.0,
            20.0,
          ),
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.brandPrimary.withValues(
                  alpha: 0.05,
                )
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
          children: [
            // LANGUAGE NAME

            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: (screenWidth * 0.038).clamp(
                    14.0,
                    18.0,
                  ),
                  fontWeight: isSelected
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: isSelected
                      ? AppColors.brandPrimary
                      : Colors.black87,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // SELECTED INDICATOR

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