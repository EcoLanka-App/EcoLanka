import 'package:go_router/go_router.dart';

import '../views/common/splash_screen.dart';
import '../views/common/language_selection_screen.dart';
import '../views/common/onboarding_screen.dart';
import '../views/common/welcome_screen.dart';

import '../views/auth/phone_number_screen.dart';
import '../views/auth/otp_verification_screen.dart';
import '../views/auth/profile_setup_screen.dart';

import '../views/home/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',

  // Always use the initialLocation instead of the browser's current URL.
  overridePlatformDefaultLocation: true,

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/language',
      builder: (context, state) => const LanguageSelectionScreen(),
    ),

    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
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

        return OTPVerificationScreen(
          phoneNumber: phoneNumber,
        );
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