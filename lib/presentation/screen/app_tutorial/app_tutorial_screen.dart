import 'package:flutter/material.dart';

class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
} 

final List<SlideInfo> slideList = [
  SlideInfo(
    title: 'Welcome to App',
    caption: 'This is a simple app tutorial',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'App Features',
    caption: 'This app has many features',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Get Started',
    caption: 'Let\'s get started',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String routeName = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slideList.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption,
              imageUrl: slideData.imageUrl,
            )).toList(),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Salir'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
    
  const _Slide({ 
    required this.title, 
    required this.caption, 
    required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Text(caption, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          Image.asset(imageUrl),
        ],
      ),
    );
  }
}