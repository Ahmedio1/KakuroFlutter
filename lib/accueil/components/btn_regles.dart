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
      width: 200,
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            title: Text(
              'Règles du Kakuro',
              style: bullesTexte(context),
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Le but du jeu est de remplir la grille (c'est-à-dire toutes les cases blanches) en respectant 2 règles : \n— Le total des cases de chaque bloc doit être égal à l'indice inscrit en face ; \n— Pas de répétition : un même chiffre ne peut pas apparaître plus d'une fois dans chaque bloc.",
              style: kakuroPad(context),
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
            borderRadius: BorderRadius.circular(35.0),
          ),
          padding: const EdgeInsets.all(10),
          backgroundColor: Theme.of(context).colorScheme.primary, // Couleur du fond du bouton (bleu)
        ),
        child: Text('Comment jouer ?',
            style: kakuroPad(context),
            textAlign: TextAlign.center
            ),
      ),
    );
  }
}
