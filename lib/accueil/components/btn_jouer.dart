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
      width: 180,
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            //size: const Size(200, 200),
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            title: Text(
              'Taille de grille',
              style: bullesTexte(context),
              textAlign: TextAlign.center,
            ),
            //content: const Text("taille"),
            actions: const <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Btn4(),
                    SizedBox(height: 10),
                    Btn6(),
                    SizedBox(height: 10),
                    Btn8(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          backgroundColor: Theme.of(context).colorScheme.primary, // Couleur du fond du bouton (bleu)
        ),
        child: Row(
          children: [
            Icon(Icons.play_arrow, color: Theme.of(context).colorScheme.background, size: 40), // Logo de lecture (play) en blanc
            const SizedBox(width: 5.0), // Espacement entre le logo et le texte
            Text(
              'Jouer',
              style: bullesTexte(context), // Couleur du texte (blanc)
            ),
          ],
        ),
      ),
    );
  }
}
