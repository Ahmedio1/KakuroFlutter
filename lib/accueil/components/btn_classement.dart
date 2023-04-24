import 'package:flutter/material.dart';

import '../../constantes.dart';

class BtnClassement extends StatelessWidget {
  const BtnClassement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            title: Text(
              'Classement',
              style: bullesTexte(context),
              textAlign: TextAlign.center,
            ),
            actions: const <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: Theme.of(context).colorScheme.primary, // Couleur du fond du bouton (bleu)
        ),
        child: Icon(Icons.align_vertical_bottom_sharp,
          color: Theme.of(context).colorScheme.background, size: 70),
      ),
    );
  }
}
