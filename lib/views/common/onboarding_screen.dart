
// lib/views/common/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/constants.dart';
import '../../l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  // ============================================================
  // ONBOARDING DATA
  // ============================================================

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'badgeKey': 'badge1',
      'titleKey': 'title1',
      'descriptionKey': 'description1',
      'image': AppImages.onboarding1,
      'icon': Icons.eco_rounded,
    },
    {
      'badgeKey': 'badge2',
      'titleKey': 'title2',
      'descriptionKey': 'description2',
      'image': AppImages.onboarding2,
      'icon': Icons.handshake_rounded,
    },
    {
      'badgeKey': 'badge3',
      'titleKey': 'title3',
      'descriptionKey': 'description3',
      'image': AppImages.onboarding3,
      'icon': Icons.forest_rounded,
    },
  ];

  // ============================================================
  // GET LOCALIZED TEXT
  // ============================================================

  String _getText(
    AppLocalizations t,
    String key,
  ) {
    switch (key) {
      case 'badge1':
        return t.badge1;
      case 'title1':
        return t.title1;
      case 'description1':
        return t.description1;

      case 'badge2':
        return t.badge2;
      case 'title2':
        return t.title2;
      case 'description2':
        return t.description2;

      case 'badge3':
        return t.badge3;
      case 'title3':
        return t.title3;
      case 'description3':
        return t.description3;

      default:
        return '';
    }
  }

  // ============================================================
  // NEXT BUTTON
  // ============================================================

  void _onNext() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToWelcome();
    }
  }

  // ============================================================
  // NAVIGATE TO WELCOME
  // ============================================================

  void _navigateToWelcome() {
    if (!mounted) return;

    context.go('/welcome');
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // ==========================================================
    // RESPONSIVE VALUES
    // ==========================================================

    final horizontalPadding =
        (screenWidth * 0.07).clamp(16.0, 40.0);

    final topPadding =
        (screenHeight * 0.025).clamp(12.0, 28.0);

    final bottomPadding =
        (screenHeight * 0.025).clamp(12.0, 28.0);

    final heroImageHeight =
        (screenHeight * 0.28).clamp(140.0, 300.0);

    final titleFontSize =
        (screenWidth * 0.055).clamp(19.0, 28.0);

    final descriptionFontSize =
        (screenWidth * 0.035).clamp(13.0, 17.0);

    final badgeFontSize =
        (screenWidth * 0.030).clamp(10.0, 13.0);

    final buttonFontSize =
        (screenWidth * 0.04).clamp(14.0, 18.0);

    final skipFontSize =
        (screenWidth * 0.037).clamp(12.0, 16.0);

    final buttonHeight =
        (screenHeight * 0.065).clamp(48.0, 60.0);

    // ==========================================================
    // SCREEN
    // ==========================================================

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // =================================================
                // PAGE VIEW
                // =================================================

                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      top: topPadding + 35,
                      bottom: bottomPadding + 85,
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _onboardingData.length,
                      onPageChanged: (index) {
                        if (!mounted) return;

                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = _onboardingData[index];

                        final badge = _getText(
                          t,
                          item['badgeKey'] as String,
                        );

                        final title = _getText(
                          t,
                          item['titleKey'] as String,
                        );

                        final description = _getText(
                          t,
                          item['descriptionKey'] as String,
                        );

                        return Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            // =====================================
                            // IMAGE
                            // =====================================

                            SizedBox(
                              height: heroImageHeight,
                              child: Image.asset(
                                item['image'] as String,
                                fit: BoxFit.contain,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    width:
                                        heroImageHeight * 0.65,
                                    height:
                                        heroImageHeight * 0.65,
                                    decoration: BoxDecoration(
                                      color: AppColors.brandPrimary
                                          .withValues(alpha: 0.08),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      item['icon'] as IconData,
                                      size:
                                          heroImageHeight * 0.45,
                                      color:
                                          AppColors.brandPrimary,
                                    ),
                                  );
                                },
                              ),
                            ),

                            // =====================================
                            // IMAGE → BADGE
                            // =====================================

                            SizedBox(
                              height:
                                  (constraints.maxHeight * 0.035)
                                      .clamp(12.0, 28.0),
                            ),

                            // =====================================
                            // BADGE
                            // =====================================

                            Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    constraints.maxWidth * 0.85,
                              ),
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.brandPrimary
                                    .withValues(alpha: 0.10),
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),
                              child: Text(
                                badge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      AppColors.brandPrimary,
                                  fontSize: badgeFontSize,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),

                            // =====================================
                            // BADGE → TITLE
                            // =====================================

                            SizedBox(
                              height:
                                  (constraints.maxHeight * 0.018)
                                      .clamp(8.0, 18.0),
                            ),

                            // =====================================
                            // TITLE
                            // =====================================

                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    constraints.maxWidth * 0.92,
                              ),
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  height: 1.2,
                                ),
                              ),
                            ),

                            // =====================================
                            // TITLE → DESCRIPTION
                            // =====================================

                            SizedBox(
                              height:
                                  (constraints.maxHeight * 0.015)
                                      .clamp(8.0, 16.0),
                            ),

                            // =====================================
                            // DESCRIPTION
                            // =====================================

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    constraints.maxWidth * 0.02,
                              ),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      constraints.maxWidth * 0.90,
                                ),
                                child: Text(
                                  description,
                                  textAlign: TextAlign.center,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize:
                                        descriptionFontSize,
                                    height: 1.5,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // =================================================
                // TOP SKIP BUTTON
                // =================================================

                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top:
                          (constraints.maxHeight * 0.018)
                              .clamp(8.0, 20.0),
                      right: horizontalPadding,
                    ),
                    child: _currentIndex <
                            _onboardingData.length - 1
                        ? TextButton(
                            onPressed: _navigateToWelcome,
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                            ),
                            child: Text(
                              t.skip,
                              maxLines: 1,
                              overflow:
                                  TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: skipFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),

                // =================================================
                // BOTTOM CTA + SINGLE PAGE INDICATOR
                // =================================================

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      bottom:
                          (constraints.maxHeight * 0.018)
                              .clamp(8.0, 18.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // =========================================
                        // BUTTON
                        // =========================================

                        SizedBox(
                          width: double.infinity,
                          height: buttonHeight,
                          child: ElevatedButton(
                            onPressed: _onNext,
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColors.brandPrimary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    _currentIndex ==
                                            _onboardingData
                                                    .length -
                                                1
                                        ? t.getStarted
                                        : t.next,
                                    maxLines: 1,
                                    overflow:
                                        TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: buttonFontSize,
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

                        // =========================================
                        // SINGLE PAGE INDICATOR
                        // =========================================

                        SizedBox(
                          height:
                              (constraints.maxHeight * 0.015)
                                  .clamp(6.0, 14.0),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            _onboardingData.length,
                            (index) {
                              return AnimatedContainer(
                                duration:
                                    const Duration(
                                  milliseconds: 200,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width:
                                    _currentIndex == index
                                        ? 12
                                        : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color:
                                      _currentIndex == index
                                          ? AppColors
                                              .brandPrimary
                                          : Colors
                                              .grey
                                              .shade300,
                                  borderRadius:
                                      BorderRadius.circular(4),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
