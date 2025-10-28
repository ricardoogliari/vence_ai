import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vence_ai/firebase_options.dart';
import 'package:vence_ai/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Resgate Alimentos App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Montserrat',
        bottomAppBarTheme: BottomAppBarThemeData(
          color: Colors.grey.shade200,
        ), // Altere para a fonte que você está usando
      ),
      routerConfig: router,
    );
  }
}
