import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      Case(1, 1, 5, true, [0, 0]),
      Case(1, 2, 4, false, [2, 0]),
      Case(1, 3, 3, false, [2, 0]),
      Case(2, 1, 2, false, [0, 3]),
      Case(2, 2, 1, false, [0, 0]),
      Case(2, 3, 0, false, [0, 0]),
      Case(3, 1, 0, false, [0, 3]),
      Case(3, 2, 0, false, [0, 0]),
      Case(3, 3, 0, false, [0, 0]),
    ];
    Grille grille = Grille(taille, cases, estTerminee);

    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.blue,
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(6, (index) {
            final c = cases[index];
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  c.getValeur().toString(),
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
