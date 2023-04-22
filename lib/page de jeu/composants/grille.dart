import 'package:flutter/material.dart';

import '../../constantes.dart';
import 'case.dart';

class Grille extends StatelessWidget {
  List<int> taille;
  List<Case> grille;
  bool estTerminee;

  Grille(this.taille, this.grille, this.estTerminee);

  // * Setters
  void setTaille(List<int> taille) {
    this.taille = taille;
  }

  void setCases(List<Case> cases) {
    this.grille = cases;
  }

  void setEstTerminee(bool estTerminee) {
    this.estTerminee = estTerminee;
  }

  // * Getters
  List<int> getTaille() {
    return this.taille;
  }

  List<Case> getCases() {
    return this.grille;
  }

  bool getEstTerminee() {
    return this.estTerminee;
  }

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
    Grille grille = Grille(taille, cases, estTerminee);
    double largeur_case = 0.9 * largeurEcran(context) / 4;

    return Center(
      child: Container(
        width: 0.9 * largeurEcran(context),
        height: 0.9 * largeurEcran(context),
        color: Colors.white,
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(cases.length, (index) {
            final c = cases[index];

            // Case non jouable
            if (c.estBloquee == true) {
              return Container(
                decoration: BoxDecoration(
                    color: themeSombre.colorScheme.tertiary,
                    border:
                        Border.all(color: themeSombre.colorScheme.onSurface)),
              );

              // Case informative
            } else if (c.infos[0] != 0 || c.infos[1] != 0) {
              return Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/Case_dictatrice.png"),
                          fit: BoxFit.cover)),
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

              // Case de jeu
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
                    setState() {
                      c.estSelectionee = true;
                    }
                  },
                  style: ButtonStyle(
                      // taille du boutton
                      fixedSize: MaterialStateProperty.all(
                          Size(largeur_case, largeur_case))),
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
