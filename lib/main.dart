import 'package:flutter/material.dart';
import 'package:macarrierepro/pages/splash/splash.dart';
import 'package:macarrierepro/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma carriere pro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: principale),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}