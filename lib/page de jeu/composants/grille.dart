import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kakuro/page%20de%20jeu/composants/padNumerique.dart';

import '../../constantes.dart';
import 'case.dart';

class Grille extends StatefulWidget {
  int taille;
  List<Case> cases;
  bool estTerminee;
  int caseSelectionnee = -1;

  Grille(this.taille, this.cases, this.estTerminee, {super.key});

  @override
  State<Grille> createState() => _GrilleState();
}

class _GrilleState extends State<Grille> {
  late Timer _timer;
  // * Getters
  int getTaille() {
    return this.widget.taille;
  }

  List<Case> getCases() {
    return this.widget.cases;
  }

  bool getEstTerminee() {
    return this.widget.estTerminee;
  }

  Grille getGrille() {
    return this.widget;
  }

  void selectionnerCase(int index) {
    widget.caseSelectionnee = index;
    widget.cases[index].estSelectionee = true;
    print("Case selectionnee : " + index.toString());
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        setState(() {
          // update your state here
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // dispose of the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double largeurCase = 0.9 * largeurEcran(context) / widget.taille;

    //grille de jeu

    return Center(
      child: Container(
        width: 0.9 * largeurEcran(context),
        height: 0.9 * largeurEcran(context),
        color: Colors.white,
        child: GridView.count(
          addRepaintBoundaries:
              false, //pour ne pas avoir une modification de bordures
          crossAxisCount:
              widget.taille, //retour a la ligne a partir de widget.taille case
          children: List.generate(widget.cases.length, (indexGrille) {
            final c = widget.cases[indexGrille];

            // ! Case non jouable
            if (c.estBloquee == true) {
              return Container(
                decoration: BoxDecoration(
                    color: themeSombre.colorScheme.tertiary,
                    border:
                        Border.all(color: themeSombre.colorScheme.onSurface)),
              );

              // ! Case informative
            } else if (c.infos[0] != 0 || c.infos[1] != 0) {
              return Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/Case_dictatrice.png"),
                  )),
                ),
                GridView.count(crossAxisCount: 2, children: [
                  const Text(""),
                  Center(
                      child: c.infos[0] != 0
                          ? Text(c.infos[0].toString(), style: kakuroDictateur)
                          : const Text("")),
                  Center(
                      child: c.infos[1] != 0
                          ? Text(c.infos[1].toString(), style: kakuroDictateur)
                          : const Text("")),
                  const Text("")
                ])
              ]);

              // ! Case de jeu
            } else {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: c.estSelectionee
                      ? themeSombre.colorScheme.secondary //selectionee
                      : themeSombre.colorScheme.background, //non selectionee
                ),
                child: Center(
                    child: TextButton(
                  onPressed: () {
                    setState(() {
                      print(c.valeur);
                      selectionnerCase(indexGrille);
                    });
                  },
                  style: ButtonStyle(
                      // taille du boutton
                      fixedSize: MaterialStateProperty.all(
                          Size(largeurCase, largeurCase))),
                  child: c.valeur == 0
                      ? const Text("")
                      : Text(
                          c.getValeur().toString(),
                          style: kakuroCase,
                        ),
                )),
              );
            }
          }),
        ),
      ),
    );
  }
}
