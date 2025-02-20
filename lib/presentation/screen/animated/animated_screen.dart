import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  static const String routeName = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 150.0;
  double _height = 150.0;
  double _borderRadius = 20.0;
  Color randomColor = Colors.blue;

  void changeShape() {
    // crear random y evitar que el valor sea menos a 0
    final random = Random();
      
    _width = _width <= 0.0 ? 120 : random.nextDouble() * 400;
    _height =  _height <= 0.0 ? 120 : random.nextDouble() * 400;
    _borderRadius = _borderRadius <= 0.0 ? 50 : random.nextDouble() * 100;
    randomColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
    );
      setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: randomColor,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          changeShape();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}