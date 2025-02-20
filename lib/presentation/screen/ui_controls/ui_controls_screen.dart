import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String routeName = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Controls + Tiles'),
      ),
      body: Center(
        child: _UiControlsViews(),
      ),
    );
  }
}

class _UiControlsViews extends StatefulWidget {
  const _UiControlsViews();

  @override
  State<_UiControlsViews> createState() => _UiControlsViewsState();
}

enum Transportation { car, bike, airplane, boat, train }

class _UiControlsViewsState extends State<_UiControlsViews> {
  bool isDeveloper = false;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Activar modo desarrollador'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: Text('Transportation'),
          subtitle: Text('Selecciona tu medio de transporte'),
          children: [
            RadioListTile(
                title: Text('Car'),
                subtitle: Text('Transporte en coche'),
                value: Transportation.car,
                groupValue: selectTransportation,
                onChanged: (value) => setState(() {
                      selectTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: Text('Airplane'),
                subtitle: Text('Transporte en avión'),
                value: Transportation.airplane,
                groupValue: selectTransportation,
                onChanged: (value) => setState(() {
                      selectTransportation = Transportation.airplane;
                    })),
            RadioListTile(
                title: Text('Boat'),
                subtitle: Text('Transporte en barco'),
                value: Transportation.boat,
                groupValue: selectTransportation,
                onChanged: (value) => setState(() {
                      selectTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: Text('Bike'),
                subtitle: Text('Transporte en bicicleta'),
                value: Transportation.bike,
                groupValue: selectTransportation,
                onChanged: (value) => setState(() {
                      selectTransportation = Transportation.bike;
                    })),
            RadioListTile(
                title: Text('Train'),
                subtitle: Text('Transporte en tren'),
                value: Transportation.train,
                groupValue: selectTransportation,
                onChanged: (value) => setState(() {
                      selectTransportation = Transportation.train;
                    })),
          ],
        ),
      CheckboxListTile(
        title: Text('Breakfast'),
        subtitle: Text('Desayuno incluido'),
        value: wantsBreakfast,
        onChanged: (value) => setState(() {
          wantsBreakfast = !wantsBreakfast;
        }),
      ),
      CheckboxListTile(
        title: Text('Lunch'),
        subtitle: Text('Almuerzo incluido'),
        value: wantsLunch,
        onChanged: (value) => setState(() {
          wantsLunch = !wantsLunch;
        }),
      ),
      CheckboxListTile(
        title: Text('Dinner'),
        subtitle: Text('Cena incluida'),
        value: wantsDinner,
        onChanged: (value) => setState(() {
          wantsDinner = !wantsDinner;
        }),
      ),  
      ],
    );
  }
}
