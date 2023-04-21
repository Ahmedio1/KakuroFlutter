import 'package:flutter/material.dart';

import '../../constantes.dart';

class BtnClassement extends StatelessWidget {
  const BtnClassement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: themeSombre.colorScheme.primary,
            title: Text(
              'Classement',
              style: boutonTaille,
              textAlign: TextAlign.center,
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
          backgroundColor: themeSombre
              .colorScheme.primary, // Couleur du fond du bouton (bleu)
        ),
        child: const Icon(Icons.align_vertical_bottom_sharp,
            size: 50, color: Colors.white),
      ),
    );
  }
}
