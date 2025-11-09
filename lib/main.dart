import 'package:flutter/material.dart';
import 'package:gestion_des_etudiants_flut/Authentification/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // remove the debug banner
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
