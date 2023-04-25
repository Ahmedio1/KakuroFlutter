import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constantes.dart';

class Classement extends StatelessWidget {
  const Classement({Key? key}) : super(key: key);


  Widget afficherClassement(BuildContext context){
    Map<String, dynamic> scores = {                       //Ce tableau est à importer après de la base de données
      'Joueur1': 550,
      'Joueur2': 450,
      'Joueur3': 410,
      'Joueur4': 330,
      'Joueur5': 250,
      'Joueur6': 130,
      'Joueur7': 120,
    };
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Classement',
            textAlign: TextAlign.center,
            style: bullesSecondaireTexte(context),
            ),
            content: Container(
              width: 600.0,
              height: 600.0,
              child: Column(
                children: scores.entries.map((entry) => Column(
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '${entry.key} - ${entry.value} points',
                          style: bullesTexte(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // espace de 20 pixels
                  ],
                )).toList(),
              )
          ),
              backgroundColor : Color(0xFF3D5467),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0))
            ),
            actions: <Widget>[
            ],
          );
  }
  );
    return Container();
  }

  Widget build(BuildContext context) {
    return   afficherClassement(context)
    ;
  }
}