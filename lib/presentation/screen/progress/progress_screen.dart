import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String routeName = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 20),
            Text('Circular Progress Indicator', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeWidth: 3,
              backgroundColor: Colors.black38,),
            SizedBox(height: 20),
            Text('Linear Progress Indicator', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            LinearProgressIndicator(),
            SizedBox(height: 40),
            Text('Progress Indicator controlado ', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            _ControlledProgressIndicator(),
            SizedBox(height: 20),
         
          ],
        ),
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value * 2) / 100;
      }).takeWhile((value) => value <= 1),
      builder: (context, snapshot) {
        final double progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 3,
                    backgroundColor: Colors.black12,
                  ),
                  const SizedBox(width: 20),
                  Text('${(progressValue * 100).toInt()}%'),
                ],
              ),
              const SizedBox(height: 30),
              LinearProgressIndicator(
                value: progressValue,
              ),
            ],
          ),
          
          );
      }
    );
  }
}