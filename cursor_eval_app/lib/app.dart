import 'package:flutter/material.dart';

import 'config/app_environment.dart';
import 'login/page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final suffix = AppEnvironmentManager.config.appNameSuffix;
    return MaterialApp(
      title: 'Cursor Eval App$suffix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF390E53),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF390E53),
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

