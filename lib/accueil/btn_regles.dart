import 'package:flutter/material.dart';

import '../constants.dart';

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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: kBlueColor, // Couleur du fond du bouton (bleu)
        ),
        child: const Text(
          'Comment jouer ?',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 10), // Couleur du texte (blanc)
        ),
      ),
    );
  }
}
