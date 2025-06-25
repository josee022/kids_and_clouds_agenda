import 'package:flutter/material.dart';
import 'screens/agenda_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids&Clouds Agenda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3), // Azul principal
        ),
        useMaterial3: true,
      ),
      home: const AgendaScreen(),
    );
  }
}
