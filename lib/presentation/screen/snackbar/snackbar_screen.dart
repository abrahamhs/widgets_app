import 'package:flutter/material.dart';

// Definición de la clase SnackbarScreen que extiende StatelessWidget
class SnackbarScreen extends StatelessWidget {
  // Nombre de la ruta para la navegación
  static const String routeName = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de la aplicación con el título
      appBar: AppBar(
        title: Text('SnackBar y Dialog'),
      ),
      // Cuerpo de la pantalla centrado
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botón para mostrar un Dialog
            FilledButton.tonal(
              onPressed: () {
               showAboutDialog(
                context: context,
                applicationName: 'SnackBar y Dialog',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.info_outline),
                children: [
                  const Text('SnackBar y Dialog son indicadores en pantalla'),
                  const Text('SnackBar es temporal y Dialog es permanente'),
                ],
               );
              },
              child: const Text('Mostrar AboutDialog'),
            ),
            SizedBox(height: 20), // Espacio entre los botones
             FilledButton.tonal(
              onPressed: () {
                // Muestra un AlertDialog cuando se presiona el botón
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Dialog de ejemplo'),
                      content: const Text('Contenido del dialog'),
                      actions: [
                        // Botón para cerrar el Dialog
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Mostrar Dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: _ShowSnackbar(),
    );
  }
}

class _ShowSnackbar extends StatelessWidget {
  const _ShowSnackbar();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
            label: const Text('Mostrar SnackBar'),
    
            onPressed: () {
            // Limpia todos los SnackBars actuales
            ScaffoldMessenger.of(context).clearSnackBars();
            // Muestra un SnackBar cuando se presiona el botón
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              content: const Text('SnackBar de ejemplo'),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: 'Cerrar',
                onPressed: () {
                // Oculta el SnackBar actual
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
              ),
            );
            },
          icon:  const Icon(Icons.message),
          );
  }
}