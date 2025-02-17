import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String routeName = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            ElevatedButton(
              onPressed: null,
              child: const Text('Elevated Button disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Elevated Button Icon'),
              icon: const Icon(Icons.alarm),
            ),
            //const SizedBox(width: 8),
            FilledButton(
              onPressed:(){},
              child: const Text('Filled Button')),
            FilledButton.icon(
              onPressed:(){},
              icon: const Icon(Icons.backup_rounded),
              label: const Text('Filled Button Icons')),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            //const SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            //const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}