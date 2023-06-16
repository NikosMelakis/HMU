import 'package:exe02/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHR',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(), // Redirect to splash screen
    );
  }
}
