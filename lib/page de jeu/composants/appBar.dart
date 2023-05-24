import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/btn_settings.dart';
import '../../constantes.dart';
import 'Timer.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;
  final MyTimer timer;

  const MyAppBar(
      {Key? key,
      required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume,
      required this.timer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        //elevation: 10, // ombre
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.home),
                    color: Theme.of(context).colorScheme.onPrimary,
                    iconSize: 40,
                    onPressed: () {
                      //On retourne à la page d'accueil
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              //BtnProfil(),
              Expanded(
                child: Center(child: timer),
              ),
              Expanded(
                child: Center(
                  child: Parametres(
                      updateTheme: updateTheme,
                      player: player,
                      isNightMode: isNightMode,
                      initialVolume: initialVolume,
                      updateVolume: (volume) {
                        updateVolume(volume);
                      },
                      buttonSize: 40,
                      hasRoundedContainer: false),
                ),
              ),
            ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
