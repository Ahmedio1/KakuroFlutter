import 'package:flutter/material.dart';

//import 'constantes.dart';

class Nightmode extends StatefulWidget {
  final void Function(bool) updateTheme;
  final bool isNightMode;

  const Nightmode({Key? key, required this.updateTheme, required this.isNightMode}) : super(key: key);

  @override
  _NightmodeState createState() => _NightmodeState();
}

class _NightmodeState extends State<Nightmode> {
  late bool isNightMode;

  @override
  void initState() {
    super.initState();
    isNightMode = widget.isNightMode;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Icon(Icons.dark_mode,
                color: Theme.of(context).colorScheme.primary, size: 40)),
        const SizedBox(width: 10.0),
        //Bouton on off :
        Switch(
          value: isNightMode,
          onChanged: (value) {
            setState(() {
              isNightMode = value;
            });
            widget.updateTheme(isNightMode);
          },
          activeColor: Theme.of(context).colorScheme.onSecondary,
          inactiveTrackColor: Theme.of(context).colorScheme.onBackground,
        ),
      ],
    );
  }
}
