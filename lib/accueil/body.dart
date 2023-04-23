import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/bottom_bar.dart';
import 'components/btn_jouer.dart';
import 'components/btn_regles.dart';
import 'components/title_accueil.dart';

class Body extends StatelessWidget {
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;

  const Body(
      {Key? key,
      required this.updateTheme,
      required this.player,
      required this.isNightMode,
      required this.initialVolume,
      required this.updateVolume})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fond.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(children: const [
              SizedBox(height: 40),
              TitleAccueil(),
              SizedBox(height: 90),
              BtnJouer(),
              SizedBox(height: 25),
              BtnRegles(),
            ]),
          ),
          BottomBar(
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
