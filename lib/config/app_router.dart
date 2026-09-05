// lib/config/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Prefer explicit prefixes for files that might export overlapping symbols:
import '../views/common/splash_screen.dart';
import '../views/common/language_selection_screen.dart' as lang;
import '../views/common/onboarding_screen.dart' as onboarding;
import '../views/common/welcome_screen.dart';

import '../views/auth/phone_number_screen.dart';
import '../views/auth/otp_verification_screen.dart';
import '../views/auth/profile_setup_screen.dart';

import '../views/home/home_screen.dart';

// Root navigator key to safely handle navigation from async callbacks or splash
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',

  // Always use the initialLocation instead of the browser's current URL.
  overridePlatformDefaultLocation: true,

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),

    // Note: use the prefix 'lang.' because we imported language_selection_screen.dart as lang
    GoRoute(
      path: '/language',
      builder: (context, state) => const lang.LanguageSelectionScreen(),
    ),

    // use prefix 'onboarding.' for onboarding screen
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const onboarding.OnboardingScreen(),
    ),

    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),

    GoRoute(
      path: '/phone-number',
      builder: (context, state) => const PhoneNumberScreen(),
    ),

    GoRoute(
      path: '/otp-verification',
      builder: (context, state) {
        final phoneNumber = state.extra as String;
        return OTPVerificationScreen(phoneNumber: phoneNumber);
      },
    ),

    GoRoute(
      path: '/profile-setup',
      builder: (context, state) => const ProfileSetupScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);