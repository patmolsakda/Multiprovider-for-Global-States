import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/student_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    // ── MultiProvider wraps the entire app ──────────────────────────────
    MultiProvider(
      providers: [
        // 1️⃣  Auth State
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // 2️⃣  Student State
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        // 3️⃣  Theme State
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch ThemeProvider to rebuild when theme changes
    final themeProvider = context.watch<ThemeProvider>();
    // Watch AuthProvider to decide which screen to show
    final auth = context.watch<AuthProvider>();

    return MaterialApp(
      title: 'Student Management',
      debugShowCheckedModeBanner: false,
      // ── Theme State applied here ──────────────────────────────────────
      theme: ThemeProvider.lightTheme,
      darkTheme: ThemeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      // ── Auth State controls routing ───────────────────────────────────
      home: auth.isLoggedIn ? const HomeScreen() : const LoginScreen(),
    );
  }
}