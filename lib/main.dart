import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:imusix/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iMusix',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffffffff),
        // primarySwatch: Colors.purple,
      ),
      home: AnimatedSplashScreen(
          duration: 1500,
          splash: 'assets/logo/logo-01.png',
          splashIconSize: 150,
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white));
  }
}