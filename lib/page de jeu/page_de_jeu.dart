import 'package:flutter/material.dart';
import 'package:kakuro/page%20de%20jeu/composants/boutonValider.dart';

import '../constantes.dart';
import 'composants/case.dart';
import 'composants/grille.dart';
import 'composants/appBar.dart';
import 'composants/padNumerique.dart';

class PageDeJeu extends StatefulWidget {
  const PageDeJeu({super.key});

  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  Grille grille = Grille(
      4,
      [
        Case(5, true, [0, 0]),
        Case(4, false, [0, 23]),
        Case(3, false, [0, 12]),
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
      false);
  late MyPad pad;

  @override
  void initState() {
    super.initState();
    pad = MyPad(grille: grille);
  }

  @override
  Widget build(BuildContext context) {
    // * Variables
    MyAppBar appBar = const MyAppBar();

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
