import 'package:flutter/material.dart';

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
      
    );
  }
}
