import 'dart:developer';

import 'package:animate_do/animate_do.dart';
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

class AppTutorialScreen extends StatefulWidget {
  static const String routeName = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

   final PageController pageviewController = PageController();
   bool endReached = false;

  @override
  void initState() {
    super.initState();
  pageviewController.addListener(() {
    final page = pageviewController.page ?? 0;
    log('${(pageviewController.page ?? 0) + 1}');
    if(!endReached && page >= (slideList.length - 1.5)){
      setState(() {
        endReached = true;
      });
    }

  });
    
  }
  @override
  void dispose() {
    
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slideList.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption,
              imageUrl: slideData.imageUrl,
            )).toList(),
          ),
          Positioned(
            top: 20,
            right: 20,
            width: 100,
            
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Salir'),
            ),
          ),
          endReached ? Positioned(
            bottom: 20,
            right: 20,
            //width: 100,
            
          child: FadeInRight(
            from: 15,
            delay: const Duration(seconds: 1),
            child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Comenzar'),
              ),
          ),
          ): const SizedBox()
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