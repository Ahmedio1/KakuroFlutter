import 'package:flutter/material.dart';
import 'package:kakuro/constantes.dart';

import 'pop_up_taille/btn_4.dart';
import 'pop_up_taille/btn_6.dart';
import 'pop_up_taille/btn_8.dart';

class BtnJouer extends StatelessWidget {
  const BtnJouer({
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
            //size: const Size(200, 200),
            backgroundColor: themeSombre.colorScheme.primary,
            title: Text(
              'Taille de grille',
              style: bullesSecondaireTexte(context),
              textAlign: TextAlign.center,
            ),
            //content: const Text("taille"),
            actions: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Btn4(),
                    SizedBox(height: 8),
                    Btn6(),
                    SizedBox(height: 8),
                    Btn8(),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: themeSombre
              .colorScheme.primary, // Couleur du fond du bouton (bleu)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.play_arrow,
                color: Colors.white), // Logo de lecture (play) en blanc
            const SizedBox(width: 8.0), // Espacement entre le logo et le texte
            Text(
              'Jouer',
              style: bullesSecondaireTexte(context), // Couleur du texte (blanc)
            ),
          ],
        ),
      ),
    );
  }
}
