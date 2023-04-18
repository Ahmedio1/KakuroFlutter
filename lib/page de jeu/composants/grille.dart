import 'case.dart';

class Grille {
  List<int> taille;
  List<List<Case>> grille;
  bool estTerminee;

  Grille(this.taille, this.grille, this.estTerminee);

  // * Setters
  void setTaille(List<int> taille) {
    this.taille = taille;
  }

  void setCases(List<List<Case>> cases) {
    this.grille = cases;
  }

  void setEstTerminee(bool estTerminee) {
    this.estTerminee = estTerminee;
  }

  // * Getters
  List<int> getTaille() {
    return this.taille;
  }

  List<List<Case>> getCases() {
    return this.grille;
  }

  bool getEstTerminee() {
    return this.estTerminee;
  }
}
