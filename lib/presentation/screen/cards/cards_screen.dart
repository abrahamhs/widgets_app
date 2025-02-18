import 'package:flutter/material.dart';

// Lista constante de mapas que contienen la elevación y la etiqueta de cada tarjeta
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
  static const String routeName = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas'),
      ),
      body: const _CardsView(),
    );
  }
}

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

class _CardType1 extends StatelessWidget {
  const _CardType1({required this.card});

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
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

class _CardType2 extends StatelessWidget {
  const _CardType2({required this.card});

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
        elevation: card['elevation'],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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

class _CardType3 extends StatelessWidget {
  const _CardType3({required this.card});

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: colors.secondaryContainer,
        elevation: card['elevation'],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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

/// Un widget sin estado que representa una tarjeta con una imagen y un botón de ícono.
/// 
/// El widget `_CardType4` muestra una imagen obtenida de internet utilizando
/// el valor de `elevation` del mapa `card` proporcionado para generar la URL de la imagen.
/// También incluye un botón de ícono alineado al centro derecho de la tarjeta.
/// 
/// El parámetro `card` es un mapa que contiene las propiedades de la tarjeta, tales como:
/// - `elevation`: El valor de elevación de la tarjeta, utilizado para generar la URL de la imagen.
/// 
/// El widget utiliza el esquema de colores del tema para estilizar el contenedor detrás del botón de ícono.
/// 
/// Ejemplo de uso:
/// 
/// ```dart
/// _CardType4(
///   card: {
///     'elevation': 5,
///   },
/// );
/// ```
class _CardType4 extends StatelessWidget {
  const _CardType4({required this.card});

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: card['elevation'],
        child: Stack(
          children: [
            Image.network(
              'https://picsum.photos/id/${card['elevation'].toInt()}/600/350',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: colors.secondaryContainer.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
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