import 'package:flutter/material.dart';

import 'constantes.dart';

class Deconnexion extends StatelessWidget {
  const Deconnexion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              'Se déconnecter',
              style: bullesSecondaireTexte(context),
            )
        )
      ],
    );
  }
}
