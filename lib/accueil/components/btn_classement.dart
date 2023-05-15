import 'package:flutter/material.dart';

import '../../constantes.dart';

class BtnClassement extends StatelessWidget {
  /*final int tailleGrille;
  final int tempsResolution;
  final int echecs;*/


  const BtnClassement({
    Key? key,
    /*required this.tailleGrille,
    required this.tempsResolution,
    required this.echecs,*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    // Calculer les points en fonction de la taille de la grille
    int pointsTailleGrille = tailleGrille * 10;

    // Calculer les points en fonction de la vitesse de résolution
    int pointsVitesseResolution = 100 ~/ tempsResolution;

    // Calculer les points en fonction des échecs
    int pointsEchecs = -echecs * 5;

    // Calculer le total des points
    int totalPoints = pointsTailleGrille + pointsVitesseResolution + pointsEchecs;
    */
    Map<String, dynamic> scores = {                       //Ce tableau est à importer après de la base de données
      'Joueur1': 550,
      'Joueur2': 450,
      'Joueur3': 410,
      'Joueur4': 330,
      'Joueur5': 250,
      'Joueur6': 130,
      'Joueur7': 120,
    };

    // Tri des scores par ordre décroissant
    final sortedScores = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Container(
      // Le reste du code reste inchangé...
      alignment: Alignment.center,
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
      // Affichage du classement dans la fenêtre de dialogue
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          title: Text(
            'Classement',
            style: bullesTexte(context),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sortedScores.length,
              itemBuilder: (BuildContext context, int index) {
                final entry = sortedScores[index];
                final joueur = entry.key;
                final points = entry.value;

                return ListTile(
                  title: Text(
                    '$joueur - $points points',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                );
              },
            ),
          ),
            actions: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [],
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primary, // Couleur du fond du bouton (bleu)
        ),
        child: Icon(Icons.align_vertical_bottom_sharp,
            color: Theme.of(context).colorScheme.background, size: 70),
      ),
    );
  }
}
