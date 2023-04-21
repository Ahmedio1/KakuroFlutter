import 'package:flutter/material.dart';

import '../../constantes.dart';

class BtnSettings extends StatelessWidget {
  const BtnSettings({super.key});

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
              'Paramètres',
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
        child: const Icon(Icons.settings, size: 50, color: Colors.white),
      ),
    );
  }
}
