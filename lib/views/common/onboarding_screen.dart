// lib/views/common/onboarding_screen.dart
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'badge': 'COMMUNITY FIRST',
      'title': 'Welcome to EcoLankan',
      'description':
          'Join Sri Lanka\'s first green sharing community. Share unused items, reduce waste, and protect our island.',
      'image': AppImages.onboarding1,
      'icon': Icons.eco_rounded,
    },
    {
      'badge': 'LOCAL SHARING',
      'title': 'Share & Borrow Easily',
      'description':
          'Save money and help neighbors by sharing tools, books, and household goods within your trusted local area.',
      'image': AppImages.onboarding2,
      'icon': Icons.handshake_rounded,
    },
    {
      'badge': 'GREEN IMPACT',
      'title': 'Build a Greener Future',
      'description':
          'Track your environmental impact, earn eco-points, and contribute to a sustainable Sri Lankan lifestyle.',
      'image': AppImages.onboarding3,
      'icon': Icons.forest_rounded,
    },
  ];

  void _onNext() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToWelcome();
    }
  }

  void _navigateToWelcome() {
    context.go('/welcome');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final textScale = mq.textScaleFactor.clamp(1.0, 1.3);
    final screenWidth = mq.size.width;
    final screenHeight = mq.size.height;

    // Derive sizes relative to screen for responsiveness
    final double heroImageHeight = (screenHeight * 0.28).clamp(140.0, 300.0);
    final double titleFontSize = (screenWidth * 0.055).clamp(18.0, 28.0) * textScale;
    final double descFontSize = (screenWidth * 0.035).clamp(13.0, 16.0) * textScale;
    final double badgeFontSize = (screenWidth * 0.030).clamp(11.0, 13.0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              // PageView fills available area but leaves room for top/bottom controls.
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.07,
                    vertical: constraints.maxHeight * 0.04,
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) => setState(() => _currentIndex = index),
                    itemCount: _onboardingData.length,
                    itemBuilder: (context, index) {
                      final item = _onboardingData[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image area (responsive height)
                          SizedBox(
                            height: heroImageHeight,
                            child: Image.asset(
                              item['image'] as String,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: heroImageHeight * 0.65,
                                  height: heroImageHeight * 0.65,
                                  decoration: BoxDecoration(
                                    color: AppColors.brandPrimary.withValues(alpha: 0.08),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    item['icon'] as IconData,
                                    size: heroImageHeight * 0.45,
                                    color: AppColors.brandPrimary,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.04),

                          // Badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.brandPrimary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item['badge'] as String,
                              style: TextStyle(
                                color: AppColors.brandPrimary,
                                fontSize: badgeFontSize,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),

                          // Title
                          Text(
                            item['title'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.015),

                          // Description
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02),
                            child: Text(
                              item['description'] as String,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: descFontSize,
                                height: 1.5,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              // Top indicators & skip button
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: constraints.maxHeight * 0.02, left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Page indicators (left)
                      Row(
                        children: List.generate(
                          _onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(right: 6),
                            height: 8,
                            width: _currentIndex == index ? 24 : 8,
                            decoration: BoxDecoration(
                              color: _currentIndex == index ? AppColors.brandPrimary : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),

                      // Skip (right)
                      if (_currentIndex < _onboardingData.length - 1)
                        TextButton(
                          onPressed: _navigateToWelcome,
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: (constraints.maxWidth * 0.037).clamp(12.0, 16.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Bottom CTA: Next / Get Started, centered and slightly above bottom
              Align(
                alignment: const Alignment(0, 0.95),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.06),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // CTA button
                      SizedBox(
                        width: double.infinity,
                        height: (constraints.maxHeight * 0.065).clamp(48.0, 60.0),
                        child: ElevatedButton(
                          onPressed: _onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.brandPrimary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _currentIndex == _onboardingData.length - 1 ? 'Get Started' : 'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: (constraints.maxWidth * 0.04).clamp(14.0, 18.0),
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

                      SizedBox(height: constraints.maxHeight * 0.015),

                      // Optional small dots indicator row (center)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          _onboardingData.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentIndex == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentIndex == index ? AppColors.brandPrimary : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}