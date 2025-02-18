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
    return SingleChildScrollView(
      child: Column(
        children: [
          // Iteración de la lista de tarjetas para mostrarlas en la pantalla
          ...cards.map((card) => _CardType1(card: card)),
          ...cards.map((card) => _CardType2(card: card)),
          ...cards.map((card) => _CardType3(card: card)),
          ...cards.map((card) => _CardType4(card: card)),

        ],
      ),
    );
  }
}
// Definición de la clase _CardType3 que extiende StatelessWidget
class _CardType4 extends StatelessWidget {
  const _CardType4({
    required this.card,
  });

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        // Elevación de la tarjeta
        elevation: card['elevation'],
        child: Stack(
           children: [
            // Imagen de fondo
            Image.network('https://picsum.photos/id/${card['elevation'].toInt()}/600/350',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,),          
            // Alineación del icono a la izquierda
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.secondaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),),
                
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: IconButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

// Definición de la clase _CardType3 que extiende StatelessWidget
class _CardType3 extends StatelessWidget {
  const _CardType3({
    required this.card,
  });

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: colors.secondaryContainer,
        // Elevación de la tarjeta
        elevation: card['elevation'],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Alineación del icono a la izquierda
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(card['label']),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Definición de la clase _CardType2 que extiende StatelessWidget
class _CardType2 extends StatelessWidget {
  const _CardType2({
    required this.card,
  });

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: colors.outline), 
        ),
        // Elevación de la tarjeta
        elevation: card['elevation'],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Alineación del icono a la izquierda
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text('${card['label']} - outline'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({
    required this.card,
  });

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
  }
}
// Fin del snippet de código