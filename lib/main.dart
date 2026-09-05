// Main entry point for the ECOLANKA application.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_router.dart';
import 'config/theme.dart';
import 'controllers/item_controller.dart';
import 'providers/user_provider.dart';

void main() {
  // Ensure Flutter bindings are initialized before starting the application.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        // Manages user-related state such as district and location.
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),

        // Manages item data and item-related operations.
        ChangeNotifierProvider(
          create: (_) => ItemController(),
        ),
      ],
      child: const EcoLankaApp(),
    ),
  );
}

/// Root widget of the ECOLANKA application.
class EcoLankaApp extends StatelessWidget {
  const EcoLankaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EcoLanka',
      debugShowCheckedModeBanner: false,

      // Apply the application's global theme.
      theme: AppTheme.lightTheme,

      // Configure application navigation using GoRouter.
      routerConfig: appRouter,

      // Constrain width on web browsers to mimic a mobile phone frame
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: Scaffold(
            backgroundColor: const Color(0xFF1F2937), // Dark background framing the mobile view
            body: Center(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 420, // Maximum width for mobile layout simulation
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0), // Optional rounded corners for the frame
                  child: child!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}