import 'package:flutter/material.dart';
import '../../constantes.dart';

class MyPad extends StatefulWidget {
  @override
  _MyPadState createState() => _MyPadState();
}

class _MyPadState extends State<MyPad> {
  @override
  Widget build(BuildContext context) {
    // * COMPOSANTS
    Gomme gomme = Gomme();

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 6,
        children: List.generate(12, (index) {
          if (index < 10) {
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
                          print(index + 1);
                        },
                        child: Text(
                          (index + 1).toString(),
                          style: bullesSecondaireTexte(context),
                        ))));
          } else if (index == 10) {
            return gomme;
          } else {
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
                    print(index + 1);
                  },
                  child: Text(
                    (index + 1).toString(),
                    style: bullesSecondaireTexte(context),
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}

class Gomme extends StatefulWidget {
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
