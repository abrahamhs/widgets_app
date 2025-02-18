import 'package:flutter/material.dart';

// Definición de una lista constante de mapas que contienen la elevación y la etiqueta de cada tarjeta
const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 5.0, 'label': 'Elevation 6'},
  {'elevation': 7.0, 'label': 'Elevation 7'},
  {'elevation': 8.0, 'label': 'Elevation 8'},
  {'elevation': 9.0, 'label': 'Elevation 9'},
  {'elevation': 10.0, 'label': 'Elevation 10'},
];

class CardsScreen extends StatelessWidget {
  // Definición de una ruta estática para la pantalla
  static const String routeName = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: const Text('Tarjetas'),
      ),
            body: _CardsView(),
    );
  }
}

// Definición de la clase _CardsView que extiende StatelessWidget
class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // ListView.builder para construir una lista de tarjetas
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Card(
                  // Elevación de la tarjeta
                  elevation: card['elevation'],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                          child: Text(card['label']),
                        ),
                      ),
                      // Alineación del icono a la derecha
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                          child: IconButton(
                            icon: const Icon(Icons.more_vert_outlined),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}