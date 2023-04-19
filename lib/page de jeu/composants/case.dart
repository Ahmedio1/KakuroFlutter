class Case {
  int position_X;
  int position_Y;
  int valeur;
  bool estBloquee;
  List<int> infos = List.filled(4, 0); // 0: haut, 1: bas, 2: gauche, 3: droite

  Case(this.position_X, this.position_Y, this.valeur, this.estBloquee,
      this.infos);

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

  void setPosition(int position_X, int position_Y) {
    this.position_X = position_X;
    this.position_Y = position_Y;
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

  int getPosition_X() {
    return this.position_X;
  }

  int getPosition_Y() {
    return this.position_Y;
  }
}
