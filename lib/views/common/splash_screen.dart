import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../config/constants.dart';
import '../../config/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _startStartupFlow();
  }

  Future<void> _startStartupFlow() async {
    await Future.delayed(const Duration(milliseconds: 4500));
    _navigateToLanguage();
  }

  void _navigateToLanguage() {
    if (!mounted || _hasNavigated) return;
    _hasNavigated = true;

    GoRouter.of(rootNavigatorKey.currentContext!).go('/language');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: screenHeight * 0.02),

              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: _navigateToLanguage,
                    child: Container(
                      width: screenWidth * 0.45,
                      height: screenWidth * 0.45,
                      constraints: const BoxConstraints(
                        maxWidth: 180,
                        maxHeight: 180,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        AppImages.logo,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.eco,
                          color: Color(0xFF2E7D32),
                          size: 64,
                        ),
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 1200.ms)
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.0, 1.0),
                      duration: 1200.ms,
                      curve: Curves.easeOutBack,
                    ),
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        minHeight: 4,
                        backgroundColor: Color(0xFFE8F5E9),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF2E7D32),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                        delay: 400.ms,
                        duration: 800.ms,
                      ),

                  SizedBox(height: screenHeight * 0.03),

                  Text(
                    'Copyright © 2026 EcoLanka Community (Pvt) Ltd.\n'
                    'All Rights Reserved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                      height: 1.4,
                    ),
                  ).animate().fadeIn(
                        delay: 600.ms,
                        duration: 800.ms,
                      ),

                  SizedBox(height: screenHeight * 0.015),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}