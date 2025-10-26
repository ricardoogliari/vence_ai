import 'package:flutter/material.dart';
import 'package:vence_ai/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Resgate Alimentos App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat', // Altere para a fonte que você está usando
      ),
      routerConfig: router,
    );
  }
}
