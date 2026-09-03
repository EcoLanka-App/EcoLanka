import 'package:flutter/material.dart';
import '../../config/constants.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _onContinueWithPhone(BuildContext context) {
    context.go('/phone-number');
  }
  void _openTerms(BuildContext context) {
    // Open Terms
  }

  void _openPrivacyPolicy(BuildContext context) {
    // Open Privacy Policy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top / Center Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo with Glow Effect
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.brandPrimary,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentFresh.withValues(alpha: 0.35),
                            blurRadius: 22,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        AppImages.logo,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.eco_rounded,
                            size: 36,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Title
                    const Text(
                      'Join the Movement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Subtitle
                    Text(
                      'Share, request, and reduce waste —\ntogether.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () => _onContinueWithPhone(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brandPrimary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: const Text(
                        'Continue with Phone Number',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Footer Terms & Privacy Link
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'By continuing, you agree to our ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _openTerms(context),
                        child: Text(
                          'Terms',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        ' & ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _openPrivacyPolicy(context),
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}