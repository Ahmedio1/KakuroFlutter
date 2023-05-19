import 'package:flutter/material.dart';
import 'package:kakuro/page%20de%20jeu/composants/boutonValider.dart';

import '../constantes.dart';
import 'composants/grille.dart';
import 'composants/appBar.dart';
import 'composants/padNumerique.dart';

class PageDeJeu extends StatefulWidget {
  const PageDeJeu({super.key});

  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  @override
  Widget build(BuildContext context) {
    // * Variables
    MyAppBar appBar = const MyAppBar();
    Grille grille = Grille(4, [], false);
    MyPad pad = const MyPad();
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
