import 'package:flutter/foundation.dart';

class Case {
  int valeur;
  bool estBloquee;
  bool estSelectionee = false;
  List<int> infos = List.filled(2, 0); // 0: droite, 1: bas

  Case(this.valeur, this.estBloquee, this.infos, [param3]);

// * Setters
  void setValeur(int valeur) {
    this.valeur = valeur;
  }

  void setInfos(List<int> infos) {
    this.infos = infos;
  }

  void setEstBloquee(bool estBloquee) {
    this.estBloquee = estBloquee;
  }

// * Getters
  int getValeur() {
    return valeur;
  }

  List<int> getInfos() {
    return this.infos;
  }

  bool getEstBloquee() {
    return this.estBloquee;
  }
}
