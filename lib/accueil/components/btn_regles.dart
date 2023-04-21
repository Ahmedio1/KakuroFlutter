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
            backgroundColor: themeSombre.colorScheme.primary,
            title: Text(
              'Règles du Kakuro',
              style: boutonTaille,
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Le but du jeu est de remplir la grille (c'est-à-dire toutes les cases blanches) en respectant 2 règles : \n— Le total des cases de chaque bloc doit être égal à l'indice inscrit en face ; \n— Pas de répétition : un même chiffre ne peut pas apparaître plus d'une fois dans chaque bloc.",
              style: boutonTaille,
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
          padding: const EdgeInsets.all(10),
          backgroundColor: themeSombre
              .colorScheme.primary, // Couleur du fond du bouton (bleu)
        ),
        child: Text('Comment jouer ?',
            style: commentJouer), // Couleur du texte (blanc)
      ),
    );
  }
}
