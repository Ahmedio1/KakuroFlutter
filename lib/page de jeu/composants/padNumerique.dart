import 'package:flutter/material.dart';
import 'package:kakuro/page%20de%20jeu/composants/grille.dart';
import '../../constantes.dart';

class MyPad extends StatefulWidget {
  const MyPad({super.key});

  @override
  _MyPadState createState() => _MyPadState();
}

class _MyPadState extends State<MyPad> {
  @override
  Widget build(BuildContext context) {
    // * COMPOSANTS
    Gomme gomme = const Gomme();
    Reset reset = const Reset();
    Indice indice = const Indice();

    Grille grille = Grille(4, [], false);

    void changerValeurCase(int index, int valeur) {
      if (grille.caseSelectionnee != -1) {
        grille.cases[index].valeur = valeur;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 6,
        children: List.generate(12, (indexPad) {
          if (indexPad < 9) {
            return Container(
                width: 0.1 * largeurEcran(context),
                height: 0.1 * largeurEcran(context),
                decoration: BoxDecoration(
                    color: themeSombre.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: themeSombre.colorScheme.secondary, width: 2)),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          print(indexPad + 1);
                          print(grille.caseSelectionnee);
                          setState(() {
                            changerValeurCase(
                                grille.caseSelectionnee, indexPad);
                          });
                        },
                        child: Text(
                          (indexPad + 1).toString(),
                          style: bullesSecondaireTexte(context),
                        ))));
          } else if (indexPad == 9) {
            return indice;
          } else if (indexPad == 10) {
            return gomme;
          } else {
            return reset;
          }
        }),
      ),
    );
  }
}

class Gomme extends StatefulWidget {
  const Gomme({super.key});

  @override
  _GommeState createState() => _GommeState();
}

class _GommeState extends State<Gomme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2 * largeurEcran(context),
      height: 0.2 * largeurEcran(context),
      decoration: BoxDecoration(
        color: themeSombre.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: themeSombre.colorScheme.secondary, width: 2),
      ),
      child: Stack(children: [
        Center(
          child: Container(
            width: 0.1 * largeurEcran(context),
            height: 0.1 * largeurEcran(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/gomme.png"),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("GOMME");
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                  0.2 * largeurEcran(context), 0.2 * largeurEcran(context)),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: null)
      ]),
    );
  }
}

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  void resetGrid(grille) {
    for (int i = 0; i < grille.cases.length; i++) {
      if (grille.cases[i].estBloquee == false &&
          grille.cases[i].infos == [0, 0]) {
        grille.cases[i].valeur = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2 * largeurEcran(context),
      height: 0.2 * largeurEcran(context),
      decoration: BoxDecoration(
        color: themeSombre.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: themeSombre.colorScheme.secondary, width: 2),
      ),
      child: Stack(children: [
        Center(
          child: Icon(
            Icons.refresh,
            size: 0.1 * largeurEcran(context),
            color: themeSombre.colorScheme.onPrimary,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("RESET");
              setState(() {
                resetGrid(grille);
              });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                  0.2 * largeurEcran(context), 0.2 * largeurEcran(context)),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: null)
      ]),
    );
  }
}

class Indice extends StatefulWidget {
  const Indice({super.key});

  @override
  _IndiceState createState() => _IndiceState();
}

class _IndiceState extends State<Indice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2 * largeurEcran(context),
      height: 0.2 * largeurEcran(context),
      decoration: BoxDecoration(
        color: themeSombre.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: themeSombre.colorScheme.secondary, width: 2),
      ),
      child: Stack(children: [
        Center(
          child: Container(
            width: 0.1 * largeurEcran(context),
            height: 0.1 * largeurEcran(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/indice.png"),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("INDICE");
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                  0.2 * largeurEcran(context), 0.2 * largeurEcran(context)),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: null)
      ]),
    );
  }
}
