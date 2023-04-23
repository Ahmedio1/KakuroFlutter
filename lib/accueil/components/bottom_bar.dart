import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/btn_profil.dart';

import 'btn_classement.dart';
import 'btn_settings.dart';

class BottomBar extends StatelessWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;

  const BottomBar(
      {Key? key,
      required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const BtnProfil(),
          const BtnClassement(),
          Parametres(
              updateTheme: updateTheme,
              player: player,
              isNightMode: isNightMode,
              initialVolume: initialVolume,
              updateVolume: updateVolume),
        ],
      ),
    );
  }
}
