// Animated Splash Screen with dot animation and timer navigation
import 'dart:async';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _dotsController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _fadeController.forward();

   Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/language');
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 40),
                
                // Center Branding
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.brandPrimary,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentFresh.withValues(alpha: 0.35),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        AppImages.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'EcoLankan',
                      style: TextStyle(
                        color: AppColors.onBrand,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),

                // Bottom Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  child: Column(
                    children: [
                      const Text(
                        'Sri Lanka\'s Green Sharing\nCommunity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.onBrand,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),
                      AnimatedBuilder(
                        animation: _dotsController,
                        builder: (context, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              final double opacity = ((_dotsController.value * 3 - index) % 3)
                                  .clamp(0.2, 1.0);
                              return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.accentFresh.withValues(alpha: opacity),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}