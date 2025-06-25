import 'package:flutter/material.dart';
import 'screens/agenda_screen.dart';
import 'theme/app_theme.dart';

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
      theme: AppTheme.getTheme(),
      home: const AgendaScreen(),
    );
  }
}
