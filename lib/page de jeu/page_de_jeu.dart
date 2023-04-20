import 'package:flutter/material.dart';
import 'package:kakuro/main.dart';
import 'composants/grille.dart';
import 'composants/appBar.dart';

class PageDeJeu extends StatefulWidget {
  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  @override
  Widget build(BuildContext context) {
    //Variables
    MyAppBar appBar = const MyAppBar();
    Grille grille = Grille([3, 3], [], false);

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
          Center(child: grille)
        ]));
  }
}
