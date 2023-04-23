import 'package:flutter/material.dart';

import '../../../constantes.dart';

class BtnPseudo extends StatelessWidget {
  const BtnPseudo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Pseudo : ', style: bullesSecondaireTexte(context)),
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '',
            style: bullesSecondaireTexte(context),
          ),
        ),
      ],
    );
  }
}
