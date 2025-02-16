
import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
  Colors.lime,
  Colors.amber,
  Colors.brown,
  Colors.grey,
    
];

class AppTheme {
  final int selectedColorIndex;

   AppTheme({
    this.selectedColorIndex = 0
    }):assert(selectedColorIndex >= 0, 'selectedColorIndex must be greater than 0'),
    assert(selectedColorIndex < colorList.length, 'selectedColorIndex must be less than ${colorList.length - 1}');
    ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColorIndex],
    );
  
}
