import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/accueil/components/bottom_bar.dart';
import 'components/btn_jouer.dart';
import 'components/btn_regles.dart';
import 'components/title_accueil.dart';
import 'package:kakuro/constantes.dart';

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
    //print(MediaQuery.of(context).size.height);
    //print(MediaQuery.of(context).size.width);
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
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double hauteurEcran = constraints.maxHeight;
                return Column(
                  children: [
                    SizedBox(
                        height: (120 *
                            hauteurEcran /
                            900)), //900 = hauteur de l'écran de base avec lequel j'ai travaillé : galaxy A52S
                    const TitleAccueil(),
                    SizedBox(height: (150 * hauteurEcran / 900)),
                    const BtnJouer(),
                    SizedBox(height: (20 * hauteurEcran / 900)),
                    const BtnRegles(),
                  ],
                );
              },
            ),
          ),
          BottomBar(
            updateTheme: updateTheme,
            player: player,
            isNightMode: isNightMode,
            initialVolume: initialVolume,
            updateVolume: updateVolume,
          ),
        ],
      ),
    );
  }
}
