import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart'; // ✅ Importação da tela de cadastro
import 'screens/dashboard_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/ranking_screen.dart';

void main() {
  runApp(const LearnHeroApp());
}

class LearnHeroApp extends StatelessWidget {
  const LearnHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnHero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/ranking': (context) => const RankingScreen(),
      },
    );
  }
}
