import 'package:flutter/material.dart';
import '../constantes.dart';
import 'composants/grille.dart';
import 'composants/appBar.dart';
import 'composants/padNumerique.dart';

class PageDeJeu extends StatefulWidget {
  const PageDeJeu({super.key});

  @override
  _PageDeJeuState createState() => _PageDeJeuState();
}

class _PageDeJeuState extends State<PageDeJeu> {
  @override
  Widget build(BuildContext context) {
    //Variables
    MyAppBar appBar = const MyAppBar();
    Grille grille = Grille([3, 3], [], false);
    MyPad pad = MyPad();

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
          Column(
            children: [
              SizedBox(height: 0.2 * largeurEcran(context)),
              grille,
              SizedBox(height: 0.2 * largeurEcran(context)),
              Expanded(child: Container(child: pad)),
              Padding(
                padding: EdgeInsets.only(bottom: 0.18 * largeurEcran(context)),
                child: TextButton(
                    style: TextButton.styleFrom(
                        elevation: 20,
                        backgroundColor: themeSombre.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.08 * largeurEcran(context),
                            vertical: 0.03 * largeurEcran(context))),
                    onPressed: () {
                      print("Valider");
                    },
                    child:
                        Text('Valider', style: bullesSecondaireTexte(context))),
              )
            ],
          )
        ]));
  }
}
