/*import 'package:flutter/material.dart';

import '../../constants.dart';
import 'pop_up/btn_4.dart';
import 'pop_up/btn_6.dart';
import 'pop_up/btn_8.dart';

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
            backgroundColor: kBlueColor,
            title: const Text(
              'Taille de grille',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  color: Colors.white,
                  backgroundColor: kBlueColor),
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
}*/