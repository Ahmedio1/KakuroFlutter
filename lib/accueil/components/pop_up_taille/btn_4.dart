import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';

import '../../../page de jeu/page_de_jeu.dart';

class Btn4 extends StatelessWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;
  const Btn4({
    super.key,
    required this.updateTheme,
    required this.player,
    required this.isNightMode,
    required this.initialVolume,
    required this.updateVolume,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: bullesSecondaireTexte(context),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageDeJeu(
                      4,
                      updateTheme,
                      player,
                      isNightMode,
                      initialVolume,
                      updateVolume,
                    )));
      },
      child: Text('4 x 4', style: bullesSecondaireTexte(context)),
    );
  }
}
