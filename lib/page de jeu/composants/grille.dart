import 'package:flutter/material.dart';

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

  void changerValeurCase(int index, int valeur) {
    widget.cases[index].valeur = valeur;
  }

  @override
  Widget build(BuildContext context) {
    List<Case> cases = [
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
    ];

    void selectionnerCase(int index) {
      widget.caseSelectionnee = index;
      cases[index].estSelectionee = true;
      print("Case selectionnee : " + index.toString());
    }

    var size = 4;

    double largeurCase = 0.9 * largeurEcran(context) / size;

    //grille de jeu
    Grille grille = Grille(size, cases, false);

    return Center(
      child: Container(
        width: 0.9 * largeurEcran(context),
        height: 0.9 * largeurEcran(context),
        color: Colors.white,
        child: GridView.count(
          addRepaintBoundaries:
              false, //pour ne pas avoir une modification de bordures
          crossAxisCount: size, //retour a la ligne a partir de size case
          children: List.generate(cases.length, (indexGrille) {
            final c = cases[indexGrille];

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
