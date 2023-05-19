import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/BD/gridbd.dart';
import 'package:kakuro/page%20de%20jeu/composants/boutonValider.dart';

import '../constantes.dart';
import 'composants/case.dart';
import 'composants/grille.dart';
import 'composants/appBar.dart';
import 'composants/padNumerique.dart';

class PageDeJeu extends StatefulWidget {
  final int taille;
  final void Function(bool) updateTheme;
  final AudioPlayer player;
  final bool isNightMode;
  final double initialVolume;
  final void Function(double) updateVolume;

  PageDeJeu(
    this.taille,
    this.updateTheme,
    this.player,
    this.isNightMode,
    this.initialVolume,
    this.updateVolume, {
    super.key,
  });

  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  late Grille grille = Grille(1, [], false);
  late MyPad pad = MyPad(grille: grille);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1), () {
      initializeGrid();
    });

    /*
    grille = Grille(
        4,
        [
          Case(5, true, [0, 0]),
          Case(4, false, [0, 35]),
          Case(3, false, [0, 19]),
          Case(2, false, [0, 9]),
          Case(1, false, [23, 0]),
          Case(0, false, [0, 0]),
          Case(0, false, [0, 0]),
          Case(0, false, [0, 0]),
          Case(0, false, [12, 0]),
          Case(8, false, [0, 0]),
          Case(0, false, [0, 0]),
          Case(0, false, [0, 0]),
          Case(0, false, [9, 0]),
          Case(3, false, [0, 0]),
          Case(0, false, [0, 0]),
          Case(0, false, [0, 0]),
        ],
        false);*/
  }

  Future<void> initializeGrid() async {
    grille = await GridBD().getRandomGridByLength(widget.taille);
    pad = MyPad(grille: grille);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // * Variables
    MyAppBar appBar = MyAppBar(
      updateTheme: widget.updateTheme,
      player: widget.player,
      isNightMode: widget.isNightMode,
      initialVolume: widget.initialVolume,
      updateVolume: widget.updateVolume,
    );
    BoutonValider boutonValider = const BoutonValider();

    //Affichage
    return Scaffold(
        appBar: appBar,
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Sans_titre_1.png'),
                      fit: BoxFit.cover)),
              constraints: const BoxConstraints.expand()),
          Column(
            children: [
              SizedBox(height: 0.2 * largeurEcran(context)),
              grille,
              SizedBox(height: 0.2 * largeurEcran(context)),
              Expanded(child: Container(child: pad)),
              boutonValider,
            ],
          )
        ]));
  }
}
