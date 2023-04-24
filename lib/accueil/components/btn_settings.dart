import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/nightmode.dart';
import 'package:kakuro/volume.dart';

import '../../constantes.dart';
import 'pop_up_settings/deconnexion.dart';

class Parametres extends StatelessWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;

  const Parametres(
      {Key? key,
      required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            title: Text(
              'Paramètres',
              style: bullesTexte(context),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Passez updateVolume et initialVolume aux widgets Volume
                    Volume(
                        player: player,
                        initialVolume: initialVolume,
                        updateVolume: updateVolume),
                    const SizedBox(height: 15),
                    // Passez isNightMode au widget Nightmode
                    Nightmode(
                        updateTheme: updateTheme, isNightMode: isNightMode),
                    const SizedBox(height: 30),
                    const Deconnexion(),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: Icon(Icons.settings,
            color: Theme.of(context).colorScheme.background, size: 70),
      ),
    );
  }
}
