// Main entry point for the ECOLANKA application
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'controllers/item_controller.dart';
import 'config/app_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}