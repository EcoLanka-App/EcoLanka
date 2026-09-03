// Main entry point for the ECOLANKA application
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'config/app_router.dart';
import 'providers/user_provider.dart';
import 'controllers/item_controller.dart';

void main() {
  // Initialize the application with multiple providers for state management
  runApp(
    MultiProvider(
      providers: [
        // UserProvider for managing user district/location state
        ChangeNotifierProvider(create: (_) => UserProvider()),
        
        // ItemController for managing items data and operations
        ChangeNotifierProvider(create: (_) => ItemController()),
      ],
      child: const EcoLankaApp(),
    ),
  );
}

class EcoLankaApp extends StatelessWidget {
  const EcoLankaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ECOLANKA',
      debugShowCheckedModeBanner: false,
      
      // Apply custom theme
      theme: AppTheme.lightTheme,
      
      // Use GoRouter for navigation management
      routerConfig: appRouter,
    );
  }
}