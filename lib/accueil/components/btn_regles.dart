import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';

class BtnRegles extends StatelessWidget {
  const BtnRegles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Règles du Kakuro',
              style: bullesSecondaireTexte(context),
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Le but du jeu est de remplir la grille (c'est-à-dire toutes les cases blanches) en respectant 2 règles : \n— Le total des cases de chaque bloc doit être égal à l'indice inscrit en face ; \n— Pas de répétition : un même chiffre ne peut pas apparaître plus d'une fois dans chaque bloc.",
              style: bullesSecondaireTexte(context),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.all(10),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primary, // Couleur du fond du bouton (bleu)
        ),
        child: Text('Comment jouer ?',
            style: kakuroCase), // Couleur du texte (blanc)
      ),
    );
  }
}
