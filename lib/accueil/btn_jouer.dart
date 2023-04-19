import 'package:flutter/material.dart';

import '../constants.dart';

class BtnJouer extends StatelessWidget {
  const BtnJouer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: kBlueColor, // Couleur du fond du bouton (bleu)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.play_arrow,
                color: Colors.white), // Logo de lecture (play) en blanc
            SizedBox(width: 8.0), // Espacement entre le logo et le texte
            Text(
              'Jouer',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 20), // Couleur du texte (blanc)
            ),
          ],
        ),
      ),
    );
  }
}
