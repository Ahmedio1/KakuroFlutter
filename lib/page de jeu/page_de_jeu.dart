import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/BD/gridbd.dart';
import 'package:kakuro/page%20de%20jeu/composants/boutonValider.dart';
import 'package:kakuro/page%20de%20jeu/composants/case.dart';

import '../constantes.dart';
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
    //GridBD().addGrid(grille); //Decommenter cette ligne pour l'ajout de la grille dans la Base de données

    

  //Test Izaak grille 4*4
    /*grille = Grille(
        4, //Taille
        [
          Case(5, true, [0, 0]), //(valeur pour cases inaccessibles, estVide, [sommeLigne, sommeColonne])
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

      //Utiliser ce code pour l'ajout d'une grille 6*6 dans la base de données : 
      /*
      grille=Grille(
        6,
        [
          Case(0, true, [0, 0]), //(valeur pour cases inaccessibles, estVide, [sommeLigne, sommeColonne])
          Case(0, false, [0, 6]),
          Case(0, false, [0, 14]),
          Case(0, false, [0, 32]),
          Case(0, true, [0, 0]),
          Case(0, true, [0, 0]),

          Case(0, false, [16, 0]),
          Case(0, false, [0, 0]),
          Case(0, false, [0, 0]),
          Case(9, false, [0, 0]),
          Case(0, false, [0, 27]),
          Case(0, false, [0, 26]),

          Case(0, false, [32, 0]),
          Case(0, false, [0, 0]),
          Case(7, false, [0, 0]),
          Case(5, false, [0, 0]),
          Case(8, false, [0, 0]),
          Case(9, false, [0, 0]),

          Case(0, false, [17, 0]),
          Case(1, false, [0, 0]),
          Case(3, false, [0, 0]),
          Case(0, false, [0, 0]),
          Case(7, false, [0, 0]),
          Case(0, false, [0, 0]),

          Case(0, true, [0, 0]),
          Case(0, true, [0, 0]),
          Case(0, false, [16, 0]),
          Case(8, false, [0, 0]),
          Case(6, false, [0, 0]),
          Case(0, false, [0, 0]),

          Case(0, true, [0, 0]),
          Case(0, true, [0, 0]),
          Case(0, false, [24, 0]),
          Case(0, false, [0, 0]),
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
                      image: AssetImage('assets/images/fond.png'),
                      fit: BoxFit.cover)),
              constraints: const BoxConstraints.expand()),
          Column(
            children: [
              SizedBox(height: 0.2 * MediaQuery.of(context).size.width), // Utilisation de la largeur de l'écran comme hauteur relative
              grille, // Utilisation d'un widget Expanded pour prendre tout l'espace disponible
              SizedBox(height: 0.1 * MediaQuery.of(context).size.width), // Utilisation de la largeur de l'écran comme hauteur relative
              Expanded(child: Container(child: pad)), // Utilisation d'un widget Expanded pour prendre tout l'espace disponible
              boutonValider,
            ],
          )
        ]));
  }
}
