import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screen/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screen/cards/cards_screen.dart';

import 'config/theme/app_theme.dart';
import 'presentation/screen/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColorIndex: 5).getTheme(),
      home: const HomeScreen(),  
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },
      
    );
  }
}
