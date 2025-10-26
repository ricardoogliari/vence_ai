import 'package:flutter/material.dart';
import 'package:vence_ai/pages/offers.dart';
import 'package:vence_ai/pages/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resgate Alimentos App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat', // Altere para a fonte que você está usando
      ),
      home: const WelcomeScreen(),
    );
  }
}
