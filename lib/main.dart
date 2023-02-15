import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'MainScreen.dart';

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
      title: 'Ride Sharing',
      home: AnimatedSplashScreen(
        splash: 'assets/images/My_Road_Logo.png',
        splashIconSize: 190,
        nextScreen: const MainScreen(),
        duration: 5000,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
      ),
    );
  }
}
