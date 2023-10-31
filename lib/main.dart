import 'package:flutter/material.dart';
import 'package:news_application/ui/screens/home/home_screen.dart';
import 'package:news_application/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

