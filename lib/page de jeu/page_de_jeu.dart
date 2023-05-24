import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kakuro/BD/gridbd.dart';
import 'package:kakuro/page%20de%20jeu/composants/boutonValider.dart';
import 'package:kakuro/page%20de%20jeu/composants/case.dart';

import '../constantes.dart';
import 'composants/Timer.dart';
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
    Key? key,
  }) : super(key: key);

  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  late Grille grille = Grille(8, [], false);
  late MyPad pad = MyPad(grille: grille);
  int boutonValiderTimerValue = 0;
  late MyTimer myTimer; // Variable to store the timer value

  @override
  void initState() {
    super.initState();
    initializeGrid();
    myTimer = MyTimer(
      timerValueCallback: (timerValue) {
        // Callback function to pass the timer value to BoutonValider
        setState(() {
          boutonValiderTimerValue = timerValue;
        });
      },
    );
  }

  Future<void> initializeGrid() async {
    grille = await GridBD().getRandomGridByLength(widget.taille);
    pad = MyPad(grille: grille);
    setState(() {
      boutonValiderTimerValue = 0; // Reset the timer value
    });
  }

  @override
  Widget build(BuildContext context) {
    MyAppBar appBar = MyAppBar(
      updateTheme: widget.updateTheme,
      player: widget.player,
      isNightMode: widget.isNightMode,
      initialVolume: widget.initialVolume,
      updateVolume: widget.updateVolume,
      timer: myTimer, // Pass the instance of MyTimer to appBar
    );

    BoutonValider boutonValider = BoutonValider(
      grille,
      timerValueCallback: () =>
          boutonValiderTimerValue, // Pass the timer value to BoutonValider
    );

    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fond.png'),
                fit: BoxFit.cover,
              ),
            ),
            constraints: const BoxConstraints.expand(),
          ),
          Column(
            children: [
              SizedBox(height: 0.2 * largeurEcran(context)),
              grille,
              SizedBox(height: 0.1 * largeurEcran(context)),
              Expanded(child: Container(child: pad)),
              boutonValider,
            ],
          ),
        ],
      ),
    );
  }
}
